//
//  Extension.swift
//  ESConoHaAPIKit
//
//  Created by Tomohiro Kumagai on H27/07/17.
//  Copyright © 2015 EasyStyle G.K. All rights reserved.
//

import APIKit

extension NSDate {
	
	public convenience init?(dateString string:String) {
	
		let dateFromFormat = { (format:String) -> NSDate? in

			let formatter = NSDateFormatter()
			
			formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
			formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
			formatter.dateFormat = format
			
			return formatter.dateFromString(string)
		}
		
		// RFC3339
		if let date = dateFromFormat("yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'") {
			
			self.init(timeIntervalSince1970: date.timeIntervalSince1970)
			return
		}
		
		if let date = dateFromFormat("yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'S") {
			
			self.init(timeIntervalSince1970: date.timeIntervalSince1970)
			return
		}

		return nil
	}
}

extension APIError : CustomDebugStringConvertible {
	
	public var debugDescription:String {
		
		switch self {
			
		case ConnectionError(let error):
			return error.localizedDescription
			
		case InvalidBaseURL(let url):
			return "Invalid base URL (\(url))"
			
		case ConfigurationError(let error):
			return "Configuration error (\(error))"
			
		case RequestBodySerializationError(let error):
			return "Request body serialization error (\(error))"
			
		case FailedToCreateURLSessionTask:
			return "Failed to create URL Session Task."
			
		case UnacceptableStatusCode(let code, let error):
			return "Unacceptable status code \(code) (\(error))"
			
		case ResponseBodyDeserializationError(let error):
			return "Response body deserialization error (\(error))"
			
		case InvalidResponseStructure(let object):
			return "Invalid response structure (\(object))"
			
		case NotHTTPURLResponse(let response):
			return "Not HTTP URL Response (\(response))"
		}
	}
}