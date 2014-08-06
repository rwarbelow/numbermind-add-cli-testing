Dir["./lib/*.rb"].each { |file| require file }

CLI.new($stdin, $stdout).start
