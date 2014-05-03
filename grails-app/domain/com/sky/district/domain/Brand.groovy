package com.sky.district.domain

class Brand {

    static constraints = {
		brandName(unique:true)
    }
	static hasMany = [coupons:Coupon]
	
	String brandName
	
	String toString(){
		return brandName
	}
}
