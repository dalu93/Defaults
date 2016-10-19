//
//  ViewController.swift
//  Defaults
//
//  Created by Luca D'Alberti on 10/18/16.
//  Copyright © 2016 dalu93. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func examples() {
        
        let defaultKey = DefaultKey<String>("key")
        
        // Get the string value for the key. The method returns an Optional
        let storedString = UserDefaults.standard.get(for: defaultKey)
        
        // Store a new value
        UserDefaults.standard.set("hello", for: defaultKey)
        
        // By trying to set a different type, the compiler will throw
//        UserDefaults.standard.set(10, for: defaultKey)
        
        // Delete the value from the storage
        UserDefaults.standard.set(nil, for: defaultKey)
        
        // or by calling
        UserDefaults.standard.removeValue(for: defaultKey)
        
        // Create a unique String handler
        var stringDefaults = Defaults<String>.standard
        
        // Get the string value for the key. Returns an Optional
        let storedValue = stringDefaults[defaultKey]
        
        // Store a new value
        stringDefaults[defaultKey] = "hello"
        
        // Delete the value from the storage
        stringDefaults[defaultKey] = nil
    }
}

