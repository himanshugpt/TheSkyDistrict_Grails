package com.sky.district.domain


class Address {

    static constraints = {
		phoneNumber(nullable:true)
    }
	static belongsTo = [vendor:Vendor]
	int id;
	Long phoneNumber;
	String address;
	int zip;
	
	String toString(){
		return address 
	}
}
