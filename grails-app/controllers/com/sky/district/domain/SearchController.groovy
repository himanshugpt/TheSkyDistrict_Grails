package com.sky.district.domain

class SearchController {

    def index = { }
	
	def results = {
		def tagValue = params['tag'];
		Tag tagSearched = Tag.findByNameLike(tagValue)
		if(tagSearched == null || tagSearched.coupons == null || tagSearched.coupons.size()== 0){
			flash.message = "No results found."
			redirect(uri:"/dashboard/dashboard.gsp")
			return
		}
		List<Coupon> coupons = new ArrayList<Coupon>();
		for(Coupon c: tagSearched.coupons){
			coupons.add c
		}
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		session.putValue ("couponInstanceList", coupons)
		session["couponInstanceTotal"]=coupons.size()
		session["tag"]=tagValue
		redirect(uri:"/dashboard/searchResults.gsp")
	}
	
	def vendorResults ={
		def vendorName = params['vendorName'];
		def vndrs = Vendor.findAllByNameLike("%"+vendorName+"%")
		if(vndrs == null || vndrs.size()== 0){
			flash.message = "No results found."
			redirect(uri:"/dashboard/dashboard.gsp")
			return
		}
		
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		//vndrs.refresh();
		session.putValue ("vendorInstanceList", vndrs)
		session["vendorInstanceTotal"]=vndrs.size()
		session["vendorName"]=vendorName
		redirect(uri:"/dashboard/vendorSearchResults.gsp")
	}
}
