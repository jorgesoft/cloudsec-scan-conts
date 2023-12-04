# Prowler container

### Build and push locally
docker build -t ecs-prowler .
docker tag ecs-prowler:latest gorje6/ecs-prowler:latest
docker push gorje6/ecs-prowler

### Run locally
docker run -e AWS_ACCESS_KEY_ID=abc -e AWS_SECRET_ACCESS_KEY=xyz -e PROWLER_SERVICES="ec2" gorje6/ecs-prowler:latest