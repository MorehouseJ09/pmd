# make sure we can inherit the library for backlog correctly
lib = File.expand_path "./lib" 
$:.unshift lib unless $:.include?(lib)

require 'backlog'

Gem::Specification.new do |s|
  s.name        = "pmd"
  s.version     = Backlog::VERSION
  s.licenses    = ['MIT']
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jon Morehouse"]
  s.email       = ["morehousej09@gmail.com"]
  s.homepage    = "http://github.com/jonmorehouse/pmd"
  s.summary     = %q{Pomodoro Manager / Timer}
  s.description = %q{MacRuby Pomodoro Timer. Places a timer in your status bar.}
 
  s.files        = Dir.glob("{bin,lib}/**/*") + %w(README.md)
  s.executables  = ['pmd']
  s.require_path = 'lib'
end
