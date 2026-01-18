


# 📘 Kubectl Command Cheatsheet

Kubectl is the command-line interface for interacting with Kubernetes clusters.  
It allows you to deploy applications, inspect and manage cluster resources, and view logs.

This cheatsheet provides a **comprehensive reference of commonly used kubectl commands**, organized by operation type, with **descriptions and practical examples**.

---

## 🧭 Cluster Management Commands

| Command | Description | Example |
|------   |------------|--------|
| `kubectl cluster-info` | Display cluster info | `kubectl cluster-info` |
| `kubectl version` | Show kubectl & cluster version | `kubectl version` |
| `kubectl config view` | Show kubeconfig settings | `kubectl config view` |
| `kubectl config current-context` | Show current context | `kubectl config current-context` |
| `kubectl config use-context <context>` | Switch context | `kubectl config use-context minikube` |
| `kubectl config set-context` | Set context parameter | `kubectl config set-context --current --namespace=myapp` |
| `kubectl api-resources` | List API resources | `kubectl api-resources` |






---

## 📦 Namespace Operations

| Command | Description | Example |
|------|------------|--------|
| `kubectl get ns` | List namespaces | `kubectl get ns` |
| `kubectl create ns <name>` | Create namespace | `kubectl create ns app-dev` |
| `kubectl delete ns <name>` | Delete namespace | `kubectl delete ns app-dev` |
| `kubectl config set-context --current --namespace=<ns>` | Set default namespace | `kubectl config set-context --current --namespace=app-dev` |






---

## 🧱 Pod Operations

| Command | Description | Example |
|------|------------|--------|
| `kubectl get pods` | List pods | `kubectl get pods` |
| `kubectl get pods -A` | Pods in all namespaces | `kubectl get pods -A` |
| `kubectl get pods -o wide` | Detailed pod view | `kubectl get pods -o wide` |
| `kubectl describe pod <pod>` | Pod details | `kubectl describe pod nginx-pod` |
| `kubectl run <name> --image=<image>` | Run pod | `kubectl run nginx --image=nginx` |
| `kubectl delete pod <pod>` | Delete pod | `kubectl delete pod nginx-pod` |
| `kubectl logs <pod>` | Pod logs | `kubectl logs nginx-pod` |
| `kubectl logs -f <pod>` | Stream logs | `kubectl logs -f nginx-pod` |
| `kubectl logs <pod> -c <container>` | Container logs | `kubectl logs webapp -c auth-service` |
| `kubectl exec -it <pod> -- <cmd>` | Exec into pod | `kubectl exec -it nginx-pod -- bash` |
| `kubectl port-forward <pod> <l:p>` | Port forward | `kubectl port-forward nginx-pod 8080:80` |






---

## 🚀 Deployment Operations

| Command | Description | Example |
|------|------------|--------|
| `kubectl get deploy` | List deployments | `kubectl get deploy` |
| `kubectl describe deploy <name>` | Deployment details | `kubectl describe deploy nginx` |
| `kubectl create deploy <name> --image=<image>` | Create deployment | `kubectl create deploy nginx --image=nginx` |
| `kubectl scale deploy <name> --replicas=<n>` | Scale deployment | `kubectl scale deploy nginx --replicas=5` |
| `kubectl rollout status deploy <name>` | Rollout status | `kubectl rollout status deploy nginx` |
| `kubectl rollout history deploy <name>` | Rollout history | `kubectl rollout history deploy nginx` |
| `kubectl rollout undo deploy <name>` | Rollback | `kubectl rollout undo deploy nginx` |
| `kubectl rollout restart deploy <name>` | Restart deployment | `kubectl rollout restart deploy nginx` |
| `kubectl set image deploy/<name>` | Update image | `kubectl set image deploy/nginx nginx=nginx:latest` |
| `kubectl delete deploy <name>` | Delete deployment | `kubectl delete deploy nginx` |






---

## 🌐 Service Operations

| Command | Description | Example |
|------|------------|--------|
| `kubectl get svc` | List services | `kubectl get svc` |
| `kubectl describe svc <name>` | Service details | `kubectl describe svc nginx-service` |
| `kubectl expose deploy <name>` | Create service | `kubectl expose deploy nginx --port=80 --type=LoadBalancer` |
| `kubectl delete svc <name>` | Delete service | `kubectl delete svc nginx-service` |






---

## 🔐 ConfigMap & Secret Operations

