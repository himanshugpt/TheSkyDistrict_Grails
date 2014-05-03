package com.sky.district.domain

class ApplicationProviderController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [applicationProviderInstanceList: ApplicationProvider.list(params), applicationProviderInstanceTotal: ApplicationProvider.count()]
    }

    def create = {
        def applicationProviderInstance = new ApplicationProvider()
        applicationProviderInstance.properties = params
        return [applicationProviderInstance: applicationProviderInstance]
    }

    def save = {
        def applicationProviderInstance = new ApplicationProvider(params)
        if (applicationProviderInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'applicationProvider.label', default: 'ApplicationProvider'), applicationProviderInstance.id])}"
            redirect(action: "show", id: applicationProviderInstance.id)
        }
        else {
            render(view: "create", model: [applicationProviderInstance: applicationProviderInstance])
        }
    }

    def show = {
        def applicationProviderInstance = ApplicationProvider.get(params.id)
        if (!applicationProviderInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'applicationProvider.label', default: 'ApplicationProvider'), params.id])}"
            redirect(action: "list")
        }
        else {
            [applicationProviderInstance: applicationProviderInstance]
        }
    }

    def edit = {
        def applicationProviderInstance = ApplicationProvider.get(params.id)
        if (!applicationProviderInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'applicationProvider.label', default: 'ApplicationProvider'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [applicationProviderInstance: applicationProviderInstance]
        }
    }

    def update = {
        def applicationProviderInstance = ApplicationProvider.get(params.id)
        if (applicationProviderInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (applicationProviderInstance.version > version) {
                    
                    applicationProviderInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'applicationProvider.label', default: 'ApplicationProvider')] as Object[], "Another user has updated this ApplicationProvider while you were editing")
                    render(view: "edit", model: [applicationProviderInstance: applicationProviderInstance])
                    return
                }
            }
            applicationProviderInstance.properties = params
            if (!applicationProviderInstance.hasErrors() && applicationProviderInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'applicationProvider.label', default: 'ApplicationProvider'), applicationProviderInstance.id])}"
                redirect(action: "show", id: applicationProviderInstance.id)
            }
            else {
                render(view: "edit", model: [applicationProviderInstance: applicationProviderInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'applicationProvider.label', default: 'ApplicationProvider'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def applicationProviderInstance = ApplicationProvider.get(params.id)
        if (applicationProviderInstance) {
            try {
                applicationProviderInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'applicationProvider.label', default: 'ApplicationProvider'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'applicationProvider.label', default: 'ApplicationProvider'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'applicationProvider.label', default: 'ApplicationProvider'), params.id])}"
            redirect(action: "list")
        }
    }
}
