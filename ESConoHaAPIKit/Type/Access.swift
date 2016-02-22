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
	
	public static func decode(e: Extractor) throws -> Access {
		
		return try Access(
			
			token: e.value("token"),
			serviceCatalog: e.array("serviceCatalog"),
			user: e.value("user"),
			metadata: e.value("metadata")
		)
	}
}

public struct AccessMetadata {
	
	public var isAdmin:Bool
	public var roleIDs:[String]
}

extension AccessMetadata : Decodable {
	
	public static func decode(e: Extractor) throws -> AccessMetadata {
		
		return try AccessMetadata(
			
			isAdmin: e <| "is_admin",
			roleIDs: e <|| "roles"
		)
	}
}