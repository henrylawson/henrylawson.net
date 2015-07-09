def execute(command)
  puts "#{DateTime.now} | Executing: #{command}"
  system "#{command}" or exit_with_error
end

def exit_with_error
  puts "Previous command exited with non zero return code"
  exit!(1)
end
