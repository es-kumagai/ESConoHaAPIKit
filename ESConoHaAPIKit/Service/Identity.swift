//
//  Identity.swift
//  ESConoHaAPIKit
//
//  Created by Tomohiro Kumagai on H27/07/17.
//  Copyright © 2015 EasyStyle G.K. All rights reserved.
//

import APIKit
import Himotoki

public protocol IdentityRequest : Request {
	
}

extension IdentityRequest {
	
	public var baseURL:NSURL {
		
		return NSURL(string: "https://identity.tyo1.conoha.io")!
	}
}

extension ConoHaAPI {
	
	public class Identity : API {
		
		public struct GetVersion : IdentityRequest {
			
			public let method:HTTPMethod = .GET
			public let path:String = "/"
			
			public init() {
				
			}
			
			public let acceptableStatusCodes = Set(300...300)
			
			public func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> [Version]? {
				
				guard let dictionary = object as? [String:AnyObject], let versions = dictionary["versions"] as? [String:AnyObject] else {
					
					return nil
				}
				
				return decodeArray(versions["values"] as! [AnyObject])
			}
		}
		
		public struct GetVersionDetail : IdentityRequest {
			
			public let method:HTTPMethod = .GET
			public let path:String = "/v2.0"
			
			public init() {
				
			}
			
			public func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Version? {
				
				return decode(object["version"] as! [String:AnyObject])
			}
		}
	}
}
