//
//  ServiceCatalog.swift
//  ESConoHaAPIKit
//
//  Created by Tomohiro Kumagai on H27/07/17.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Himotoki

public struct ServiceCatalog {

	public var name:String
	public var type:ServiceCatalogType
	public var endpoints:[Endpoint]
	public var endpointsLinks:[Link]?
}

extension ServiceCatalog : Decodable {
	
	public static func decode(e: Extractor) throws -> ServiceCatalog {

		return try ServiceCatalog(
			
			name: e.value("name"),
			type: e.value("type"),
			endpoints: e.array("endpoints"),
			endpointsLinks: e.arrayOptional("endpoints_link")
		)
	}
}

public enum ServiceCatalogType : String {
	
	case Account = "account"
	case DatabaseHosting = "databasehosting"
	case Network = "network"
	case VolumeV2 = "volumev2"
	case Image = "image"
	case Compute = "compute"
	case MailHosting = "mailhosting"
	case DNS = "dns"
	case ObjectStore = "object-store"
	case Identity = "identity"
}

extension ServiceCatalogType : Decodable {
	
	public static func decode(e: Extractor) throws -> ServiceCatalogType {
		
		guard let type = try ServiceCatalogType(rawValue: String.decode(e)) else {

			throw DecodeError.TypeMismatch(expected: "ServiceCatalogType", actual: "\(e.rawValue)", keyPath: nil)
		}
		
		return type
	}
}
