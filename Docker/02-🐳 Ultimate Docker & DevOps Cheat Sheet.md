


# 🐳 Ultimate Docker & DevOps Command Cheat Sheet 

A practical reference explaining **what each Docker command is used for** in real DevOps workflows.

---

# 📦 DOCKER BASICS

| Command | Purpose |
|--------|---------|
| `docker init` | Generate starter Docker files for a project |
| `docker version` | Show installed Docker client & server versions |
| `docker info` | Display system-wide Docker details |
| `docker system info` | Detailed info about storage, drivers, plugins |
| `docker context ls` | List Docker environments (local, remote, cloud) |
| `docker context use <context>` | Switch between Docker environments |

---

# 🖼️ IMAGES

| Command | Purpose |
|--------|---------|
| `docker build -t name .` | Build an image from a Dockerfile |
| `docker build --no-cache -t name .` | Build without using cached layers |
| `docker build -f Dockerfile.dev -t name .` | Use a custom Dockerfile |
| `docker images` / `docker image ls` | List local images |
| `docker image inspect <image>` | View detailed image metadata |
| `docker history <image>` | Show how the image was built layer by layer |
| `docker pull <image>` | Download image from a registry |
| `docker push <image>` | Upload image to a registry |
| `docker search <image>` | Search Docker Hub |
| `docker tag <image> repo:tag` | Tag image for pushing to registry |
| `docker rmi <image>` | Remove an image |
| `docker image prune -a` | Delete all unused images |
| `docker save -o file.tar <image>` | Export image to a file |
| `docker load -i file.tar` | Import image from a file |

---

# 📦 CONTAINERS

## ▶️ Running Containers

| Command | Purpose |
|--------|---------|
| `docker run image` | Create and start a container |
| `docker run -d image` | Run container in background |
| `docker run -it image bash` | Run with interactive shell |
| `docker run -p 4000:80 image` | Map host port to container port |
| `docker run --name mycontainer image` | Assign a custom name |
| `docker run --env-file .env image` | Load environment variables |
| `docker run -v volume:/data image` | Attach a volume |
| `docker run --network net image` | Attach to custom network |
| `docker run --restart unless-stopped image` | Auto-restart policy |
| `docker run --cpus="1.5" --memory="1g" image` | Limit container resources |
| `docker run --read-only image` | Make container filesystem read-only |
| `docker run --cap-drop ALL image` | Drop Linux capabilities for security |

---

## ⚙️ Managing Containers

| Command | Purpose |
|--------|---------|
| `docker ps` | Show running containers |
| `docker ps -a` | Show all containers |
| `docker start <container>` | Start stopped container |
| `docker stop <container>` | Gracefully stop container |
| `docker restart <container>` | Restart container |
| `docker kill <container>` | Force stop container |
| `docker pause <container>` | Freeze container processes |
| `docker unpause <container>` | Resume paused container |
| `docker rename old new` | Rename a container |
| `docker update --memory 500m <container>` | Change resource limits |

---

## 🖥️ Access & Logs

| Command | Purpose |
|--------|---------|
| `docker exec -it <container> bash` | Open shell inside container |
| `docker attach <container>` | Attach terminal to running container |
| `docker logs <container>` | View container logs |
| `docker logs -f <container>` | Follow logs in real time |
| `docker logs --tail 100 <container>` | Show last 100 log lines |
| `docker stats` | Live CPU/memory usage |
| `docker top <container>` | Show running processes |

---

## 🔍 Inspection & Debugging

| Command | Purpose |
|--------|---------|
| `docker inspect <container>` | Detailed container metadata |
| `docker port <container>` | Show port mappings |
| `docker diff <container>` | File changes inside container |
| `docker events` | Real-time Docker activity stream |

---

## 📂 Copying Files

| Command | Purpose |
|--------|---------|
| `docker cp file.txt container:/file.txt` | Copy file into container |
| `docker cp container:/file.txt .` | Copy file from container |

---

## 🗑️ Removal & Cleanup

| Command | Purpose |
|--------|---------|
| `docker rm <container>` | Remove stopped container |
| `docker rm -f <container>` | Force remove running container |
| `docker container prune` | Remove all stopped containers |

