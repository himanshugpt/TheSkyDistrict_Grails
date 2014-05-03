/**
 * 
 */
package com.sky.district.domain

/**
 * @author Himanshu
 *
 */
class Tag {
	
	static constraints = {
		name(unique:true)
	}
	
	static hasMany= [coupons:Coupon]
	static belongsTo=[Coupon] 
	String name
	
	String toString(){
		return name;
		}
}
