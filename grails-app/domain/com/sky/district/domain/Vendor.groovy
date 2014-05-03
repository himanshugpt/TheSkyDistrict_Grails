package com.sky.district.domain

import org.grails.comments.*
import org.grails.rateable.*

/**
 * Will be used to create the master table of vendors
 * @author Himanshu
 *
 */
class Vendor implements Commentable,Rateable  {

    static constraints = {
		avatar(nullable:true, maxSize: 16384 /* 16K */)
		avatarType(nullable:true)
    }
	
	//int id;
	String name;
	String URL;
	String descrption;
	Address address;
	VendorType vendorType;
	byte[] avatar
	String avatarType
	
	//VendorRatings rating;
	
}
