def execute(command)
  puts "Executing: #{command}"
  system "#{command}" or exit!(1)
end
