##########################################################
# Install Docker on Debian Jessie on Google Cloud Platform
##########################################################

# switch to root and root home directory
#sudo -i

# Add backports
echo "deb http://http.debian.net/debian wheezy-backports main" >> /etc/apt/sources.list.d/backports.list

# Update package information
apt-get update

# purge existing docker repositories
apt-get purge "lxc-docker*"
apt-get purge "docker.io*"

# Update package information, ensure that APT works with the https method, and that CA certificates are installed
apt-get -qy update
apt-get install -qy apt-transport-https ca-certificates gnupg2

# Add the new GPG key.
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Add docker dependencies
echo "deb https://apt.dockerproject.org/repo debian-jessie main" >> /etc/apt/sources.list.d/docker.list

# Update apt-get
apt-get update -qy
apt-cache policy docker-engine

# Install docker
apt-get install -qy docker-engine

# Start the docker daemon
service docker start



##########################################################
# Install docker-compose
##########################################################

# Switch to root user and root home directory
#sudo -i

# Install curl
apt-get -qy install curl

# Download docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Make docker-compose executable
chmod +x /usr/local/bin/docker-compose




###########################################################
# Start selenium grid from docker-compose.yml
###########################################################
docker ps -a | grep ago | awk '{print $1}' | xargs --no-run-if-empty docker rm -f
docker-compose scale chrome=12
docker-compose up