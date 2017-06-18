//
//  DefaultsTests.swift
//  DefaultsTests
//
//  Created by Luca D'Alberti on 10/18/16.
//  Copyright © 2016 dalu93. All rights reserved.
//

import XCTest
@testable import Defaults

class DefaultsTests: XCTestCase {
    
    let defaultKey = DefaultKey<String>("key")
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        UserDefaults.standard.removeObject(forKey: defaultKey.name)
        UserDefaults.standard.synchronize()
    }
    
    func testStoreNewValueWithFirstInterface() {
        let newValue = "hello"
        
        UserDefaults.standard.set(newValue, for: defaultKey)
        
        let storedValue = UserDefaults.standard.string(forKey: defaultKey.name)
        
        XCTAssert(storedValue == newValue, "The stored value for the key \(defaultKey.name) is different from \(newValue)")
    }
    
    func testGetValueFirstInterface() {
        let storedValue = "fhdifhsif"
        
        UserDefaults.standard.set(storedValue, forKey: defaultKey.name)
        UserDefaults.standard.synchronize()
        
        let retrievedValue: String = UserDefaults.standard.get(for: defaultKey)!
        
        XCTAssert(storedValue == retrievedValue, "The retrieved value is different than the stored one")
    }
    
    func testDeleteValueFirstInterface() {
        let storedValue = "fhdifhsif"
        
        UserDefaults.standard.set(storedValue, forKey: defaultKey.name)
        UserDefaults.standard.synchronize()
        
        UserDefaults.standard.set(nil, for: defaultKey)
        
        let retrievedValue: String? = UserDefaults.standard.get(for: defaultKey)
        
        XCTAssert(retrievedValue == nil, "The value for the key should be deleted")
    }
    
    func testSetNewValueUsingSubscript() {
        let newValue = "hello"
        UserDefaults.standard[defaultKey] = newValue
        
        let storedValue = UserDefaults.standard.string(forKey: defaultKey.name) ?? ""
        
        XCTAssert(storedValue == newValue, "The stored value for the key \(defaultKey.name) is different from \(newValue)")
    }
    
    func testGetValueUsingSubscript() {
        let storedValue = "fhdifhsif"
        
        UserDefaults.standard.set(storedValue, forKey: defaultKey.name)
        UserDefaults.standard.synchronize()
        
        let retrievedValue = UserDefaults.standard[defaultKey, or: ""]
        XCTAssert(retrievedValue == storedValue, "The retrieved value is different than the stored one")
    }
    
    func testDeleteValueUsingSubscript() {
        let storedValue = "fhdifhsif"
        
        UserDefaults.standard.set(storedValue, forKey: defaultKey.name)
        UserDefaults.standard.synchronize()
        
        UserDefaults.standard[defaultKey] = nil
        
        let retrievedValue = UserDefaults.standard[defaultKey]
        
        XCTAssert(retrievedValue == nil, "The value for the key should be deleted")
    }
}
