#!/bin/bash

# 메인 경로 설정
mkdir -p /home/${USER}/Desktop/AGC/AGC_Carla_Simulator

# Carla Simulator 설치
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

pip install testresources

# 파이썬 의존성 패키지 설치
pip install --user setuptools &&
pip3 install --user -Iv setuptools==47.3.1 &&
pip install --user distro &&
pip3 install --user distro &&
pip install --user wheel &&
pip3 install --user wheel auditwheel

python -m pip install pygame
python3 -m pip3 install pygame

# Carla 시뮬레이터 설치
cd /home/${USER}/Desktop/AGC/Carla-Simulator
wget -P ~/Desktop/AGC/Carla-Simulator https://carla-releases.s3.eu-west-3.amazonaws.com/Linux/Leaderboard/CARLA_Leaderboard_20.tar.gz
tar -xvfz CARLA_Leaderboard_20.tar.gz

# Python 패키지 설치
cd /home/${USER}/Desktop/AGC/Carla-Simulator/PythonAPI/examples
pip install -r requirements.txt

# 환경변수 설정
sh -c "echo \"export CARLA_ROOT=/home/${USER}/Desktop/AGC/Carla-Simulator\" >> ~/.bashrc"

sh -c "echo \"export PYTHONPATH=/home/${USER}/Desktop/AGC/Carla-Simulator/PythonAPI\" >> ~/.bashrc"
sh -c "echo \"export PYTHONPATH=/home/${USER}/Desktop/AGC/Carla-Simulator/PythonAPI/carla\" >> ~/.bashrc"
sh -c "echo \"export PYTHONPATH=/home/${USER}/Desktop/AGC/Carla-Simulator/PythonAPI/carla/agents\" >> ~/.bashrc"
sh -c "echo \"export PYTHONPATH=/home/${USER}/Desktop/AGC/Carla-Simulator/PythonAPI/carla/dist/carla-0.9.13-py2.7-linux-x86_64.egg\" >> ~/.bashrc"    # ROS Melodic은 Python2.x를 사용, Python3.x로 추후 변경 예정
source ~/.bashrc

# 환경변수 등록


exit 0
