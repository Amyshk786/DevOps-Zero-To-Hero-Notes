


# 🔁 CI/CD DevOps Cheat Sheet (Concepts + Practical Commands)

Covers common pipeline tasks across GitHub Actions, GitLab CI, Jenkins, etc.

---

# 🧱 GIT BASICS (PIPELINE TRIGGERS)

| Command | Purpose |
|--------|---------|
| `git clone <repo>` | Download repository |
| `git checkout -b feature-x` | Create feature branch |
| `git add .` | Stage changes |
| `git commit -m "msg"` | Commit changes |
| `git push origin branch` | Push branch (triggers pipeline) |
| `git pull --rebase` | Sync with remote cleanly |




---

# 🏗️ BUILD STAGE

| Tool | Command | Purpose |
|------|---------|---------|
| Docker | `docker build -t app:latest .` | Build container image |
| Node | `npm ci` | Clean dependency install |
| Maven | `mvn clean package` | Build Java app |
| Python | `pip install -r requirements.txt` | Install dependencies |




---

# 🧪 TEST STAGE

| Tool | Command | Purpose |
|------|---------|---------|
| Node | `npm test` | Run unit tests |
| Python | `pytest` | Run Python tests |
| Java | `mvn test` | Run JUnit tests |
| Docker | `docker run app:test` | Test inside container |




---

# 🔍 CODE QUALITY & SECURITY

| Tool | Command | Purpose |
|------|---------|---------|
| SonarQube | `sonar-scanner` | Code quality scan |
| Trivy | `trivy image app:latest` | Scan image vulnerabilities |
| npm | `npm audit` | Check JS dependencies |
| Snyk | `snyk test` | Security scan |




---

# 📦 ARTIFACT & IMAGE PUSH

| Command | Purpose |
|--------|---------|
| `docker tag app repo/app:1.0` | Tag image |
| `docker push repo/app:1.0` | Push image to registry |
| `helm package chart` | Package Helm chart |
| `helm push chart.tgz repo` | Push chart to registry |




---

# 🚀 DEPLOYMENT

| Platform | Command | Purpose |
|----------|---------|---------|
| Kubernetes | `kubectl apply -f k8s.yaml` | Deploy manifests |
| Helm | `helm upgrade --install app chart` | Deploy via Helm |
| Docker | `docker compose up -d` | Deploy containers |
| SSH | `scp file user@server:/app` | Copy build artifacts |




---

# 🔄 PIPELINE BEST PRACTICES

| Practice | Purpose |
|----------|---------|
| Use caching | Speed up builds |
| Use environment variables | Secure secrets |
| Use artifact storage | Share build outputs |
| Separate stages (build/test/deploy) | Clear pipeline structure |
