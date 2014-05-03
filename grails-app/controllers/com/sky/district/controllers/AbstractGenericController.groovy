/**
 * 
 */
package com.sky.district.controllers

/**
 * @author Himanshu
 *
 */
abstract class AbstractGenericController implements GenericController{

	def homepage = {
		redirect(uri:"/TheSkyDistrict")
	}
}
