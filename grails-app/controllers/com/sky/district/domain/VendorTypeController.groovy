package com.sky.district.domain

class VendorTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [vendorTypeInstanceList: VendorType.list(params), vendorTypeInstanceTotal: VendorType.count()]
    }

    def create = {
        def vendorTypeInstance = new VendorType()
        vendorTypeInstance.properties = params
        return [vendorTypeInstance: vendorTypeInstance]
    }

    def save = {
        def vendorTypeInstance = new VendorType(params)
        if (vendorTypeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'vendorType.label', default: 'VendorType'), vendorTypeInstance.id])}"
            redirect(action: "show", id: vendorTypeInstance.id)
        }
        else {
            render(view: "create", model: [vendorTypeInstance: vendorTypeInstance])
        }
    }

    def show = {
        def vendorTypeInstance = VendorType.get(params.id)
        if (!vendorTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vendorType.label', default: 'VendorType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [vendorTypeInstance: vendorTypeInstance]
        }
    }

    def edit = {
        def vendorTypeInstance = VendorType.get(params.id)
        if (!vendorTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vendorType.label', default: 'VendorType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [vendorTypeInstance: vendorTypeInstance]
        }
    }

    def update = {
        def vendorTypeInstance = VendorType.get(params.id)
        if (vendorTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (vendorTypeInstance.version > version) {
                    
                    vendorTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'vendorType.label', default: 'VendorType')] as Object[], "Another user has updated this VendorType while you were editing")
                    render(view: "edit", model: [vendorTypeInstance: vendorTypeInstance])
                    return
                }
            }
            vendorTypeInstance.properties = params
            if (!vendorTypeInstance.hasErrors() && vendorTypeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'vendorType.label', default: 'VendorType'), vendorTypeInstance.id])}"
                redirect(action: "show", id: vendorTypeInstance.id)
            }
            else {
                render(view: "edit", model: [vendorTypeInstance: vendorTypeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vendorType.label', default: 'VendorType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def vendorTypeInstance = VendorType.get(params.id)
        if (vendorTypeInstance) {
            try {
                vendorTypeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'vendorType.label', default: 'VendorType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'vendorType.label', default: 'VendorType'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vendorType.label', default: 'VendorType'), params.id])}"
            redirect(action: "list")
        }
    }
}
