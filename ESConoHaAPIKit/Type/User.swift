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
	
	public static func decode(e: Extractor) -> User? {
		
		return build(
			
			e <| "id",
			e <| "name",
			e <| "username",
			e <|| "roles_links",
			e <|| "roles"
			
			).map(User.init)
	}
}

public struct UserRole {
	
	public var name:String
}

extension UserRole : Decodable {
	
	public static func decode(e: Extractor) -> UserRole? {
		
		return build(
			
			e <| "name"

		).map(UserRole.init)
	}
}
