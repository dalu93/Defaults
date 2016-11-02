//
//  Defaults.swift
//  Defaults
//
//  Created by Luca D'Alberti on 9/27/16.
//  Copyright © 2016 dalu93. All rights reserved.
//

import Foundation

// MARK: - DefaultKey declaration

/// The structure define as much as it can the UserDefaults key.
///
/// It contains the name and the type informations.
public struct DefaultKey<A>: Equatable {
    public var name: String
    
    public init(_ name: String) {
        self.name = name
    }
}


/// The `DefaultKey` structure can be compared with other `DefaultKey` structs.
///
/// - Note: Only `DefaultKey` with the same generic type are allowed to be compared
/// - parameter lhs: A `DefaultKey`
/// - parameter rhs: Other `DefaultKey`
///
/// - returns: `true` if the generic type and the name are the same,
///             otherwise `false`.
public func ==<T>(lhs: DefaultKey<T>, rhs: DefaultKey<T>) -> Bool {
    return lhs.name == rhs.name
}

// MARK: - UserDefaults helpers
public extension UserDefaults {
    
    /// Get a value stored in the `standard` `UserDefaults`
    ///
    /// - parameter key: The key
    ///
    /// - returns: The stored value, if there is, otherwise `nil`
    public func get<T>(for key: DefaultKey<T>) -> T? {
        return UserDefaults.standard.value(forKey: key.name) as? T
    }
    
    /// Get a value stored in the `standard` `UserDefaults` or a default value
    ///
    /// - parameter key:          The key
    /// - parameter defaultValue: A default value
    ///
    /// - returns: The stored value, if there is, otherwise the default one
    public func get<T>(for key: DefaultKey<T>, or defaultValue: T) -> T {
        return (UserDefaults.standard.value(forKey: key.name) as? T) ?? defaultValue
    }
    
    /// Set a new value in the `standard` `UserDefaults`.
    ///
    /// If the new value is `nil`, the value will be removed from the storage
    ///
    /// - parameter value: The value. It can be `nil`
    /// - parameter key:   The key
    public func set<T>(_ value: T?, for key: DefaultKey<T>) {
        if let value = value {
            UserDefaults.standard.setValue(value, forKey: key.name)
            UserDefaults.standard.synchronize()
        } else {
            UserDefaults.standard.removeValue(for: key)
        }
    }
    
    /// Remove a value in the `standard` `UserDefaults` for the specific key
    ///
    /// - parameter key: The key
    public func removeValue<T>(for key: DefaultKey<T>) {
        UserDefaults.standard.removeObject(forKey: key.name)
        UserDefaults.standard.synchronize()
    }
}
