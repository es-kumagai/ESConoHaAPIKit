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
	
	public static func decode(e: Extractor) -> Link? {
		
		return build(
			
			(e <| "href").flatMap(NSURL.init),
			(e <| "rel").flatMap(LinkRel.init),
			e <|? "type"
			
			).map(Link.init)
	}
}

public enum LinkRel : String {
	
	case SelfLink = "self"
	case DescribedBy = "describedby"
}
