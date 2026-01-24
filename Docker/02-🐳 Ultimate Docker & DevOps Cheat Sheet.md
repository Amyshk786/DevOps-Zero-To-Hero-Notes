


# 🐳 Ultimate Docker & DevOps Cheat Sheet

A practical command reference for Docker, Compose, Swarm, and DevOps workflows.

---

# 📦 DOCKER BASICS

```bash
docker init
docker version
docker info
docker system info
docker context ls
docker context use <context>




===============================================================================================================================================================================================================




# 🖼️ IMAGES

docker build -t friendlyname .
docker build --no-cache -t app:latest .
docker build -f Dockerfile.dev -t app:dev .

docker images
docker image ls
docker image inspect <image>
docker history <image>

docker pull <image>
docker push <image>
docker search <image>

docker tag <image> username/repository:tag
docker rmi <image>
docker rmi $(docker images -q)
docker image prune -a

docker save -o image.tar <image>
docker load -i image.tar








===============================================================================================================================================================================================================



# 📦 CONTAINERS

docker run friendlyname
docker run -d -p 4000:80 friendlyname
docker run -it friendlyname bash
docker run --name mycontainer friendlyname
docker run --env-file .env friendlyname
docker run -v myvolume:/data friendlyname
docker run -v $(pwd):/app friendlyname
docker run --network mynetwork friendlyname
docker run --restart unless-stopped nginx
docker run --cpus="1.5" --memory="1g" nginx
docker run --read-only nginx
docker run --cap-drop ALL nginx






📦 Container Management

docker ps
docker ps -a
docker start <container>
docker stop <container>
docker restart <container>
docker kill <container>
docker pause <container>
docker unpause <container>
docker rename old new
docker update --memory 500m <container>






📦 Exec & Access

docker exec -it <container> bash
docker attach <container>






📦 Logs & Monitoring

docker logs <container>
docker logs -f <container>
docker logs --tail 100 <container>
docker stats
docker top <container>





📦 Inspection & Debugging

docker inspect <container>
docker port <container>
docker diff <container>
docker events





📦 Copy Files

docker cp file.txt <container>:/file.txt
docker cp <container>:/file.txt .





📦 Removal & Cleanup

docker rm <container>
docker rm -f <container>
docker rm $(docker ps -a -q)
docker container prune








===============================================================================================================================================================================================================

💾 VOLUMES

docker volume create myvolume
docker volume ls
docker volume inspect myvolume
docker volume rm myvolume
docker volume prune








===============================================================================================================================================================================================================

🌐 NETWORKING

docker network ls
docker network create mynetwork
docker network inspect mynetwork
docker network connect mynetwork <container>
docker network disconnect mynetwork <container>
docker network rm mynetwork
docker network prune








===============================================================================================================================================================================================================

🧹 SYSTEM CLEANUP

docker system df
docker system prune
docker system prune -a --volumes









===============================================================================================================================================================================================================

🧩 DOCKER COMPOSE (v2)

docker compose up
docker compose up -d
docker compose down
docker compose down -v
docker compose build
docker compose pull
docker compose push
docker compose ps
docker compose logs
docker compose logs -f
docker compose exec web bash
docker compose run --rm web bash
docker compose restart
docker compose stop
docker compose start
docker compose config









===============================================================================================================================================================================================================

🐝 DOCKER SWARM & SERVICES

docker swarm init
docker swarm join
docker swarm leave
docker swarm join-token worker
docker swarm join-token manager




docker node ls
docker node inspect <node>
docker node update --availability drain <node>




docker service create --name web -p 80:80 nginx
docker service ls
docker service ps web
docker service inspect web
docker service logs web
docker service scale web=5
docker service update --image nginx:latest web
docker service rm web








===============================================================================================================================================================================================================

📦 DOCKER STACKS

docker stack ls
docker stack deploy -c docker-compose.yml mystack
docker stack services mystack
docker stack ps mystack
docker stack rm mystack








===============================================================================================================================================================================================================

🏗️ DOCKER BUILDX (MULTI-ARCH)

docker buildx create --use
docker buildx ls
docker buildx inspect --bootstrap
docker buildx build --platform linux/amd64,linux/arm64 -t repo/app:latest .
docker buildx build --push -t repo/app:latest .












===============================================================================================================================================================================================================

🔐 SECURITY & REGISTRY

docker login
docker logout
docker trust key generate mykey
docker trust signer add mysigner repo/image
docker scan <image>







===============================================================================================================================================================================================================

🖥️ DOCKER MACHINE (LEGACY)

docker-machine ls
docker-machine create --driver virtualbox myvm1
docker-machine create -d hyperv --hyperv-virtual-switch "myswitch" myvm1
docker-machine ip myvm1
docker-machine env myvm1
docker-machine ssh myvm1
docker-machine stop myvm1
docker-machine start myvm1
docker-machine rm myvm1
docker-machine scp docker-compose.yml myvm1:~











===============================================================================================================================================================================================================

🧠 DEVOPS PRO TIPS

docker run --log-driver json-file --log-opt max-size=10m nginx
docker run --health-cmd="curl -f http://localhost || exit 1" nginx
docker run --security-opt=no-new-privileges nginx