---

# 💾 VOLUMES

| Command | Purpose |
|--------|---------|
| `docker volume create name` | Create volume |
| `docker volume ls` | List volumes |
| `docker volume inspect name` | Show volume details |
| `docker volume rm name` | Remove volume |
| `docker volume prune` | Remove unused volumes |

---

# 🌐 NETWORKING

| Command | Purpose |
|--------|---------|
| `docker network ls` | List networks |
| `docker network create name` | Create network |
| `docker network inspect name` | View network details |
| `docker network connect net container` | Attach container to network |
| `docker network disconnect net container` | Detach container |
| `docker network rm name` | Remove network |
| `docker network prune` | Remove unused networks |

---

# 🧹 SYSTEM CLEANUP

| Command | Purpose |
|--------|---------|
| `docker system df` | Show disk usage |
| `docker system prune` | Remove unused containers/images/networks |
| `docker system prune -a --volumes` | Aggressive cleanup |

---

# 🧩 DOCKER COMPOSE (v2)

| Command | Purpose |
|--------|---------|
| `docker compose up` | Create & start services |
| `docker compose up -d` | Run in background |
| `docker compose down` | Stop and remove services |
| `docker compose down -v` | Remove volumes too |
| `docker compose build` | Build service images |
| `docker compose pull` | Pull service images |
| `docker compose push` | Push service images |
| `docker compose ps` | List running services |
| `docker compose logs` | View logs |
| `docker compose logs -f` | Follow logs |
| `docker compose exec web bash` | Exec into service container |
| `docker compose run --rm web bash` | One-off command |
| `docker compose restart` | Restart services |
| `docker compose config` | Validate compose file |

---

# 🐝 DOCKER SWARM & SERVICES

| Command | Purpose |
|--------|---------|
| `docker swarm init` | Initialize swarm cluster |
| `docker swarm join` | Join a swarm |
| `docker node ls` | List nodes |
| `docker node update --availability drain node` | Drain node for maintenance |
| `docker service create` | Create a service |
| `docker service ls` | List services |
| `docker service ps name` | List service tasks |
| `docker service logs name` | View service logs |
| `docker service scale name=5` | Scale service replicas |
| `docker service update --image image name` | Rolling update |
| `docker service rm name` | Remove service |

---

# 📦 DOCKER STACKS

| Command | Purpose |
|--------|---------|
| `docker stack deploy -c file stack` | Deploy multi-service app |
| `docker stack ls` | List stacks |
| `docker stack services stack` | List services in stack |
| `docker stack ps stack` | List containers in stack |
| `docker stack rm stack` | Remove stack |

---

# 🏗️ DOCKER BUILDX

| Command | Purpose |
|--------|---------|
| `docker buildx create --use` | Create builder for multi-arch builds |
| `docker buildx build --platform linux/amd64,linux/arm64 .` | Build for multiple architectures |
| `docker buildx build --push` | Build and push image |

---

# 🔐 SECURITY & REGISTRY

| Command | Purpose |
|--------|---------|
| `docker login` | Authenticate to registry |
| `docker logout` | Log out |
| `docker trust key generate name` | Create signing key |
| `docker scan image` | Scan image for vulnerabilities |

---

# 🖥️ DOCKER MACHINE (LEGACY)

| Command | Purpose |
|--------|---------|
| `docker-machine create` | Create Docker VM |
| `docker-machine ls` | List machines |
| `docker-machine ssh name` | SSH into machine |
| `docker-machine stop name` | Stop VM |
| `docker-machine rm name` | Delete VM |

---

# 🧠 DEVOPS PRO TIPS

| Command | Purpose |
|--------|---------|
| `docker run --log-opt max-size=10m` | Limit log file size |
| `docker run --health-cmd="curl -f http://localhost || exit 1"` | Add health check |
| `docker run --security-opt=no-new-privileges` | Prevent privilege escalation |

---

 Covers real-world DevOps use: building, deploying, scaling, debugging, securing, and cleaning Docker environments.
