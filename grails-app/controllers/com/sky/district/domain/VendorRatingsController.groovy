package com.sky.district.domain

class VendorRatingsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [vendorRatingsInstanceList: VendorRatings.list(params), vendorRatingsInstanceTotal: VendorRatings.count()]
    }

    def create = {
        def vendorRatingsInstance = new VendorRatings()
        vendorRatingsInstance.properties = params
        return [vendorRatingsInstance: vendorRatingsInstance]
    }

    def save = {
        def vendorRatingsInstance = new VendorRatings(params)
        if (vendorRatingsInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'vendorRatings.label', default: 'VendorRatings'), vendorRatingsInstance.id])}"
            redirect(action: "show", id: vendorRatingsInstance.id)
        }
        else {
            render(view: "create", model: [vendorRatingsInstance: vendorRatingsInstance])
        }
    }

    def show = {
        def vendorRatingsInstance = VendorRatings.get(params.id)
        if (!vendorRatingsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vendorRatings.label', default: 'VendorRatings'), params.id])}"
            redirect(action: "list")
        }
        else {
            [vendorRatingsInstance: vendorRatingsInstance]
        }
    }

    def edit = {
        def vendorRatingsInstance = VendorRatings.get(params.id)
        if (!vendorRatingsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vendorRatings.label', default: 'VendorRatings'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [vendorRatingsInstance: vendorRatingsInstance]
        }
    }

    def update = {
        def vendorRatingsInstance = VendorRatings.get(params.id)
        if (vendorRatingsInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (vendorRatingsInstance.version > version) {
                    
                    vendorRatingsInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'vendorRatings.label', default: 'VendorRatings')] as Object[], "Another user has updated this VendorRatings while you were editing")
                    render(view: "edit", model: [vendorRatingsInstance: vendorRatingsInstance])
                    return
                }
            }
            vendorRatingsInstance.properties = params
            if (!vendorRatingsInstance.hasErrors() && vendorRatingsInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'vendorRatings.label', default: 'VendorRatings'), vendorRatingsInstance.id])}"
                redirect(action: "show", id: vendorRatingsInstance.id)
            }
            else {
                render(view: "edit", model: [vendorRatingsInstance: vendorRatingsInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vendorRatings.label', default: 'VendorRatings'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def vendorRatingsInstance = VendorRatings.get(params.id)
        if (vendorRatingsInstance) {
            try {
                vendorRatingsInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'vendorRatings.label', default: 'VendorRatings'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'vendorRatings.label', default: 'VendorRatings'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vendorRatings.label', default: 'VendorRatings'), params.id])}"
            redirect(action: "list")
        }
    }
}
