package com.sky.district.services

import com.sky.district.domain.Address;
import com.sky.district.domain.Vendor;

class VendorService {

    static transactional = true

    def serviceMethod() {

    }
	
	def saveVendor(Map<Object,Object> params){
		def address = new Address(params);
		address.save();
		//int id = 		//vendor.save();
	}
}
