


# ⛵ Helm Command Cheat Sheet (Kubernetes Package Manager)

Helm helps you define, install, and manage Kubernetes applications using charts.

---

# 📦 REPOSITORIES

| Command | Purpose |
|--------|---------|
| `helm repo add bitnami https://charts.bitnami.com/bitnami` | Add a chart repository |
| `helm repo list` | List added repositories |
| `helm repo update` | Update repo index (fetch latest charts) |
| `helm search repo nginx` | Search charts in added repos |




---

# 📥 INSTALLING CHARTS

| Command | Purpose |
|--------|---------|
| `helm install myrelease bitnami/nginx` | Install a chart |
| `helm install myrelease ./chart` | Install from local chart directory |
| `helm install myrelease chart --values values.yaml` | Install with custom values |
| `helm install myrelease chart --set image.tag=1.2` | Override values from CLI |




---

# 🔄 UPGRADES & ROLLBACKS

| Command | Purpose |
|--------|---------|
| `helm upgrade myrelease bitnami/nginx` | Upgrade a release |
| `helm upgrade myrelease chart -f values.yaml` | Upgrade with new values |
| `helm rollback myrelease 1` | Roll back to revision 1 |
| `helm history myrelease` | Show release history |




---

# 🗑️ UNINSTALL

| Command | Purpose |
|--------|---------|
| `helm uninstall myrelease` | Remove a deployed release |




---

# 🔍 RELEASE MANAGEMENT

| Command | Purpose |
|--------|---------|
| `helm list` | List releases in current namespace |
| `helm list -A` | List releases in all namespaces |
| `helm status myrelease` | Show release status |
| `helm get values myrelease` | Show custom values used |
| `helm get manifest myrelease` | Show generated Kubernetes YAML |




---

# 🛠️ CHART DEVELOPMENT

| Command | Purpose |
|--------|---------|
| `helm create mychart` | Create new chart scaffold |
| `helm lint mychart` | Validate chart syntax |
| `helm template mychart` | Render chart locally without installing |
| `helm package mychart` | Package chart into `.tgz` |




---

# 🧠 DEVOPS PRO TIPS

| Command | Purpose |
|--------|---------|
| `helm upgrade --install myrelease chart` | Install if missing, upgrade if exists |
| `helm diff upgrade myrelease chart` | Preview changes before upgrade (plugin) |
