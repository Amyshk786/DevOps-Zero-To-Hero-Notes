


# 🌍 Terraform Command Cheat Sheet (Infrastructure as Code)

Terraform is used to provision and manage cloud infrastructure.

---

# ⚙️ INITIALIZATION

| Command | Purpose |
|--------|---------|
| `terraform init` | Initialize working directory & download providers |
| `terraform validate` | Validate configuration syntax |
| `terraform fmt` | Format Terraform files |




---

# 📋 PLANNING & APPLYING

| Command | Purpose |
|--------|---------|
| `terraform plan` | Preview infrastructure changes |
| `terraform apply` | Apply infrastructure changes |
| `terraform apply -auto-approve` | Apply without prompt |
| `terraform destroy` | Remove all managed infrastructure |

---

# 📂 STATE MANAGEMENT

| Command | Purpose |
|--------|---------|
| `terraform show` | Show current state |
| `terraform state list` | List resources in state |
| `terraform state show <resource>` | Show resource details |
| `terraform state rm <resource>` | Remove resource from state |
| `terraform refresh` | Sync state with real infra |




---

# 📦 VARIABLES & OUTPUTS

| Command | Purpose |
|--------|---------|
| `terraform plan -var="region=us-east-1"` | Pass variable |
| `terraform output` | Show output values |
| `terraform output ip` | Show specific output |




---

# 🧩 WORKSPACES

| Command | Purpose |
|--------|---------|
| `terraform workspace list` | List environments |
| `terraform workspace new dev` | Create workspace |
| `terraform workspace select dev` | Switch workspace |




---

# ☁️ MODULES

| Concept | Purpose |
|---------|---------|
| `module "vpc"` | Reuse infrastructure code |
| `source = "./modules/vpc"` | Local module |
| `source = "terraform-aws-modules/vpc/aws"` | Remote module |




---

# 🧠 DEVOPS PRO TIPS

| Tip | Purpose |
|-----|---------|
| Remote state (S3, GCS, etc.) | Team collaboration |
| State locking (DynamoDB) | Prevent conflicts |
| Use `terraform plan` in CI | Safe automation |
| Separate environments with workspaces | Dev/Staging/Prod isolation |
