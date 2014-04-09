require 'fileutils'
require 'aruba/cucumber'

aruba_dir = nil
pmd_dir = "/tmp/pmd"

Before do

  @dirs = ["tmp"]
  aruba_dir = File.join Dir.pwd, "tmp"
  set_env "HOME", aruba_dir

end


at_exit do

  [aruba_dir, pmd_dir].each do |dir|
    if dir and File.directory? dir
      FileUtils.rm_rf dir
    end
  end

end
