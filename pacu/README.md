# Pacu container

### Build and push to Docker hub
docker build -t ecs-pacu .
docker tag ecs-pacu:latest gorje6/ecs-pacu:latest
docker push gorje6/ecs-pacu

### Run locally
docker build -t my-pacu-container .
docker run -d -p 2222:22 my-pacu-container