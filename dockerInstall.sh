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