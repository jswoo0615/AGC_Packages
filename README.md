# AGC_Autoware_AI  
## <b>1. 설치 과정</b>
### <b>1. CUDA / CUDNN 설치</b>  
- `tlr (traffic light recognition)` 사용 시 필요 사항  
<t> - CUDA 11.1  
<t> - cuDNN 8  
<t> - YOLO v3 / v4  

1. CUDA 설치
- CUDA Toolkit 11.1을 다운받는 아래 링크로 이동합니다.  
[CUDA Toolkit Download](https://developer.nvidia.com/cuda-11.1.0-download-archive)
- OS, 아키텍처 등을 선택하고 Installer Type에서 <b>`runfile (local)`</b>로 선택하여 다운받습니다.  
- 아래 그림과 같이 `cuda_11.1.0_455.23.05_linux.run` 설치파일을 받고 실행합니다.  
드라이버를 제외한 나머지 설치를 진행합니다.  
![Screenshot from 2023-05-25 08-23-09](https://github.com/jswoo0615/jswoo0615.github.io/assets/128343128/a067bb6d-ff25-4bf1-8ea0-f88b1e427cff)
- 설치 완료 후 `~/.bashrc`에서 환경변수 설정을 진행합니다.  
  ```shell
  export PATH=$PATH:/usr/local/cuda-11.1/bin
  export LD_LIBRARY_PATH=/usr/local/cuda-11.1/lib64
  export LD_LIBRARY_PATH=/usr/local/cuda-11.1/extras/CUPTI/lib64:$LD_LIBRARY_PATH
  ```   
- 확인 방법  
  ```shell 
  nvcc -V
  ```
  위 명령어를 이용하여 설치된 CUDA 버전을 확인할 수 있습니다.  
  ![Screenshot from 2023-05-25 08-27-56](https://github.com/jswoo0615/jswoo0615.github.io/assets/128343128/4c3d772d-0728-475d-be8d-f66d1e52db13)

2. <b>cudnn 설치</b>
- cudnn 다운로드를 위해 nvidia developer 회원가입을 해줍니다.  
- 아래 링크로 이동하여 cudnn8 다운로드 받습니다.  
[cuDNN Download](https://developer.nvidia.com/rdp/cudnn-download)
- 로그인 후 <b>Archived cuDNN Release</b>를 눌러 이전 버전의 cuDNN을 다운받으러 이동합니다.  
- 과정 1.의 CUDA 11.1에 맞는 cuDNN 8버전을 선택합니다.  
- `cuDNN Library for Linux (x86_64)`를 선택합니다.
![Screenshot from 2023-05-25 09-27-14](https://github.com/jswoo0615/jswoo0615.github.io/assets/128343128/32be3584-1975-43bf-b382-820232f5f794)
- 다운로드 받은 후, 압축 해제하면 `include`, `lib64`, `NVIDIA_SLA_cuDNN_Support.txt` 폴더 및 파일을 확인할 수 있습니다.  
![Screenshot from 2023-05-25 09-43-08](https://github.com/jswoo0615/jswoo0615.github.io/assets/128343128/2de0409e-3d1e-4df6-9eee-aa5e1d7f977b)
- `include`, `lib64` 폴더 안의 파일들을 CUDA가 설치되어 있는 경로 (`/usr/local/cuda-11.1`)로 복사합니다.
  ```shell
  sudo cp include/cudnn* /usr/local/cuda-11.1/include
  sudo cp lib64/libcudnn* /usr/local/cuda-11.1/lib64
  sudo chmod a+r /usr/local/cuda-11.1/lib64/libcudnn*
  ```
- 설치 확인  
  ```shell
  cat /usr/local/cuda/include/cudnn_version.h | grep CUDNN_NAJRO -A 2
  ```
  위의 명령어를 실행하여 cuDNN이 제대로 설치되었는지 확인할 수 있습니다.  
![Screenshot from 2023-05-25 09-51-44](https://github.com/jswoo0615/jswoo0615.github.io/assets/128343128/e84c077b-0c73-4b6c-b73b-11c12f8f81ec)

### <b>2. 패키지 다운로드</b>
- <b> 당 과정은 `/home/${USER}/Desktop/AGC/Autoware_AI` 폴더를 기준으로 진행됩니다.</b> 
- 종속성 패키지를 설치합니다.  
  ```shell
  sudo apt update
  sudo apt install -y python-catkin-pkg python-rosdep ros-$ROS_DISTRO-catkin
  sudo apt install -y python3-pip python3-colcon-common-extensions python3-setuptools python3-vcstool
  pip3 install -U setuptools
  ```
- `src` 폴더를 생성합니다.  
  ```shell
  mkdir -p src
  ```
- `AGC_Autoware.repos`를 이용하여 `src` 폴더에  소스코드들을 다운로드 받습니다.  
  ```shell
  vcs import src < AGC_Autoware.repos
  ```  
  위 명령어를 실행하면 아래 그림과 같이 소스 코드가 `src` 폴더로 클론됩니다.  
![Screenshot from 2023-05-11 12-14-05](https://github.com/jswoo0615/AGC_Packages/assets/128343128/8cfe5af8-e956-4f9b-9a1c-b039b9a5e948)

  `AGC_Autoware_AI_Root/src/autoware` 폴더 내에 패키지 소스코드가 클론되어있습니다.  
![Screenshot from 2023-05-11 13-13-43](https://github.com/jswoo0615/AGC_Packages/assets/128343128/791264d0-885c-4969-b473-94a20cdc2738)


### <b>2. 빌드</b>
- rosdep를 이용하여 종속성 패키지를 설치합니다.  
  ```shell
  rosdep update
  rosdep install -y --from-paths src --ignore-src --rosdistro $ROS_DISTRO
  ```
- 터미널의 경로를 `AGC_Autoware_AI 루트 폴더`로 이동합니다.  
- 아래와 같이 명령어를 실행합니다.  
`colcon build --cmake-args -DCMAKE_TYPE=Release` 

## <b>2. 설정 과정</b>
- `~/.bashrc` 환경변수 추가  
<t> - 텍스트 편집기로 `~/.bashrc` 파일에 아래와 같이 환경변수를 추가해줍니다.  
<t> `source /AGC_Autoware_AI 루트 경로/install/setup.bash`를 추가해줍니다.  
<t> - 해당 내용 추가 후 터미널에 `source ~/.bashrc` 명령어를 실행하여 Autoware.AI가 실행 될 수 있도록 설정해줍니다.  

## <b>3. 실행</b>
- 기본적으로 `runtime_manager`를 실행하여 센서, 차량, 지도 등을 추가하여 ADStack을 실행하지만,  
<t> 실행 명령어 : `roslaunch runtime_manager runtime_manager.launch`  
<t> 여기서는 launch 파일에 모듈을 실행하도록 구성되어 있습니다.  
- AGC_Leaderboard의 `op_bridge/op_script` 경로의 `run_route_scenarios.sh`를 실행합니다.  
- `run_route_scenario.sh` 파일을 실행하여 Autoware AD Stack이 적용된 Carla Simulator 차량을 제어합니다.