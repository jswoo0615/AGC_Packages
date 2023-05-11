# AGC_Leaderboard
## 1. Leaderboard - Autoware Bridge
Autoware와 연동 된 Carla Leaderboard 실행하려면 아래와 같이 환경변수를 추가 해줍니다.  
```shell
export LEADERBOARD_ROOT=/home/${USER}/Desktop/AGC/AGC_Leaderboard/op_bridge
```

## 2. Leaderboard Agent
Autoware와 연동 된 Carla Leaderboard의 Agent를 사용하려면 아래와 같이 환경변수를 추가 해줍니다.
```shell
export TEAM_CODE_ROOT=/home/${USER}/Desktop/AGC/AGC_Leaderboard/op_agent
```

## 3. 구성
### 3.1. Leaderboard - Autoware Bridge
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
```json
{
    "_checkpoint": {
        "global_record": {
            "index": -1,
            "infractions": {
                "collisions_layout": 0.0,
                "collisions_pedestrian": 2.149510048380469,
                "collisions_vehicle": 4.299020096760938,
                "outside_route_lanes": 0.0,
                "red_light": 2.149510048380469,
                "route_dev": 0.0,
                "route_timeout": 0.0,
                "stop_infraction": 0.0,
                "vehicle_blocked": 2.149510048380469
            },
            "meta": {
                "exceptions": [
                    [
                        "RouteScenario_0",
                        0,
                        "Failed - Agent got blocked"
                    ]
                ]
            },
            "route_id": -1,
            "scores": {
                "score_composed": 7.949048566688721,
                "score_penalty": 0.126,
                "score_route": 63.08768703721207
            },
            "scores_std_dev": {
                "score_composed": "NaN",
                "score_penalty": "NaN",
                "score_route": "NaN"
            },
            "status": "Failed"
        },
        "progress": [
            1,
            1
        ],
        "records": [
            {
                "index": 0,
                "infractions": {
                    "collisions_layout": [],
                    "collisions_pedestrian": [
                        "Agent collided against object with type=walker.pedestrian.0028 and id=1116 at (x=307.616, y=195.251, z=0.002)"
                    ],
                    "collisions_vehicle": [
                        "Agent collided against object with type=vehicle.diamondback.century and id=1122 at (x=87.924, y=214.824, z=0.002)",
                        "Agent collided against object with type=vehicle.diamondback.century and id=1123 at (x=72.049, y=326.279, z=0.001)"
                    ],
                    "outside_route_lanes": [],
                    "red_light": [
                        "Agent ran a red light 971 at (x=341.25, y=209.1, z=0.104)"
                    ],
                    "route_dev": [],
                    "route_timeout": [],
                    "stop_infraction": [],
                    "vehicle_blocked": [
                        "Agent got blocked at (x=8.541, y=326.009, z=0.001)"
                    ]
                },
                "meta": {
                    "duration_game": 351.05000523105264,
                    "duration_system": 832.660768032074,
                    "route_length": 737.4217028017997
                },
                "route_id": "RouteScenario_0",
                "scores": {
                    "score_composed": 7.949048566688721,
                    "score_penalty": 0.126,
                    "score_route": 63.08768703721207
                },
                "status": "Failed - Agent got blocked"
            }
        ]
    },
    "eligible": true,
    "entry_status": "Finished with agent errors",
    "labels": [
        "Avg. driving score",
        "Avg. route completion",
        "Avg. infraction penalty",
        "Collisions with pedestrians",
        "Collisions with vehicles",
        "Collisions with layout",
        "Red lights infractions",
        "Stop sign infractions",
        "Off-road infractions",
        "Route deviations",
        "Route timeouts",
        "Agent blocked"
    ],
    "sensors": [
        "carla_camera",
        "carla_lidar",
        "carla_gnss",
        "carla_opendrive_map",
        "carla_speedometer",
        "carla_imu"
    ],
    "values": [
        "7.949",
        "63.088",
        "0.126",
        "2.150",
        "4.299",
        "0.000",
        "2.150",
        "0.000",
        "0.000",
        "0.000",
        "0.000",
        "2.150"
    ]
}
```
- 패널티 가중치  
<t> - 보행자 충돌 : 0.5  
<t> - 차량 충돌 : 0.6  
<t> - 고정 사물 충돌 : 0.5  
<t> - 신호등 신호 위반 : 0.5  
<t> - 정차 신호 위반 : 0.5  

- 평가 항목
<t> - 보행자 충돌  
<t> - 차량 충돌  
<t> - 고정 사물 충돌  
<t> - 신호등 신호 위반  
<t> - 정지 신호 위반  
<t> - 차선 이탈  
<t> - 경로 이탈  
<t> - 경로 주행 시간 초과  
<t> - 주행 불능  

- 점수 산정 방식 :  
<t> - score_penalty = 충돌 및 패널티 가중치 들의 곱
```
보행자 충돌 1회 * 차량 충돌 2회 * 신호등 신호 위반 1회 
= 0.5 * 0.6 * 0.6 * 0.7 = 0.126
```
<t> - score_composed = score_penalty * score_route
```
score_penalty * score_route
= 0.126 * 63.088 = 7.949
```

### 3.2. Leaderboard Agent
- Autoware.AI으로 구성 된 agent입니다.  
- Autoware.AI의 토픽들 (`/tf`, `/twist_raw` 등) 을 기반으로 `ROSAgent`로 전달
- `autoware-contents/` : <b>Point cloud Data, Vector Map</b>으로 구성되어 있습니다.     
<t> - PointCloud Data    
<t> - Vector Map  
- `autoware_launch/` : runtime_manager에서 사용하는 launch 파일들로 구성되어 있습니다.  
- `darknet/` : tlr 모듈을 사용하기 위한 yolov4 weight 등의 파일들로 구성되어 있습니다.  
- `hdmaps/` : Carla Simulator의 Town 데모 맵의 오픈드라이브 파일들로 구성되어 있습니다.  
- `tf` : tf.launch 파일로 구성되어 있습니다.  

## 4. 사용 방법
- `AGC_Leaderboard/op_bridge/op_scripts` 폴더로 이동합니다.
- `run_route_scenarios.sh`를 실행압니다.
- `op_bridge` 폴더의 `results.json`에서 결과를 확인합니다.