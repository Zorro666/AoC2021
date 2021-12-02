//
//  AppDelegate.swift
//  AoC2021Swift
//
//  Created by Jake on 02/12/2021.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

  @IBOutlet var window: NSWindow!


  func applicationDidFinishLaunching(_ aNotification: Notification) {
    Program.Run()
    exit(0)
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }

  func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }


}

