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
    static let url    = Key<URL>("url")
    static let number = Key<NSNumber>("number")
    static let int    = Key<Int>("int")
    static let float  = Key<Float>("float")
    static let double = Key<Double>("double")
    static let date   = Key<Date>("date")
    static let bool   = Key<Bool>("bool")
    
    static let array      = Key<[Any]>("array")
    static let innerInt   = Key<Int>("array.0")
    static let innerArray = Key<String>("array.1.0")
    
    static let dictionary  = Key<[String : String]>("dictionary")
    static let innerString = Key<String>("dictionary.innerString")
}

class SwiftyConfigurationTests: XCTestCase {
    
    private lazy var plistPath: String = {
        return Bundle(for: type(of: self)).path(forResource: "Configuration", ofType: "plist")!
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
        XCTAssertTrue(URL(string: "https://github.com/ykyouhei/SwiftyConfiguration")! == config.get(.url)!)
        XCTAssertTrue(NSNumber(value: 0 as Int32) == config.get(.number)!)
        XCTAssertTrue(1 == config.get(.int)!)
        XCTAssertTrue(1.1 == config.get(.float)!)
        XCTAssertTrue(3.14 == config.get(.double)!)
        XCTAssertTrue(config.get(.bool)!)
        XCTAssertTrue(Date(timeIntervalSince1970: 0).timeIntervalSince1970 == config.get(.date)!.timeIntervalSince1970)
        
        let array = config.get(.array)!
        XCTAssertTrue(array[0] as! Int == 0)
        XCTAssertTrue(array[1] as! [NSString] == ["array.1.0"])
        XCTAssertTrue(0 == config.get(.innerInt)!)
        XCTAssertTrue("array.1.0" == config.get(.innerArray)!)
        
        XCTAssertTrue(["innerString" : "moge"] == config.get(.dictionary)!)
        XCTAssertTrue("moge" == config.get(.innerString)!)
    }
    
}
