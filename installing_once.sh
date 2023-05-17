# 그래픽 카드 드라이버 설치
git clone https://github.com/jswoo0615/AGC_Packages.git


# Carla Simulator 설치
git clone https://github.com/jswoo0615/AGC_Packages.git

# Autoware AI 설치
git clone https://github.com/jswoo0615/AGC_Packages.git

# Carla Leaderboard 설치
git clone https://github.com/jswoo0615/AGC_Packages.git


# Carla Scenario Runner 설치
git clone https://github.com/jswoo0615/AGC_Packages.git

# Carla_Autoware_Map 











./installing_graphic_driver.sh
./installing_carla-sim.sh
./installing_carla_autoware_bridge.sh
./installing_scenario_runner.sh

sh -c "echo \"export PYTHONPATH="${PYTHONPATH}":"/home/${USER}/Desktop/AGC/Carla-Scenario_Runner":"/home/${USER}/Desktop/AGC/Carla-Leaderboard":"/home/${USER}/Desktop/AGC/Carla-Simulator/PythonAPI/carla/dist/carla-0.9.13-py2.7-linux-x86_64.egg"\" >> ~/.bashrc"     # 추후 Python3.x로 진행 예정