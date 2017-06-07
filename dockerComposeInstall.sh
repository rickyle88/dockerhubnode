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