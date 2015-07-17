//
//  Access.swift
//  ESConoHaAPIKit
//
//  Created by Tomohiro Kumagai on H27/07/17.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Himotoki

public struct Access {

	public var token:Token
	public var serviceCatalog:[ServiceCatalog]
	public var user:User
	public var metadata:AccessMetadata
}

extension Access : Decodable {
	
	public static func decode(e: Extractor) -> Access? {
		
		return build(

			e <| "token",
			e <|| "serviceCatalog",
			e <| "user",
			e <| "metadata"
			
		).map(Access.init)
	}
}

public struct AccessMetadata {
	
	public var isAdmin:Bool
	public var roleIDs:[String]
}

extension AccessMetadata : Decodable {
	
	public static func decode(e: Extractor) -> AccessMetadata? {
		
		return build(
			
			e <| "is_admin",
			e <|| "roles"
			
		).map(AccessMetadata.init)
	}
}