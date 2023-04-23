## 1. Installing Graphic Driver
### - 종속성 패키지 설치
Carla Simulator를 사용하기 전에 그래픽 카드의 드라이버를 설치해주어야 합니다.  
그래픽 드라이버 설치에 앞서 종속성 패키지를 설치해야 합니다.  
먼저 패키지 리스트를 업데이트, 업그레이드를 진행합니다.
```shell
sudo apt-get update
sudo apt-get upgrade -y
```

그 후 build-essential 패키지를 설치합니다.
```shell
sudo apt-get install build-essential -y
```

### - 그래픽 드라이버 설치
그래픽 드라이버를 설치하는 방법은 여러가지 있지만, autoinstall로 진행하도록 하겠습니다.
먼저 그래픽 드라이버 리포지토리를 패키지 리스트에 추가를 하고,
```shell
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
```

autoinstall 명령어로 설치를 진행합니다
```shell
sudo ubuntu-drivers autoinstall
```

설치 후 재부팅을 한 후 `nvidia-smi` 명령어를 입력하면 아래 그림과 같이 그래픽 카드 드라이버가 설치됨을 확인하실 수 있습니다. (그림 추가 예정)

위의 명령어들은 `installing_graphic_driver.sh`에 있습니다
터미널에서 `./installing_graphinc_driver.sh`를 실행하면 사용중이신 그래픽 카드에 적합한 그래픽 드라이버를 자동으로 인식하여 설치합니다.

## 2. Installing Carla Simulator packages
여기서는 아래와 같이 세 가지를 통합 구성을 진행합니다. 
- Carla Server / Client 
- Carla Scenario Runner
- Carla Leaderboard

전반적인 패키지 구성은 아래 그림과 같이 총 네 가지로 구분되며, 현재 브랜치에서는 Carla-Leaderboard, Carla Scenario_Runner, Carla-Simulator 세 가지를 다운로드 및 설치까지 하는 패키지로 합니다.  
<img width="218" alt="Screenshot 2023-04-23 at 12 14 08 PM" src="https://user-images.githubusercontent.com/128343128/233817757-631d04de-7696-4e37-9980-7bd3a1f707af.png">

### - 의존성 패키지 설치 (Carla Simulator)
```shell
# 의존성 패키지 설치
sudo apt-get update &&
sudo apt-get install wget software-properties-common &&
sudo add-apt-repository ppa:ubuntu-toolchain-r/test &&
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add - &&
sudo apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-8 main" &&
sudo apt-get update

sudo apt-get install build-essential clang-8 lld-8 g++-7 cmake ninja-build libvulkan1 python python-pip python-dev python3-dev python3-pip libpng-dev libtiff5-dev libjpeg-dev tzdata sed curl unzip autoconf libtool rsync libxml2-dev git -y
```
Carla Simulator를 실행하기 위해 여러가지 종속성 패키지들을 설치해야 합니다.  
Carla Simulator는 언리얼 엔진 4를 기반으로 동작하는 오픈소스 소프트웨어 입니다.  
그러므로 Carla Simulator를 구동하는 Carla Server를 실행하기 위해서는 언리얼 엔진에서 사용하는 C++ 컴파일러 설치를 해주어야 합니다.  
clang을 사용하므로 같이 설치를 해줍니다.  

그 후 우분투에서 사용하는 기본 컴파일러인 gcc, g++에서 clang으로 변경을 해주어야 합니다.  
```shell
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/lib/llvm-8/bin/clang++ 180 &&
sudo update-alternatives --install /usr/bin/clang clang /usr/lib/llvm-8/bin/clang 180
```

기본적인 컴파일러 설치 세팅 완료 후 Carla Simulator에서 차량 움직임을 확인할 수 있는 시뮬레이션을 하기 위한 Python 종속성 패키지를 설치합니다.  
차량 움직임을 구동하는 방식은 Python 패키지인 pygame을 기반으로 동작합니다.

pip 업그레이드를 해준 후, Carla Simulato에서 필요한 Python 패키지를 설치해줍니다.
```shell
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

```
해당 종속성 패키지는 `carla-sim_packages.sh`를 실행하면 자동으로 설치하게 되어있습니다.

### - Carla Simulator 설치

```shell
```
### - Carla Leaderboard 설치
```shell
```
### - Carla Scenario Runner 설치
```shell
```