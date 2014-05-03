package com.sky.district.domain

class BetaInviteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [betaInviteInstanceList: BetaInvite.list(params), betaInviteInstanceTotal: BetaInvite.count()]
    }

    def create = {
        def betaInviteInstance = new BetaInvite()
        betaInviteInstance.properties = params
        return [betaInviteInstance: betaInviteInstance]
    }

    def save = {
        def betaInviteInstance = new BetaInvite(params)
        if (betaInviteInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'betaInvite.label', default: 'BetaInvite'), betaInviteInstance.id])}"
            redirect(action: "show", id: betaInviteInstance.id)
        }
        else {
            render(view: "create", model: [betaInviteInstance: betaInviteInstance])
        }
    }

    def show = {
        def betaInviteInstance = BetaInvite.get(params.id)
        if (!betaInviteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'betaInvite.label', default: 'BetaInvite'), params.id])}"
            redirect(action: "list")
        }
        else {
            [betaInviteInstance: betaInviteInstance]
        }
    }

    def edit = {
        def betaInviteInstance = BetaInvite.get(params.id)
        if (!betaInviteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'betaInvite.label', default: 'BetaInvite'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [betaInviteInstance: betaInviteInstance]
        }
    }

    def update = {
        def betaInviteInstance = BetaInvite.get(params.id)
        if (betaInviteInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (betaInviteInstance.version > version) {
                    
                    betaInviteInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'betaInvite.label', default: 'BetaInvite')] as Object[], "Another user has updated this BetaInvite while you were editing")
                    render(view: "edit", model: [betaInviteInstance: betaInviteInstance])
                    return
                }
            }
            betaInviteInstance.properties = params
            if (!betaInviteInstance.hasErrors() && betaInviteInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'betaInvite.label', default: 'BetaInvite'), betaInviteInstance.id])}"
                redirect(action: "show", id: betaInviteInstance.id)
            }
            else {
                render(view: "edit", model: [betaInviteInstance: betaInviteInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'betaInvite.label', default: 'BetaInvite'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def betaInviteInstance = BetaInvite.get(params.id)
        if (betaInviteInstance) {
            try {
                betaInviteInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'betaInvite.label', default: 'BetaInvite'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'betaInvite.label', default: 'BetaInvite'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'betaInvite.label', default: 'BetaInvite'), params.id])}"
            redirect(action: "list")
        }
    }
}
