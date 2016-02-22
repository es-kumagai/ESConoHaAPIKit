//
//  Link.swift
//  ESConoHaAPIKit
//
//  Created by Tomohiro Kumagai on H27/07/17.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Himotoki

public struct Link {
	
	public var href:NSURL
	public var rel:LinkRel
	public var type:String?
}

extension Link : Decodable {
	
	public static func decode(e: Extractor) throws -> Link {
		
		return try Link(
			
			href: e.value("href"),
			rel: e.value("rel"),
			type: e.valueOptional("type")
		)
	}
}

public enum LinkRel : String {
	
	case SelfLink = "self"
	case DescribedBy = "describedby"
}

extension LinkRel : Decodable {
	
	public static func decode(e: Extractor) throws -> LinkRel {
		
		guard let rel = try LinkRel(rawValue: String.decode(e)) else {
			
			throw DecodeError.TypeMismatch(expected: "LinkRel", actual: "\(e.rawValue)", keyPath: nil)
		}
		
		return rel
	}
}
