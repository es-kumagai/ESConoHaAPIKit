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
	
	public static func decode(e: Extractor) -> ServiceCatalog? {

		return build(
			
			e <| "name",
			e <| "type",
			e <|| "endpoints",
			e <||? "endpoints_link"
			
		).map(ServiceCatalog.init)
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
	
	public static func decode(e: Extractor) -> ServiceCatalogType? {
		
		guard let value = e.rawValue as? String else {
			
			return nil
		}
		
		return ServiceCatalogType(rawValue: value)
	}
}
