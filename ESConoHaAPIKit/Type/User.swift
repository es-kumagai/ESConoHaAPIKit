//
//  User.swift
//  ESConoHaAPIKit
//
//  Created by Tomohiro Kumagai on H27/07/17.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Himotoki

public struct User {
	
	public var id:String
	public var name:String
	public var username:String
	public var rolesLinks:[Link]
	public var roles:[UserRole]
}

extension User : Decodable {
	
	public static func decode(e: Extractor) throws -> User {
		
		return try User(
			
			id: e.value("id"),
			name: e.value("name"),
			username: e.value("username"),
			rolesLinks: e.array("roles_links"),
			roles: e.array("roles")
		)
	}
}

public struct UserRole {
	
	public var name:String
}

extension UserRole : Decodable {
	
	public static func decode(e: Extractor) throws -> UserRole {
		
		return try UserRole(
			
			name: e.value("name")
		)
	}
}
