# Carla Scenario Runner 설치
cd /home/${USER}/Desktop/AGC
git clone https://github.com/jswoo0615/AGC_Packages.git
cd /home/${USER}/Desktop/AGC/AGC_Packages
mv AGC_Packages AGC_Scenario_Runner
cd /home/${USER}/Desktop/AGC/AGC_Scenario_Runner
git checkout AGC_Scenario_Runner
pip install -r requirements.txt
pip3 install -r requirements.txt

# Carla Secnario Runner 환경 변수 추가
sh -c "echo \"export SCENARIO_RUNNER_ROOT=/home/${USER}/Desktop/AGC/AGC_Scenario_Runner\" >> ~/.bashrc"