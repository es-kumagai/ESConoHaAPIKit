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
	
	public static func decode(e: Extractor) -> Tenant? {
		
		return build(
			
			e <| "id",
			e <| "name",
			e <| "domain_id",
			e <| "description",
			e <| "enabled",
			e <| "tyo1_image_size",
			e <| "sin1_image_size",
			e <| "sjc1_image_size"
			
			).map(Tenant.init)
	}
}
