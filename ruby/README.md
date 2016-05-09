This one's in a dockerfile because I don't have ruby installed.

Build runs the specs - not the greatest pattern, but it'll do for this.

docker build -t toyrobot:ruby .
docker run -it -v `pwd`/app:/app