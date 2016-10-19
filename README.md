# Defaults.swift
Easy to use UserDefaults for iOS apps.

[![BuddyBuild](https://dashboard.buddybuild.com/api/statusImage?appID=5805ce90187d20010067a129&branch=master&build=latest)](https://dashboard.buddybuild.com/apps/5805ce90187d20010067a129/build/latest)

Defaults.swift is a easy-to-use generic interface built on top of `UserDefaults` in Swift.

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Migration](#migration)
- [License](#license)

## Features

- [x] Compile time checks by using generics
- [x] Swifty syntax
- [x] Easy to use
- [x] Fully extendable

## Requirements

- iOS 8.0+ / macOS 10.10+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 8.0+
- Swift 3.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build Defaults.swift 1.0.0+.

To integrate Defaults.swift into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
pod 'Defaults.swift', '~> 1.0'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage

`Defaults.swift` provides the user two different interfaces.

### Define the keys

`Defaults.swift` uses a structure called `DefaultKey<T>` to handle the `UserDefaults` keys.

```swift
let defaultKey = DefaultKey<String>("key")
```

### Retrieving a stored value

```swift
// Get the string value for the key. The method returns an Optional
let storedString = UserDefaults.standard.get(for: defaultKey)
```

Or:
```swift
// Create a unique String handler
var stringDefaults = Defaults<String>.standard

// Get the string value for the key. Returns an Optional
let storedValue = stringDefaults[defaultKey]
```

### Storing a new value

```swift
// Store a new value
UserDefaults.standard.set("hello", for: defaultKey)
```

Or:
```swift
// Store a new value
stringDefaults[defaultKey] = "hello"
```

Here is the power of `Defaults.swift`: you can store different types for the same key
```swift
UserDefaults.standard.set(10, for: defaultKey)  // this won't compile
stringDefaults[defaultKey] = 10                 // this won't compile too
```

### Removing a value

```swift
// Delete the value from the storage
UserDefaults.standard.set(nil, for: defaultKey)

// or by calling
UserDefaults.standard.removeValue(for: defaultKey)
```

Or:
```swift
// Delete the value from the storage
stringDefaults[defaultKey] = nil
```

## Migration

### Migration from 1.x to 2.0.0

#### Compile fixes
The `DefaultKey` structure is now generic. Before you declared

```swift
let key = DefaultKey.Name(rawValue: "YOUR_KEY")!
```

Now, for a more type safety, you have to declare the type the key should hold.
The internal struct `Name` doesn't exist anymore
```swift
let key = DefaultKey<String>("YOUR_KEY")
```

#### Convenience methods
If you want to display, somehow, the key name in your code, you can replace

```swift
let key = yourDefaultKeyName.rawValue
```

to:
```swift
let key = yourDefaultKey.name
```

You can still compare two differents key by using the `==` operator.
Pay attention that the application won't compile if you're going to compare two
`DefaultKey` with different generic type. For example

```swift
let key = DefaultKey<String>("key")
let aKey = DefaultKey<Int>("key")
let otherKey = DefaultKey<String>("a")
let anotherKey = key

key == aKey         // this won't compile because they hold different types
key == otherKey     // this will return false because the name is different
key == anotherKey   // this will return true
```

## License

Defaults.swift is released under the MIT license. See LICENSE for details.
