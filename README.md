# AGC_Autoware_AI  
## <b>1. 설치 과정</b>
### <b>1. CUDA / CUDNN 설치</b>  
- `tlr (traffic light recognition)` 사용 시 필요 사항  
<t> - CUDA 11.1, cudnn 8  
<t> - cudnn 8  
<t> - YOLO v3 / v4
1. CUDA 설치  
- CUDA Toolkit 11.1을 다운받는 아래 링크로 이동합니다.  
[CUDA Toolkit Download](`https://developer.nvidia.com/cuda-11.1.0-download-archive`)
- OS, 아키텍처 등을 선택하고 Installer Type에서 <b>`runfile (local)`</b>로 선택하여 다운받습니다.  
- `*.run` 설치파일을 받고 실행합니다.  (그림 추가)
- 
- 


2. cudnn 설치

### <b>2. 패키지 다운로드</b>
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
- 현재 (23.05.11) tlr 모듈 (traffic light recognition) 모듈을 제외하고 빌드를 진행합니다.  
  (추후 tlr 모듈 추가 예정)
- 터미널의 경로를 `AGC_Autoware_AI 루트 폴더`로 이동합니다.  
- 아래와 같이 명령어를 실행합니다.  
`colcon build`

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