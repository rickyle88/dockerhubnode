# This does not use "xargs --no-run-if-empty" which is not supported on Mac
# This should work on Mac and Linux
docker stop $(docker ps -a -q)
docker container prune -f
docker-compose scale chrome=6
docker-compose up
