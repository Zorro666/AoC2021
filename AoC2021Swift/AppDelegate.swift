import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

  @IBOutlet var window: NSWindow!

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    if (NSClassFromString("XCTest") == nil) {
    Program.Run()
    exit(0)
    }
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }

  func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }

  func applicationWillUpdate(_ notification: Notification) {
  }
}

