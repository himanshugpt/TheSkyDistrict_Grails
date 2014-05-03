package com.sky.district.domain

class VendorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [vendorInstanceList: Vendor.list(params), vendorInstanceTotal: Vendor.count()]
    }

    def create = {
        def vendorInstance = new Vendor()
        vendorInstance.properties = params
        return [vendorInstance: vendorInstance]
    }

    def save = {
      
        
		def address = new Address(params);
		address.save();
		params.put "address", address
		
		def vendorInstance = new Vendor(params)
		vendorInstance.address = address;
		//vendorInstance.save();
        if (vendorInstance.save(flush: true)) {
			
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'vendor.label', default: 'Vendor'), vendorInstance.id])}"
            redirect(action: "uploadLogo", id: vendorInstance.id)
        }
       else {
            render(view: "create", model: [vendorInstance: vendorInstance])
        }
    }
	
	def uploadLogo = {
		def vendorInstance = Vendor.get(params.id)
		//redirect(uri: "/vendor/upload_logo.gsp?id=${params.id}",id: params.id)
		render (view: "upload_logo",model: [vendorInstance: vendorInstance]);
	}

    def show = {
        def vendorInstance = Vendor.get(params.id)
        if (!vendorInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vendor.label', default: 'Vendor'), params.id])}"
            redirect(action: "list")
        }
        else {
            [vendorInstance: vendorInstance]
        }
    }

    def edit = {
        def vendorInstance = Vendor.get(params.id)
        if (!vendorInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vendor.label', default: 'Vendor'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [vendorInstance: vendorInstance]
        }
    }
	
	def addComment={
		def vendorInstance = Vendor.get(params.id)
		def user = session.user
		vendorInstance.addComment(user,params.comments);
		vendorInstance.save();
		redirect(action: "show", id: vendorInstance.id)
	}
	
	def upload_avatar = {
		//def user = User.current(session)  // or however you select the current user
		def vendr = Vendor.get(params.id);
		// Get the avatar file from the multi-part request
		def f = request.getFile('avatar')
	  
		// List of OK mime-types
		def okcontents = ['image/png', 'image/jpeg', 'image/gif']
		if (! okcontents.contains(f.getContentType())) {
		  flash.message = "Avatar must be one of: ${okcontents}"
		  render(view:'select_avatar', model:[vendr:vendr])
		  return;
		}
	  
		// Save the image and mime type
		vendr.avatar = f.getBytes()
		vendr.avatarType = f.getContentType()
		//log.info("File uploaded: " + user.avatarType)
	  
		// Validation works, will check if the image is too big
		vendr.save()
		flash.message = "Avatar (${vendr.avatarType}, ${vendr.avatar.size()} bytes) uploaded."
		redirect(action:'show',id: 10)
	  }
	
	def avatar_image = {
		def vndr = Vendor.get(params.id)
		if (!vndr || !vndr.avatar || !vndr.avatarType) {
		  response.sendError(404)
		  return;
		}
		response.setContentType(vndr.avatarType)
		response.setContentLength(vndr.avatar.size())
		OutputStream out = response.getOutputStream();
		out.write(vndr.avatar);
		out.close();
	  }
	

    def update = {
        def vendorInstance = Vendor.get(params.id)
        if (vendorInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (vendorInstance.version > version) {
                    
                    vendorInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'vendor.label', default: 'Vendor')] as Object[], "Another user has updated this Vendor while you were editing")
                    render(view: "edit", model: [vendorInstance: vendorInstance])
                    return
                }
            }
            vendorInstance.properties = params
            if (!vendorInstance.hasErrors() && vendorInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'vendor.label', default: 'Vendor'), vendorInstance.id])}"
                redirect(action: "show", id: vendorInstance.id)
            }
            else {
                render(view: "edit", model: [vendorInstance: vendorInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vendor.label', default: 'Vendor'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def vendorInstance = Vendor.get(params.id)
        if (vendorInstance) {
            try {
                vendorInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'vendor.label', default: 'Vendor'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'vendor.label', default: 'Vendor'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vendor.label', default: 'Vendor'), params.id])}"
            redirect(action: "list")
        }
    }
}
