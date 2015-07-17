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
	
	public static func decode(e: Extractor) -> Token? {
		
		return build(
			
			e <| "id",
			(e <| "issued_at").flatMap { NSDate(dateString: $0)! },
			(e <| "expires").flatMap { NSDate(dateString: $0)! },
			e <|? "tenant",
			e <|| "audit_ids"
			
			).map(Token.init)
	}
}