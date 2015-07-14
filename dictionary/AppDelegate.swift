//
//  AppDelegate.swift
//  dictionary
//
//  Created by Tanmay Bakshi on 2015-07-10.
//  Copyright © 2015 Tanmay Bakshi. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet var wordInput: NSTextField!
    @IBOutlet var wordOutput: NSTextField!
    
    var dictionary = tDictionary()

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        var tempFrame = window.frame
        tempFrame.size = CGSize(width: 816, height: 600)
        window.setFrame(tempFrame, display: true)
    }
    
    @IBAction func findDefForWord(sender: NSButton) {
        wordOutput.stringValue = ""
        var defs = dictionary.findDefs(wordInput.stringValue)
        var formattedDefs = "\(wordInput.stringValue):\n"
        for (ind, val) in defs.enumerate() {
            if ind == defs.count-1 {
                //LAST
                formattedDefs += "      -\(val)"
            } else if ind == 0 {
                //FIRST
                formattedDefs += "      -\(val)\n"
            } else {
                //MIDDLE
                formattedDefs += "      -\(val)\n"
            }
        }
        if formattedDefs == "\(wordInput.stringValue):\n" {
            wordOutput.stringValue = "Did not find definitions for word \(wordInput.stringValue)"
        } else {
            wordOutput.stringValue = formattedDefs
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

