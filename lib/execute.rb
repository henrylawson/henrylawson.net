def execute(command)
  system "#{command}" or exit!(1)
end
