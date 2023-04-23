# AGC_Packages
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

설치 후 재부팅을 한 후 `nvidia-smi` 명령어를 입력하면 아래 그림과 같이 그래픽 카드 드라이버가 설치됨을 확인하실 수 있습니다.


## 2. Installing Carla Simulator packages