# cloudsec-scan-conts

## Build images:

docker build -t ecs-nmap .
docker tag ecs-nmap:latest gorje6/ecs-nmap:latest
docker push gorje6/ecs-nmap:latest

docker build -t ecs-prowler .
docker tag ecs-prowler:latest gorje6/ecs-prowler:latest
docker push gorje6/ecs-prowler