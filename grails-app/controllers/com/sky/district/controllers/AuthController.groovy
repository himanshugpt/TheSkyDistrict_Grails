/**
 * 
 */
package com.sky.district.controllers

import com.sky.district.domain.User;

/**
 * @author Himanshu
 *
 */
class AuthController{

	def login = {
		def userInstance = null;
		def username = params['username'];
		def password = params['password']
		if (username && password) {
			userInstance = User.findWhere(emailAddress:username, password:password)
			if(userInstance != null){
				session.user = userInstance;
				redirect(action: "dashboard")
			}
			else{
				flash.errors="Username and Password doesnt match. Please try again."
				redirect(uri: "/index.gsp")
			}
		}
		else{
			flash.errors="Username and Password doesnt match. Please try again."
			redirect(uri: "/index.gsp")
		}
	}

	def logout = {
		session.user = null;
		flash.message = "You are now signed out. Please come back again soon."
		redirect(action: "homepage")
	}
	
	def homepage = { 
		if(session.user != null)
		redirect(uri:"/dashboard/dashboard.gsp");
		else
		redirect(uri:"/index.gsp")
		 }

	def dashboard= {
		if(session.user != null)
		redirect(uri:"/dashboard/dashboard.gsp");
		else 
		redirect(action: "homepage")
	}
}
