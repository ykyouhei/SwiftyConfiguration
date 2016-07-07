//
//  SwiftyConfigurationTests.swift
//  SwiftyConfigurationTests
//
//  Created by kyo__hei on 2016/07/05.
//  Copyright © 2016年 kyo__hei. All rights reserved.
//

import XCTest
@testable import SwiftyConfiguration

private extension Keys {
    
    static let string = Key<String>("string")
    static let url    = Key<NSURL>("url")
    static let number = Key<NSNumber>("number")
    static let int    = Key<Int>("int")
    static let float  = Key<Float>("float")
    static let double = Key<Double>("double")
    static let date   = Key<NSDate>("date")
    static let bool   = Key<Bool>("bool")
    
    static let array      = Key<Array<AnyObject>>("array")
    static let innerInt   = Key<Int>("array.0")
    static let innerArray = Key<String>("array.1.0")
    
    static let dictionary  = Key<[String : String]>("dictionary")
    static let innerString = Key<String>("dictionary.innerString")
}

class SwiftyConfigurationTests: XCTestCase {
    
    private lazy var plistPath: String = {
        return NSBundle(forClass: self.dynamicType).pathForResource("Configuration", ofType: "plist")!
    }()
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetValue() {
        let config = Configuration(plistPath: plistPath)!
        
        XCTAssertTrue("hoge" == config.get(.string)!)
        XCTAssertTrue(NSURL(string: "https://github.com/ykyouhei/SwiftyConfiguration")! == config.get(.url)!)
        XCTAssertTrue(NSNumber(int: 0) == config.get(.number)!)
        XCTAssertTrue(1 == config.get(.int)!)
        XCTAssertTrue(1.1 == config.get(.float)!)
        XCTAssertTrue(3.14 == config.get(.double)!)
        XCTAssertTrue(config.get(.bool)!)
        XCTAssertTrue(NSDate(timeIntervalSince1970: 0).timeIntervalSince1970 == config.get(.date)!.timeIntervalSince1970)
        
        XCTAssertTrue([0,["array.1.0"]] == config.get(.array)!)
        XCTAssertTrue(0 == config.get(.innerInt)!)
        XCTAssertTrue("array.1.0" == config.get(.innerArray)!)
        
        XCTAssertTrue(["innerString" : "moge"] == config.get(.dictionary)!)
        XCTAssertTrue("moge" == config.get(.innerString)!)
    }
    
}
