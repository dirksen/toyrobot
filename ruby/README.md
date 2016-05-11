This one was meant to be in a Dockerfile, but Docker for Win Beta + Win 10 Insiders
doesn't play nicely at the moment. So, straight ruby.

Everything's in the "app" dir - rspec to run the specs, ./toyrobot.rb to
run the command line.

Having some fun with this - table governs validity of locations, locations
themselves govern movement, robot is the conduit for the commands. Each command
generates a new robot with a new location - no mutable variables. Pseudo-functional ;)
