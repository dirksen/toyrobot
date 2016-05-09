This one's in a dockerfile because I don't have ruby installed.

Build runs the specs - not the greatest pattern, but it'll do for this.

docker build -t toyrobot:ruby .
docker run -it -v `pwd`/app:/app

Similar pattern to the powershell one - passing a new location for each
move, which means passing a new robot back. Commands go in via the robot,
locations are generated from the table.