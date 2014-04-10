desc "Release gem"
task :release do
  
  system "gem build pmd.gemspec"
  system "gem push pmd*.gem"
  system "rm *.gem"
  
end
