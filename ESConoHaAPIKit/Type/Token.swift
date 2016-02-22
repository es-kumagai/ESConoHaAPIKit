//
//  Token.swift
//  ESConoHaAPIKit
//
//  Created by Tomohiro Kumagai on H27/07/17.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Himotoki

public struct Token {
	
	public var id:String
	public var issuedAt:NSDate
	public var expires:NSDate
	public var tenant:Tenant?
	public var auditIds:[String]
}

extension Token : Decodable {
	
	public static func decode(e: Extractor) throws -> Token {
		
		return try Token(
			
			id: e.value("id"),
			issuedAt: NSDate(dateString: e.value("issued_at"))!,
			expires: NSDate(dateString: e.value("expires"))!,
			tenant: e.valueOptional("tenant"),
			auditIds: e.array("audit_ids")
			
		)
	}
}