| Command | Description | Example |
|------|------------|--------|
| `kubectl get cm` | List configmaps | `kubectl get cm` |
| `kubectl get secrets` | List secrets | `kubectl get secrets` |
| `kubectl create cm <name> --from-file=<path>` | ConfigMap from file | `kubectl create cm app-config --from-file=config.properties` |
| `kubectl create cm <name> --from-literal=k=v` | ConfigMap literal | `kubectl create cm app-config --from-literal=env=prod` |
| `kubectl create secret generic <name>` | Create secret | `kubectl create secret generic db-creds --from-literal=password=s3cr3t` |
| `kubectl describe cm <name>` | ConfigMap details | `kubectl describe cm app-config` |
| `kubectl describe secret <name>` | Secret details | `kubectl describe secret db-creds` |






---

## 💾 Persistent Volumes

| Command | Description | Example |
|------|------------|--------|
| `kubectl get pv` | List PVs | `kubectl get pv` |
| `kubectl get pvc` | List PVCs | `kubectl get pvc` |
| `kubectl describe pvc <name>` | PVC details | `kubectl describe pvc mysql-pvc` |
| `kubectl delete pvc <name>` | Delete PVC | `kubectl delete pvc mysql-pvc` |






---

## 🖥️ Node Operations

| Command | Description | Example |
|------|------------|--------|
| `kubectl get nodes` | List nodes | `kubectl get nodes` |
| `kubectl describe node <node>` | Node details | `kubectl describe node worker-1` |
| `kubectl cordon <node>` | Mark unschedulable | `kubectl cordon worker-1` |
| `kubectl uncordon <node>` | Mark schedulable | `kubectl uncordon worker-1` |
| `kubectl drain <node>` | Drain node | `kubectl drain worker-1 --ignore-daemonsets` |
| `kubectl taint nodes <node>` | Add taint | `kubectl taint nodes worker-1 gpu=true:NoSchedule` |






---

## 📊 Resource Management

| Command | Description | Example |
|------|------------|--------|
| `kubectl top nodes` | Node resource usage | `kubectl top nodes` |
| `kubectl top pods` | Pod resource usage | `kubectl top pods` |
| `kubectl get events` | Cluster events | `kubectl get events` |
| `kubectl get all` | All resources | `kubectl get all` |






---

## 🧾 YAML Generation

| Command | Description | Example |
|------|------------|--------|
| `kubectl create deploy --dry-run=client -o yaml` | Deployment YAML | `kubectl create deploy nginx --image=nginx --dry-run=client -o yaml > deploy.yaml` |
| `kubectl run --dry-run=client -o yaml` | Pod YAML | `kubectl run nginx --image=nginx --dry-run=client -o yaml > pod.yaml` |
| `kubectl expose --dry-run=client -o yaml` | Service YAML | `kubectl expose deploy nginx --port=80 --dry-run=client -o yaml > svc.yaml` |






---

## 🔄 Apply & Diff

| Command | Description | Example |
|------|------------|--------|
| `kubectl apply -f <file>` | Apply config | `kubectl apply -f deploy.yaml` |
| `kubectl apply -f <dir>` | Apply directory | `kubectl apply -f ./configs` |
| `kubectl diff -f <file>` | Show diff | `kubectl diff -f deploy.yaml` |
| `kubectl delete -f <file>` | Delete from file | `kubectl delete -f deploy.yaml` |






---

## 🔁 Context Switching

| Command | Description | Example |
|------|------------|--------|
| `kubectl config get-contexts` | List contexts | `kubectl config get-contexts` |
| `kubectl config current-context` | Current context | `kubectl config current-context` |
| `kubectl config use-context <context>` | Switch context | `kubectl config use-context prod-cluster` |
| `kubectl config rename-context` | Rename context | `kubectl config rename-context old new` |






---

## 🏷️ Common Flags

| Flag | Description | Example |
|----|------------|--------|
| `-n, --namespace` | Namespace | `kubectl get pods -n kube-system` |
| `-A` | All namespaces | `kubectl get pods -A` |
| `-o` | Output format | `kubectl get pod nginx -o yaml` |
| `-w` | Watch | `kubectl get pods -w` |
| `-l` | Label selector | `kubectl get pods -l app=nginx` |
| `--field-selector` | Field filter | `kubectl get pods --field-selector status.phase=Running` |
| `--sort-by` | Sort output | `kubectl get pods --sort-by=.metadata.creationTimestamp` |






---

## 🧠 Advanced Operations

| Command | Description | Example |
|------|------------|--------|
| `kubectl auth can-i` | Check permissions | `kubectl auth can-i create deployments` |
| `kubectl explain <resource>` | Resource docs | `kubectl explain pods.spec.containers` |
| `kubectl get cs` | Component status | `kubectl get cs` |
| `kubectl wait` | Wait for condition | `kubectl wait --for=condition=Ready pod/nginx` |
| `kubectl patch` | Patch resource | `kubectl patch deploy nginx -p '{"spec":{"replicas":3}}'` |
| `kubectl kustomize <dir>` | Render kustomize | `kubectl kustomize ./overlay/dev` |



