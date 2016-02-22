//
//  Version.swift
//  ESConoHaAPIKit
//
//  Created by Tomohiro Kumagai on H27/07/17.
//  Copyright © 2015 EasyStyle G.K. All rights reserved.
//

import Himotoki

public struct Version {
	
	public var id:VersionID
	public var links:[Link]
	public var mediaTypes:[MediaType]
	public var status:Status
	public var updated:NSDate
}

extension Version : Decodable {
	
	public static func decode(e: Extractor) throws -> Version {
		
		return try Version(
			
			id: e.value("id"),
			links: e.array("links"),
			mediaTypes: e.array("media-types"),
			status: Status(rawValue: e.value("status"))!,
			updated: NSDate(dateString: e.value("updated"))!
		)
	}
}

public struct VersionID {
	
	public var value:String
	
	public init(_ value:String) {
		
		self.value = value
	}
}

extension VersionID : Decodable {

	public static func decode(e: Extractor) throws -> VersionID {
		
		return try VersionID(String.decode(e))
	}
}

extension VersionID : Equatable {
	
}

public func == (lhs:VersionID, rhs:VersionID) -> Bool {

	return lhs.value == rhs.value
}

extension VersionID : StringLiteralConvertible {
	
	public typealias StringLiteralType = String
	public typealias ExtendedGraphemeClusterLiteralType = String
	public typealias UnicodeScalarLiteralType = String
	
	public init(stringLiteral value: StringLiteralType) {
		
		self.init(value)
	}
	
	public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
		
		self.init(value)
	}
	
	public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
		
		self.init(value)
	}
}

public struct MediaType {
	
	public var base:String
}

extension MediaType : Decodable {
	
	public static func decode(e: Extractor) throws -> MediaType {
		
		return try MediaType(
			
			base: e.value("base")
        )
	}
}

public enum Status : String {
	
	case Stable = "stable"
}
