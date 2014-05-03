package com.sky.district.domain

class CouponController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [couponInstanceList: Coupon.list(params), couponInstanceTotal: Coupon.count()]
    }

    def create = {
        def couponInstance = new Coupon()
        couponInstance.properties = params
        return [couponInstance: couponInstance]
    }

    def save = {
        def couponInstance = new Coupon(params)
        if (couponInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'coupon.label', default: 'Coupon'), couponInstance.id])}"
            redirect(action: "show", id: couponInstance.id)
        }
        else {
            render(view: "create", model: [couponInstance: couponInstance])
        }
    }

    def show = {
        def couponInstance = Coupon.get(params.id)
        if (!couponInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'coupon.label', default: 'Coupon'), params.id])}"
            redirect(action: "list")
        }
        else {
            [couponInstance: couponInstance]
        }
    }

    def edit = {
        def couponInstance = Coupon.get(params.id)
        if (!couponInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'coupon.label', default: 'Coupon'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [couponInstance: couponInstance]
        }
    }

    def update = {
        def couponInstance = Coupon.get(params.id)
        if (couponInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (couponInstance.version > version) {
                    
                    couponInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'coupon.label', default: 'Coupon')] as Object[], "Another user has updated this Coupon while you were editing")
                    render(view: "edit", model: [couponInstance: couponInstance])
                    return
                }
            }
            couponInstance.properties = params
            if (!couponInstance.hasErrors() && couponInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'coupon.label', default: 'Coupon'), couponInstance.id])}"
                redirect(action: "show", id: couponInstance.id)
            }
            else {
                render(view: "edit", model: [couponInstance: couponInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'coupon.label', default: 'Coupon'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def couponInstance = Coupon.get(params.id)
        if (couponInstance) {
            try {
                couponInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'coupon.label', default: 'Coupon'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'coupon.label', default: 'Coupon'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'coupon.label', default: 'Coupon'), params.id])}"
            redirect(action: "list")
        }
    }
}
