//
//  Tenant.swift
//  ESConoHaAPIKit
//
//  Created by Tomohiro Kumagai on H27/07/17.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Himotoki

public struct Tenant {
	
	public var id:String
	public var name:String
	public var domainId:String
	public var description:String
	public var enabled:Bool
	public var tyo1ImageSize:String
	public var sin1ImageSize:String
	public var sjc1ImageSize:String
}

extension Tenant : Decodable {
	
	public static func decode(e: Extractor) throws -> Tenant {
		
		return try Tenant(
			
			id: e.value("id"),
			name: e.value("name"),
			domainId: e.value("domain_id"),
			description: e.value("description"),
			enabled: e.value("enabled"),
			tyo1ImageSize: e.value("tyo1_image_size"),
			sin1ImageSize: e.value("sin1_image_size"),
			sjc1ImageSize: e.value("sjc1_image_size")
		)
	}
}
