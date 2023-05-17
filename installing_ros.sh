# Update sources.list
sudo apt-get update

# Setup sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Setup the keys
sudo apt install curl -y
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# Update sources.list
sudo apt-get update

# Download desktop full packages 
sudo apt install ros-melodic-desktop-full -y

# ~/.bashrc 환경변수 등록
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

source ~/.bashrc

# Dependencies for building packages
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential -y
sudo rosdep init
rosdep update

sudo apt install python-pip -y
sudo apt install python3-pip -y

pip install --upgrade pip
pip3 install --upgrade pip

pip install transforms3d
pip3 install transforms3d

sudo apt install python3-pip python3-all-dev python3-rospkg -y
sudo apt install ros-melodic-desktop-full --fix-missing -y