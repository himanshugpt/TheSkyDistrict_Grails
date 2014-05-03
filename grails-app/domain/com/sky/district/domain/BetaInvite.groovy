/**
 * 
 */
package com.sky.district.domain

/**
 * @author Himanshu
 *
 */
class BetaInvite {

	static constraints = {
		email(email:true,blank:false)
	}
	
	String email
	Date checkInTime
	Boolean isRegistered
}
