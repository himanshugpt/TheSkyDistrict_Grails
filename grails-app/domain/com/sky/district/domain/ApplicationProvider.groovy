package com.sky.district.domain

class ApplicationProvider {

    static constraints = {
		name(unique:true)
    }
	static hasMany = [coupons:Coupon]
	String name
	
	String toString(){
		return name;
	}
}
