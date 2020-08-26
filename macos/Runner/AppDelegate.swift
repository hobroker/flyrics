import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
  var popover: NSPopover!
  var statusBarItem: NSStatusItem!
  override func applicationShouldTerminateAfterLastWindowClosed(_: NSApplication) -> Bool {
    return true
  }

  override func applicationDidFinishLaunching(_: Notification) {
    // Create the SwiftUI view that provides the window contents.
    let flutterViewController = FlutterViewController()
    RegisterGeneratedPlugins(registry: flutterViewController)

    // Create the popover
    let popover = NSPopover()
    popover.contentSize = NSSize(width: 300, height: 500)
    popover.behavior = .transient
    popover.contentViewController = flutterViewController
    self.popover = popover

    // Create the status item
    statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))

    //openPopover()

    if let button = statusBarItem.button {
      button.title = "LF"
      button.action = #selector(togglePopover(_:))
    }
  }

  @objc func togglePopover(_ sender: AnyObject?) {
    if popover.isShown {
      popover.performClose(sender)
    } else {
      openPopover()
    }
  }

  @objc func openPopover() {
    if let button = statusBarItem.button {
      popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
    }
  }
}
