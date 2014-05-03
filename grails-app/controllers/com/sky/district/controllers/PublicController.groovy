/**
 * 
 */
package com.sky.district.controllers

import java.util.Calendar;

import com.sky.district.domain.BetaInvite;
import com.sky.district.domain.User;
/**
 * @author Himanshu
 *
 */
class PublicController {

	def sendEmail = {
		def betaInviteInstance = new BetaInvite(params)
		betaInviteInstance.email=params.emailAddr
		def user = User.findByEmailAddress(params.emailAddr)
		if(user == null){
			betaInviteInstance.isRegistered=false
		}else {
			betaInviteInstance.isRegistered=true
		}
		betaInviteInstance.checkInTime= new Date()
		//betaInviteInstance.save(flush: true)

		if (betaInviteInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'betaInvite.label', default: 'BetaInvite'), betaInviteInstance.id])}"
		}else{
			redirect(uri: "/index.gsp")
		}

		sendMail {
			to params.emailAddr
			subject "Test mail"
			body 'This is a test mail.'
		}
		flash.message = "Thanks. We will be contacting you soon."
		redirect(uri: "/index.gsp")
	}
}
