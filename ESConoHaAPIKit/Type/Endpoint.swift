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
	
	public static func decode(e: Extractor) -> Endpoint? {
		
		return build(
			
			e <| "region",
			(e <| "publicURL").flatMap { NSURL(string: $0)! }
			
		).map(Endpoint.init)
	}
}