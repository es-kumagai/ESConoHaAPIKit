//
//  APIUser.swift
//  ESConoHaAPIKit
//
//  Created by Tomohiro Kumagai on H27/07/17.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import XCTest

let user:APIUser! = APIUser()

class BundleMarker {
	
}

struct APIUser {
	
	var name:String
	var password:String
	var tenantID:String?
	
	private init?() {
		
		let bundle = NSBundle(forClass: BundleMarker.self)
		
		guard let path = bundle.pathForResource("APIUser", ofType: "plist") else {
			
			XCTFail("APIUser.plist is not found. Please make this file yourself and into test bundle.")
			
			return nil
		}
		
		let plist = NSDictionary(contentsOfFile: path)! as! [String:String]
		
		self.name = plist["username"]!
		self.password = plist["password"]!
		self.tenantID = plist["tenant_id"]
	}
}
