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
	
	public static func decode(e: Extractor) -> Version? {
		
		return build(
			
			(e <| "id").flatMap { VersionID($0) },
			e <|| "links",
			e <|| "media-types",
			(e <| "status").flatMap { Status(rawValue: $0)! },
			(e <| "updated").flatMap { NSDate(dateString: $0)! }
			
			).map(Version.init)
	}
}

public struct VersionID {
	
	public var value:String
	
	public init(_ value:String) {
		
		self.value = value
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
	
	public static func decode(e: Extractor) -> MediaType? {
		
		return build(
			
			e <| "base"
			
			).map(MediaType.init)
	}
}

public enum Status : String {
	
	case Stable = "stable"
}
