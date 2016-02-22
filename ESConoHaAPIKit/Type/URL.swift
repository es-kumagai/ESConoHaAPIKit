//
//  URL.swift
//  ESConoHaAPIKit
//
//  Created by Tomohiro Kumagai on 2/22/16.
//  Copyright © 2016 EasyStyle G.K. All rights reserved.
//

import Foundation
import Himotoki

extension NSURL : Decodable {
	
	public static func decode(e: Extractor) throws -> NSURL {

		guard let url = try NSURL(string: String.decode(e)) else {
			
			throw typeMismatch("NSURL", actual: e.rawValue, keyPath: nil)
		}
		
		return url
	}
}