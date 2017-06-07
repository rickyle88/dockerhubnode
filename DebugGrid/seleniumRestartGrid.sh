docker ps -a | grep ago | awk '{print $1}' | xargs --no-run-if-empty docker rm -f
docker-compose scale chrome=1
docker-compose up