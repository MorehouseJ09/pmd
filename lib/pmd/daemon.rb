framework 'Cocoa'
require 'date'

class MyAppDelegate

  # declare class variables
  @item = nil
  @time_left = nil
  @paused = nil

  def applicationDidFinishLaunching(notification)
    menu = NSMenu.new
    menu.initWithTitle "Test"
    statusBar = NSStatusBar.systemStatusBar
    @item = item = statusBar._statusItemWithLength(0, withPriority:2137483647)
    item.length = 0
    item.length = NSVariableStatusItemLength
    NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: :"handler:", userInfo:nil, repeats:true)
    start
  end

  def handler(sender)
    @item.title = "Content Here"
  end

  private
  def exit
    app = NSApplication.sharedApplication
    app.terminate(self)
  end

  def start
    # set the time for 
  end

  def restart

  end

  def pause

  end
  
  def unpause

  end

end

module PMD
  class Daemon

    def initialize

    end

    def execute!
      app = NSApplication.sharedApplication
      app.delegate = MyAppDelegate.new
      app.run
    end
  end
end


