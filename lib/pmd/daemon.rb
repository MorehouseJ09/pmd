framework 'Cocoa'
require 'date'

module PMD

  class MyAppDelegate

    # declare class variables
    @item = nil
    @started = false
    @end_time = nil
    @paused = false
    @break = false

    def applicationDidFinishLaunching(notification)
      menu = NSMenu.new
      menu.initWithTitle "Test"
      statusBar = NSStatusBar.systemStatusBar
      @item = item = statusBar._statusItemWithLength(0, withPriority:2137483647)
      item.length = 0
      item.length = NSVariableStatusItemLength
      NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: :"handler:", userInfo:nil, repeats:true)
      start Config.pomodoro_length
    end

    def handler(sender)
      # check to see if stop was flagged - this should exit
      if stop_handler
        return
      # check to see if a restart was flagged
      elsif restart_handler
        return
      # check to see if a pause was flagged
      elsif pause_handler
        return
      else # normal run
        update
      end
    end

    private
    def stop_handler
      if not Stop.stopped
        return false
      end
      app = NSApplication.sharedApplication
      app.terminate(self)
      return true
    end

    def restart_handler
      if not Restart.restarted
        return false
      end
      start Config.pomodoro_length 
    end

    def pause_handler

      is_paused = Pause.is_paused
      
      if not @paused == is_paused #change of state
        if is_paused 
          pause
        else
          unpause
        end
      end

    end

    # utilities
    def start(length = Config.pomodoro_length)
      @end_time = Time.now + length
      @running = true
      update
    end

    def update
      # determine the amount of difference between end_time and now
      difference = @end_time - Time.now
      puts difference
    end

  end

  class Daemon

    def execute!
      app = NSApplication.sharedApplication
      app.delegate = MyAppDelegate.new
      app.run
    end
  end
end

