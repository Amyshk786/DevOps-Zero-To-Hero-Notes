


Day-29 | Docker Interview Questions with Answers 
===================================================


1) What is Docker? - Docker is a containerization platform that allows us to package an application along with its dependencies, libraries, and runtime into a lightweight, portable unit called a container.
Containers can run consistently across environments like development, testing, and production, solving the “it works on my machine” problem.





2) How Containers are Different From Virtual Machines?


| Containers                    | Virtual Machines             |
| ----------------------------- | ---------------------------- |
| Share the host OS kernel      | Each VM has its own guest OS |
| Lightweight and fast to start | Heavy and slower to boot     |
| Use fewer resources           | Resource intensive           |
| Process-level isolation       | Hardware-level isolation     |
| Ideal for microservices       | Ideal for full OS isolation  |






3) What is Docker Life-Cycle?  - Docker container lifecycle refers to the different states a container goes through:
Created → Running → Paused → Stopped → Removed
A container is created from an image, runs the application process, can be paused or stopped, and eventually removed when no longer needed.






4) What are the Different Docker Components?  - Main components are:


- Docker Client – CLI used to send commands

- Docker Daemon (Engine) – Background service that builds and runs containers

- Docker Images – Read-only templates used to create containers

- Docker Containers – Running instances of images

- Docker Registry – Stores and distributes images (Docker Hub, ECR, etc.)

- Docker Volumes – Persistent storage

- Docker Networks – Enable container communication






5) What is the Difference Between Docker COPY and Docker ADD?


| COPY                                | ADD                                    |
| ----------------------------------- | -------------------------------------- |
| Simple file copy from host to image | Can copy files + extract tar archives  |
| No extra features                   | Can download files from URLs           |
| Preferred for predictable behavior  | Less predictable due to extra features |






6) What is the Difference Between CMD and ENTRYPOINT?


| CMD                        | ENTRYPOINT                                             |
| -------------------------- | ------------------------------------------------------ |
| Provides default arguments | Defines the main command                               |
| Can be overridden easily   | Harder to override                                     |
| Optional                   | Used when container must always run a specific command |






7) What are the Networking Types in Docker and what is the Default?  - Docker networking types:


1) Bridge – Default network for standalone containers

2) Host – Container shares host network

3) None – No networking

4) Overlay – Multi-host networking (Swarm)

5) Macvlan – Container gets IP from LAN


Note - Default network: Bridge







8) Can you Explain How to Isolate Networking Between the Containers?   - We can isolate containers by:


- Creating user-defined bridge networks

- Running specific containers in separate networks

- Only containers in the same network can communicate by default

- Avoid exposing ports unnecessarily

- This ensures service-level isolation between applications.








9) What is a Multi-Stage Build in Docker?


A multi-stage build uses multiple FROM statements in one Dockerfile.

Purpose:

- First stage: Build the application (includes build tools)

- Final stage: Copy only the compiled artifacts into a minimal image

- This reduces image size and improves security by removing unnecessary tools.








10) What are Distro-Less Images in Docker?


Distroless images contain only:
- The application
- Its runtime dependencies


They do NOT include:
- Package managers
- Shell
- Debugging tools


Benefits:
- Smaller image size
- Reduced attack surface
- Better security






11) Real-Time Challenges with Docker 


Some common real-world challenges:

- Managing persistent data for stateful apps

- Networking complexity in microservices

- Container security and vulnerabilities

- Image size optimization

- Logging and monitoring containers

- Orchestrating containers at scale (handled by Kubernetes)







12) What Steps Would you take to Secure Containers?


Key container security practices:

- Use minimal base images (Alpine, distroless)

- Regularly scan images for vulnerabilities

- Avoid running containers as root user

- Use read-only filesystems where possible

- Limit container capabilities (drop Linux capabilities)

- Use network segmentation

- Keep Docker and host OS updated

- Store secrets securely (not in images)




