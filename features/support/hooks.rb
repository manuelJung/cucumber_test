After do |s| 
  # Tell Cucumber to quit after this scenario is done - if it failed.
  Cucumber.wants_to_quit = true if s.failed?
  if s.failed?
    puts "Cucumber_Error"
  end
end