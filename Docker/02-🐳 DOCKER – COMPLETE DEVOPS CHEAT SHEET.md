


🐳 DOCKER – COMPLETE DEVOPS CHEAT SHEET


🔹 DOCKER BASICS
docker init                                  # Create Docker starter files
docker version                               # Show Docker version
docker info                                  # Show system-wide info
docker context ls                            # List Docker contexts
docker context use <name>                    # Switch context






🔹 IMAGES
docker build -t friendlyname .               # Build image from Dockerfile
docker build --no-cache -t app:latest .      # Build without cache
docker build -f Dockerfile.dev -t app:dev .  # Use custom Dockerfile

docker images                                # List images
docker image ls                              # Same as above
docker image inspect <image>                 # Inspect image details
docker history <image>                       # Show image layers history

docker pull <image>                          # Download image
docker push <image>                          # Upload image
docker search <image>                        # Search Docker Hub

docker tag <image> repo/name:tag             # Tag image
docker rmi <image>                           # Remove image
docker image prune -a                        # Remove unused images

docker save -o image.tar <image>             # Export image to file
docker load -i image.tar                     # Import image from file






🔹 CONTAINERS
docker run friendlyname                      # Run container
docker run -d -p 4000:80 friendlyname        # Detached + port mapping
docker run -it friendlyname bash             # Interactive shell
docker run --name mycontainer friendlyname   # Name a container
docker run --restart unless-stopped nginx    # Auto-restart policy
docker run --env-file .env friendlyname      # Load env vars
docker run -v myvolume:/data friendlyname    # Attach volume
docker run --network mynetwork friendlyname  # Attach network
docker run --cpus="1.5" --memory="1g" nginx  # Limit resources

docker ps                                    # Running containers
docker ps -a                                 # All containers

docker start <container>
docker stop <container>
docker restart <container>
docker kill <container>

docker exec -it <container> bash             # Enter running container
docker attach <container>                    # Attach STDIN/STDOUT

docker logs <container>                      # View logs
docker logs -f <container>                   # Follow logs
docker logs --tail 100 <container>           # Last 100 lines

docker top <container>                       # Running processes
docker stats                                 # Live resource usage

docker inspect <container>                   # Detailed info
docker port <container>                      # Port mappings
docker diff <container>                      # File changes

docker cp file.txt <container>:/file.txt     # Copy to container
docker cp <container>:/file.txt .            # Copy from container

docker rename oldname newname
docker update --memory 500m <container>      # Update limits
docker pause <container>
docker unpause <container>

docker rm <container>
docker rm -f <container>
docker container prune                       # Remove stopped containers






🔹 VOLUMES
docker volume create myvolume
docker volume ls
docker volume inspect myvolume
docker volume rm myvolume
docker volume prune






🔹 NETWORKING
docker network ls
docker network create mynetwork
docker network inspect mynetwork
docker network connect mynetwork <container>
docker network disconnect mynetwork <container>
docker network rm mynetwork
docker network prune






🔹 SYSTEM CLEANUP & DEBUG
docker system df                             # Disk usage
docker system prune                          # Remove unused data
docker system prune -a --volumes             # Aggressive cleanup

docker events                                # Real-time Docker events
docker system info                           # Detailed system info






🧩 DOCKER COMPOSE (MODERN v2)
Old docker-compose → New standard: docker compose
docker compose up
docker compose up -d
docker compose down
docker compose down -v                       # Remove volumes
docker compose build
docker compose pull
docker compose push
docker compose ps
docker compose logs
docker compose logs -f
docker compose exec web bash
docker compose run --rm web bash
docker compose config                        # Validate file
docker compose restart
docker compose stop
docker compose start






🐝 DOCKER SWARM (SERVICES)
docker swarm init
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






📦 DOCKER STACKS
docker stack deploy -c docker-compose.yml mystack
docker stack ls
docker stack services mystack
docker stack ps mystack
docker stack rm mystack






🏗️ BUILDX (MULTI-ARCH BUILDS)
docker buildx create --use
docker buildx ls
docker buildx inspect --bootstrap
docker buildx build --platform linux/amd64,linux/arm64 -t repo/app:latest .
docker buildx build --push -t repo/app:latest .






🔐 SECURITY & REGISTRY
docker login
docker logout
docker trust key generate mykey
docker trust signer add mysigner repo/image
docker scan <image>                          # Vulnerability scan (if enabled)






🖥️ DOCKER MACHINE (LEGACY BUT STILL ASKED IN INTERVIEWS)
docker-machine ls
docker-machine create --driver virtualbox myvm1
docker-machine ip myvm1
docker-machine ssh myvm1
docker-machine stop myvm1
docker-machine start myvm1
docker-machine rm myvm1






🧠 PRO DEVOPS TIPS (BONUS)
docker run --log-driver json-file --log-opt max-size=10m nginx   # Log rotation
docker run --read-only nginx                                      # Read-only FS
docker run --cap-drop ALL nginx                                   # Drop Linux caps
docker run --health-cmd="curl -f http://localhost || exit 1" nginx






