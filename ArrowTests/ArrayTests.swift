//
//  ArrayTests.swift
//  Arrow
//
//  Created by Sacha Durand Saint Omer on 10/07/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import XCTest
import Arrow


struct ArrayContainer {
    var phoneNumbers = [PhoneNumber]()
    var optionalPhoneNumbers: [PhoneNumber]? = nil
    var strings = [String]()
    var ints = [Int]()
    var bools = [Bool]()
    var meaningOfLife: Int = 0
    var nestedArrayParsing = ""
}

extension ArrayContainer:ArrowParsable {
    
    mutating func deserialize(_ json: JSON) {
        phoneNumbers <-- json["phoneNumbers"]
        optionalPhoneNumbers <-- json["phoneNumbers"]
        strings <-- json["strings"]
        ints <-- json["ints"]
        bools <-- json["bools"]
        meaningOfLife <-- json["nested.nested.nested.nestedValue"]
        nestedArrayParsing <-- json["nestedArray.2"]
    }
}


class ArrayTests: XCTestCase {
    
    var arrayContainer = ArrayContainer()
    
    override func setUp() {
        super.setUp()
        if let json: JSON = jsonForName("Profile") {
            arrayContainer = ArrayContainer()
            arrayContainer.deserialize(json)
        }
    }
    
    func testParsingArrayOfCustomModels() {
        XCTAssertEqual(arrayContainer.phoneNumbers.count, 3)
        if arrayContainer.phoneNumbers.count >= 3 {
            XCTAssertEqual(arrayContainer.phoneNumbers[0].label, "house")
            XCTAssertEqual(arrayContainer.phoneNumbers[1].label, "cell")
            XCTAssertEqual(arrayContainer.phoneNumbers[2].label, "work")
            
            XCTAssertEqual(arrayContainer.phoneNumbers[0].number, "9809876545")
            XCTAssertEqual(arrayContainer.phoneNumbers[1].number, "0908070656")
            XCTAssertEqual(arrayContainer.phoneNumbers[2].number, "0916570656")
        } else {
            XCTFail()
        }
    }
    
    
    func testParsingOptionalArrayOfCustomModels() {
        XCTAssertEqual(arrayContainer.optionalPhoneNumbers?.count, 3)
        
        XCTAssertEqual(arrayContainer.optionalPhoneNumbers?[0].label, "house")
        XCTAssertEqual(arrayContainer.optionalPhoneNumbers?[1].label, "cell")
        XCTAssertEqual(arrayContainer.optionalPhoneNumbers?[2].label, "work")
        
        XCTAssertEqual(arrayContainer.optionalPhoneNumbers?[0].number, "9809876545")
        XCTAssertEqual(arrayContainer.optionalPhoneNumbers?[1].number, "0908070656")
        XCTAssertEqual(arrayContainer.optionalPhoneNumbers?[2].number, "0916570656")
    }
    
    func testParsingArrayOfStrings() {
        XCTAssertEqual(arrayContainer.strings.count, 3)
        if arrayContainer.strings.count >= 3 {
            XCTAssertEqual(arrayContainer.strings[0], "one")
            XCTAssertEqual(arrayContainer.strings[1], "two")
            XCTAssertEqual(arrayContainer.strings[2], "three")
        } else {
            XCTFail()
        }
    }
    
    func testParsingArrayOfInts() {
        XCTAssertEqual(arrayContainer.ints.count, 3)
        if arrayContainer.ints.count >= 3 {
            XCTAssertEqual(arrayContainer.ints[0], 1)
            XCTAssertEqual(arrayContainer.ints[1], 2)
            XCTAssertEqual(arrayContainer.ints[2], 3)
        } else {
            XCTFail()
        }
    }
    
    func testParsingArrayOfBools() {
        XCTAssertEqual(arrayContainer.bools.count, 3)
        if arrayContainer.bools.count >= 3 {
            XCTAssertEqual(arrayContainer.bools[0], true)
            XCTAssertEqual(arrayContainer.bools[1], false)
            XCTAssertEqual(arrayContainer.bools[2], true)
        } else {
            XCTFail()
        }
    }
    
    func testNestedParsing() {
        XCTAssertEqual(arrayContainer.meaningOfLife, 42)
    }
    
    func testNestedArrayParsing() {
        XCTAssertEqual(arrayContainer.nestedArrayParsing, "Cool")
    }
}
