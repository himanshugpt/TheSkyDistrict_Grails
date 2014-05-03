package com.sky.district.domain

class User {

    static constraints = {
		emailAddress(email:true,blank:false, unique:true)
		password(blank:false, size:4..8)
		
    }
	
	String emailAddress;
	String password;
	String firstName;
	String lastName;
	String jobTitle;
	String where_u_heard_about_us;
	String organizationName;
	
	Long phoneNumber;
	String address;
	String role;
	
	String toString(){
		return firstName+ " " + lastName;
	}
}
