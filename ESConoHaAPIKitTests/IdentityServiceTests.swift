//
//  IdentityServiceTests.swift
//  ESConoHaAPIKit
//
//  Created by Tomohiro Kumagai on H27/07/17.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import XCTest
import ESConoHaAPIKit

class IdentityServiceTests: XCTestCase {

	var updated:NSDate!
	
    override func setUp() {

		super.setUp()

		let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
		let components = NSDateComponents()
		
//		calendar.locale = NSLocale(localeIdentifier: "en_US_POSIX")
		
		components.year = 2015
		components.month = 5
		components.day = 12
		components.hour = 9
		components.minute = 0
		components.second = 0
		components.timeZone = NSTimeZone(name: "GMT")
		
		self.updated = calendar.dateFromComponents(components)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

	func testVersionList() {
		
		let expectation = self.expectationWithDescription("IdentityService")
		
		let request = ConoHaAPI.Identity.GetVersionList()
		
		ConoHaAPI.sendRequest(request) { response in
			
			defer {
				
				expectation.fulfill()
			}
			
			switch response {
				
			case .Success(let versions):
				
				XCTAssertEqual(versions.count, 1)
				
				let version = versions[0]
				
				XCTAssertEqual(version.id, "v2.0")
				XCTAssertEqual(version.mediaTypes.count, 2)
				XCTAssertEqual(version.links.count, 2)
				XCTAssertEqual(version.links[0].href.absoluteString, "https://identity.tyo1.conoha.io/v2.0/")
				XCTAssertEqual(version.links[0].rel, LinkRel.SelfLink)
				XCTAssertNil(version.links[0].type)
				XCTAssertEqual(version.links[1].href.absoluteString, "https://www.conoha.jp/docs/")
				XCTAssertEqual(version.links[1].rel, LinkRel.DescribedBy)
				XCTAssertEqual(version.links[1].type!, "text/html")
				XCTAssertEqual(version.mediaTypes[0].base, "application/json")
				XCTAssertEqual(version.mediaTypes[1].base, "application/xml")
				XCTAssertEqual(version.status, Status.Stable)
				XCTAssertEqual(version.updated, self.updated)
				
			case .Failure(let error):
				XCTFail(String(reflecting: error))
			}
		}
		
		self.waitForExpectationsWithTimeout(10.0) {
			
			print($0?.description)
		}
	}
	
	func testVersionDetail() {
		
		let expectation = self.expectationWithDescription("IdentityService")
		
		let request = ConoHaAPI.Identity.GetVersionDetail()
		
		ConoHaAPI.sendRequest(request) { response in
			
			defer {
				
				expectation.fulfill()
			}
			
			switch response {
				
			case .Success(let version):
				XCTAssertEqual(version.id, "v2.0")
				XCTAssertEqual(version.mediaTypes.count, 2)
				XCTAssertEqual(version.links.count, 2)
				XCTAssertEqual(version.links[0].href.absoluteString, "https://identity.tyo1.conoha.io/v2.0/")
				XCTAssertEqual(version.links[0].rel, LinkRel.SelfLink)
				XCTAssertNil(version.links[0].type)
				XCTAssertEqual(version.links[1].href.absoluteString, "https://www.conoha.jp/docs/")
				XCTAssertEqual(version.links[1].rel, LinkRel.DescribedBy)
				XCTAssertEqual(version.links[1].type!, "text/html")
				XCTAssertEqual(version.mediaTypes[0].base, "application/json")
				XCTAssertEqual(version.mediaTypes[1].base, "application/xml")
				XCTAssertEqual(version.status, Status.Stable)
				XCTAssertEqual(version.updated, self.updated)
				
			case .Failure(let error):
				XCTFail(String(reflecting: error))
			}
		}
		
		self.waitForExpectationsWithTimeout(10.0) {
			
			print($0?.description)
		}
	}
	
	func testPostToken() {
		
		let expectation = self.expectationWithDescription("IdentityService")
		
		let request = ConoHaAPI.Identity.PostTokens(username: user.name, password: user.password, tenantID: user.tenantID)
		
		let parametersData = try! NSJSONSerialization.dataWithJSONObject(request.parameters, options: [])
		let parametersString = NSString(data:parametersData, encoding:NSUTF8StringEncoding)!

		XCTAssertEqual(parametersString, "{\"auth\":{\"passwordCredentials\":{\"password\":\"\(user.password)\",\"username\":\"\(user.name)\"},\"tenantId\":\"\(user.tenantID!)\"}}")
		
		ConoHaAPI.Identity.sendRequest(request) { response in
			
			defer {
				
				expectation.fulfill()
			}
			
			switch response {
				
			case .Success(let access):
				print("Post Token : \(access.token.id)")
				XCTAssertTrue(access.token.tenant != nil)
				XCTAssertTrue(access.token.tenant!.enabled)
				XCTAssertEqual(access.token.tenant!.id, user.tenantID!)
				XCTAssertEqual(access.token.auditIds.count, 1)
				
				XCTAssertTrue(access.metadata.isAdmin == false)
				XCTAssertEqual(access.metadata.roleIDs.count, 2)
				
				XCTAssertEqual(access.user.name, user.name)
				XCTAssertEqual(access.user.username, user.name)
				XCTAssertEqual(access.user.rolesLinks.count, 0)
				XCTAssertEqual(access.user.roles.count, 2)
				XCTAssertEqual(access.user.roles[0].name, "SwiftOperator")
				XCTAssertEqual(access.user.roles[1].name, "_member_")
				
			case .Failure(let error):
				XCTFail(String(reflecting: error))
			}
		}
		
		self.waitForExpectationsWithTimeout(10.0) {
			
			print($0?.description)
		}
	}
}
