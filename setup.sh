sudo apt-get update -y
sudo apt-get install -y \
ca-certificates \
curl \
gnupg \
lsb-release

# 2. Add Docker’s official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
| sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# 3. Set up the Docker repository
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" \
| sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

# 4. Install Docker Engine, CLI, and containerd
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# 5. (Optional) Allow your user to run Docker without sudo
sudo usermod -aG docker $USER
