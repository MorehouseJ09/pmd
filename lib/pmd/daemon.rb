framework 'Cocoa'
require 'date'

class MyAppDelegate

  def applicationDidFinishLaunching(notification)


    menu = NSMenu.new
    item = menu.addItemWithTitle("Void", action: :"void:", keyEquivalent:"")
    statusBar = NSStatusBar.systemStatusBar
    @item = item = statusBar._statusItemWithLength(0, withPriority:2137483647)
    item.length = 0
    item.menu = menu
    item.highlightMode = true
    item.length = NSVariableStatusItemLength
    statusBar = NSStatusBar.systemStatusBar
    @item =  statusBar._statusItemWithLength(0, withPriority:2137483647)

    #@item.title = "JON MOREHOUSE"
      #"%d:%02d" % [ left / 60, left % 60 ]
    #item.menu = menu
    #item.highlightMode = true
    #item.length = NSVariableStatusItemLength
    #time = 25 * 60
    NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: :"update:", userInfo:nil, repeats:true)
    update
  end
  
  def initialize

  end

  def update(sender = nil)
    @item.title = "test"
    #update
    #updateCounter
  end


  #def exit
    #exit false
  #end

  def updateTime
    left = (@finish - DateTime.now).*(86400).to_i
    if left < 0
      exit(true)
    end
    @item.title = "%d:%02d" % [ left / 60, left % 60 ]
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
