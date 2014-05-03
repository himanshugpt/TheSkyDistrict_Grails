package com.sky.district.domain

class Coupon {

    static constraints = {
    }
	static belongsTo = [brand:Brand, appProvider:ApplicationProvider]
	static hasMany = [tags:Tag]
	
	Float messageRate;
	String shortCode;
	Date liveDate;
	Brand brand;
	ApplicationProvider appProvider;
	
	static mapping = {
		appProvider lazy:false
		brand lazy:false
		tags lazy:false
		}
	
}
