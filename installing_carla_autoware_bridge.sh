# Carla - Autoware.AI Bridge / Leaderboard Agent 설치
cd /home/${USER}/Desktop/AGC/
git clone https://github.com/jswoo0615/AGC_Packages.git
cd /home/${USER}/Desktop/AGC/AGC_Packages
mv AGC_Packages AGC_Leaderboard
git checkout AGC_Leaderboard

cd /home/${USER}/Desktop/AGC/AGC_Leaderboard/op_bridge
pip install -r requirements.txt
pip3 install -r requirements.txt

# Carla - Autoware.AI Bridge 환경 변수 추가
sh -c "echo \"export LEADERBOARD_ROOT=/home/${USER}/Desktop/AGC/AGC_Leaderboard/op_bridge\" >> ~/.bashrc"

# Leaderboard Agent 환경 변수 추가
sh -c "echo \"export LEADERBOARD_ROOT=/home/${USER}/Desktop/AGC/AGC_Leaderboard/op_agent\" >> ~/.bashrc"