#!/bin/bash

# 메인 경로 설정
mkdir -p /home/${USER}/Desktop/AGC/Carla-Simulator \
         /home/${USER}/Desktop/AGC/autoware-ai  \
         /home/${USER}/Desktop/AGC/Carla-Leaderboard \
         /home/${USER}/Desktop/AGC/Carla-Scenario_Runner
echo "export AGC_ROOT=/home/${USER}/Desktop/AGC/" >> ~/.bashrc
source ~/.bashrc

# 의존성 패키지 설치
sudo apt-get update &&
sudo apt-get install wget software-properties-common &&
sudo add-apt-repository ppa:ubuntu-toolchain-r/test &&
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add - &&
sudo apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-8 main" &&
sudo apt-get update

sudo apt-get install build-essential clang-8 lld-8 g++-7 cmake ninja-build libvulkan1 python python-pip python-dev python3-dev python3-pip libpng-dev libtiff5-dev libjpeg-dev tzdata sed curl unzip autoconf libtool rsync libxml2-dev git -y

# 컴파일러 변경
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/lib/llvm-8/bin/clang++ 180 &&
sudo update-alternatives --install /usr/bin/clang clang /usr/lib/llvm-8/bin/clang 180

# pip 설치
# Python3
pip3 install --upgrade pip

# Python2
pip install --upgrade pip

# 파이썬 의존성 패키지 설치
pip install --user setuptools &&
pip3 install --user -Iv setuptools==47.3.1 &&
pip install --user distro &&
pip3 install --user distro &&
pip install --user wheel &&
pip3 install --user wheel auditwheel

pip install testresouces &&
pip3 install testresources


# Carla 시뮬레이터 설치
cd /home/${USER}/Desktop/AGC/Carla-Simulator
wget -P ~/AGC/Carla-Leaderboard_2_0 https://carla-releases.s3.eu-west-3.amazonaws.com/Linux/Leaderboard/CARLA_Leaderboard_20.tar.gz
tar -xvfz CARLA_Leaderboard_20.tar.gz

# 환경변수 설정
echo "export CARLA_ROOT=${AGC_ROOT}/Carla-Leaderboard_2_0" >> ~/.bashrc

echo "export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI" >> ~/.bashrc
echo "export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla " >> ~/.bashrc
echo "export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla/agents" >> ~/.bashrc
echo "export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla/dist/carla-$CARLA_VERSION-py2.7-linux-x86_64.egg" >> ~/.bashrc    # ROS Melodic은 Python2.x를 사용, Python3.x로 추후 변경 예정
echo "export CARLA_SERVER=~/carla_simulator/CARLA_$CARLA_VERSION/CarlaUE4.sh" >> ~/.bashrc

# Carla Leaderboard 설치
cd /home/${USER}/Desktop/AGC/Carla-Leaderboard
git clone -b leaderboard-2.0 --single-branch https://github.com/carla-simulator/leaderboard.git
pip install -r requirements.txt
pip3 install -r requirements.txt

# Carla Scenario Runner 설치
cd /home/${USER}/Desktop/AGC/Carla-Scenario_Runner
git clone -b leaderboard-2.0 --single-branch https://github.com/carla-simulator/scenario_runner.git
pip install -r requirements.txt
pip3 install -r requirements.txt

# 환경변수 등록
echo "export PYTHONPATH="${CARLA_ROOT}/PythonAPI/carla/":"${SCENARIO_RUNNER_ROOT}":"${LEADERBOARD_ROOT}":"${CARLA_ROOT}/PythonAPI/carla/dist/carla-0.9.13-py2.7-linux-x86_64.egg":${PYTHONPATH}" << ~/.bashrc     # 추후 Python3.x로 진행 예정

exit 0

