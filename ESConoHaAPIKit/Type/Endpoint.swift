//
//  Endpoint.swift
//  ESConoHaAPIKit
//
//  Created by Tomohiro Kumagai on H27/07/17.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Himotoki

public struct Endpoint {
	
	public var region:String
	public var publicURL:NSURL
}

extension Endpoint : Decodable {
	
	public static func decode(e: Extractor) throws -> Endpoint {
		
		return try Endpoint(
		
			region: e.value("region"),
			publicURL: e.value("publicURL")
		)
	}
}