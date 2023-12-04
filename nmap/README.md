# Nmap container

### Build and push locally
docker build -t ecs-nmap .
docker tag ecs-nmap:latest gorje6/ecs-nmap:latest
docker push gorje6/ecs-nmap:latest

## Variables
- IP_RANGE
- BUCKET_NAME