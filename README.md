# AGC_Leaderboard
## 목차
[1. Leaderboard - Autoware Bridge](#1-leaderboard---autoware-bridge)  
[2. Leaderboard Agent](#2-leaderboard-agent)


### 1. Leaderboard - Autoware Bridge
Autoware와 연동 된 Carla Leaderboard 실행하려면 아래와 같이 환경변수를 추가 해줍니다.  
```shell
export LEADERBOARD_ROOT=/home/${USER}/Desktop/AGC/AGC_Leaderboard/op_bridge
```

### 2. Leaderboard Agent
Autoware와 연동 된 Carla Leaderboard의 Agent를 사용하려면 아래와 같이 환경변수를 추가 해줍니다.
```shell
export TEAM_CODE_ROOT=/home/${USER}/Desktop/AGC/AGC_Leaderboard/op_agent
```

### 3. 구성
<b>3.1. Leaderboard - Autoware Bridge</b>
- data  
주행경로와 해당 웨이포인트에서 발생하는 시나리오들에 대한 정의    
  
- leaderboard
시나리오들에 대한 정의
사용 가능한 시나리오   
</t> - Scenario 1 : ControlLoss  
</t> - Scenario 2 : FolowLeadingVehicle  
</t> - Scenario 3 : DynamicObjectCrossing  
</t> - Scenario 4 : VehicleTurningRoute  
</t> - Scenario 5 : OtherLeadingVehicle  
</t> - Scenario 6 : ManeuverOppositeDirection  
</t> - Scenario 7 : SignalJunctionCrossingRoute  
</t> - Scenario 8 : SignalJunctionCrossingRoute  
</t> - Scenario 9 : SignalJunctionCrossingRoute  
</t> - Scenario 10 : NoSignalJunctionCrossingRoute  

- op_bridge  
ROS Bridge
- op_scripts  
</t> - run_exploration_mode : 일반 주행 모드 (에고 차량만 배치되어 주행)  
</t> - run_route_scenario : Leaderboard 모드  
</t> - run_srunner_agent : Scenario Runner 모드  
- scripts  
시나리오 실행
- results.json  
주행 결과 파일 

<b>3.2. Leaderboard Agent</b>
- 작성 중

### 4. 사용 방법
