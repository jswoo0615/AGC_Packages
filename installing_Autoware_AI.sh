cd /home/${USER}/Desktop/AGC/
git clone https://github.com/jswoo0615/AGC_Packages.git
mv AGC_Packages AGC_Autoware_AI
git checkout Autoware_AI

mkdir -p src

vcs import src < AGC_Autoware.repos

sudo rosdep init
rosdep update

colcon build