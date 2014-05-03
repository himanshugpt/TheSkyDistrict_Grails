/**
 * 
 */
package com.sky.district.domain

/**
 * @author Himanshu
 *
 */
class DashboardController {

	def contactus ={
		redirect(uri:"/dashboard/contact_us.gsp");
	}
	
	def faq ={
		redirect(uri:"/dashboard/faq.gsp");
	}
	
	def sendMail={
		sendMail {
			to "hgupta01@syr.edu"
			subject params.Subject
			body params.Message
		}
		flash.message = "Thanks. We will be contacting you soon."
		redirect(uri:"/dashboard/contact_us.gsp");
	}
}
