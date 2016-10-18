# Defaults.swift
Easy to use UserDefaults for iOS apps.

Defaults.swift is a easy-to-use generic interface built on top of `UserDefaults` in Swift.

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
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

`Defaults.swift` uses a structure called `DefaultKey.Name` to handle the `UserDefaults` keys.

```swift
let defaultKey = DefaultKey.Name(rawValue: "key")!
```

### Retrieving a stored value

```swift
// Get the string value for the key. The method returns an Optional
let storedString: String? = UserDefaults.standard.get(for: defaultKey)
```

Or:
```swift
// Create a unique String handler
var stringDefaults = Defaults<String>.standard

// Get the string value for the key. Returns an Optional
let storedValue = stringDefaults[defaultKey]    // storedValue is a String?
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

## License

Defaults.swift is released under the MIT license. See LICENSE for details.
