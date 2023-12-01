# commands

docker build -t ecs-nmap .
docker tag ecs-nmap:latest gorje6/ecs-nmap:latest
docker push gorje6/ecs-nmap:latest