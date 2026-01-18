# 🛠️ Advanced Kubernetes Cheatsheet

This cheatsheet is a **complement** to the standard Kubectl cheatsheet and focuses on **advanced operations**, networking, security, Helm, CRDs, monitoring, and production-level troubleshooting.







---

## 🔐 RBAC & Security

| Command | Description | Example |
|---------|------------|--------|
| `kubectl create role <name> --verb=<verbs> --resource=<resources>` | Create a Role | `kubectl create role pod-reader --verb=get,list --resource=pods` |
| `kubectl create rolebinding <name> --role=<role> --user=<user>` | Bind Role to User | `kubectl create rolebinding read-pods --role=pod-reader --user=dev1` |
| `kubectl get roles` | List roles in namespace | `kubectl get roles` |
| `kubectl get rolebindings` | List rolebindings | `kubectl get rolebindings` |
| `kubectl create clusterrole <name> --verb=<verbs> --resource=<resources>` | Create ClusterRole | `kubectl create clusterrole node-reader --verb=get,list --resource=nodes` |
| `kubectl create clusterrolebinding <name> --clusterrole=<role> --user=<user>` | Bind ClusterRole to User | `kubectl create clusterrolebinding admin-binding --clusterrole=cluster-admin --user=dev1` |
| `kubectl auth can-i <verb> <resource> --namespace=<ns>` | Check permission | `kubectl auth can-i create deployments -n prod` |
| `kubectl get serviceaccount` | List service accounts | `kubectl get sa` |
| `kubectl create serviceaccount <name>` | Create service account | `kubectl create sa deployer` |







---

## 🌐 Networking & Ingress

| Command | Description | Example |
|---------|------------|--------|
| `kubectl get ingress` | List ingress resources | `kubectl get ingress` |
| `kubectl describe ingress <name>` | Inspect ingress | `kubectl describe ingress web-ingress` |
| `kubectl get networkpolicy` | List network policies | `kubectl get networkpolicy` |
| `kubectl describe networkpolicy <name>` | Inspect policy | `kubectl describe networkpolicy deny-all` |
| `kubectl port-forward svc/<service> <local-port>:<svc-port>` | Port forward service | `kubectl port-forward svc/nginx 8080:80` |
| `kubectl exec -it <pod> -- curl <url>` | Test networking from pod | `kubectl exec -it nginx-pod -- curl http://redis:6379` |







---

## 🏗️ Helm (Package Manager for Kubernetes)

| Command | Description | Example |
|---------|------------|--------|
| `helm repo add <name> <url>` | Add Helm chart repo | `helm repo add stable https://charts.helm.sh/stable` |
| `helm repo update` | Update repo | `helm repo update` |
| `helm search repo <chart>` | Search charts | `helm search repo nginx` |
| `helm install <release> <chart>` | Install chart | `helm install my-nginx stable/nginx` |
| `helm upgrade <release> <chart>` | Upgrade release | `helm upgrade my-nginx stable/nginx` |
| `helm uninstall <release>` | Remove release | `helm uninstall my-nginx` |
| `helm list` | List releases | `helm list -A` |
| `helm template <chart>` | Generate manifests without installing | `helm template my-nginx stable/nginx > nginx.yaml` |







---

## 🗂️ Custom Resources & CRDs

| Command | Description | Example |
|---------|------------|--------|
| `kubectl get crds` | List Custom Resource Definitions | `kubectl get crds` |
| `kubectl describe crd <name>` | Inspect CRD | `kubectl describe crd prometheuses.monitoring.coreos.com` |
| `kubectl get <custom-resource>` | List custom resources | `kubectl get prometheus -A` |
| `kubectl apply -f <crd.yaml>` | Apply CRD manifest | `kubectl apply -f prometheus-crd.yaml` |







---

## 📈 Monitoring & Metrics

| Command | Description | Example |
|---------|------------|--------|
| `kubectl top pods --namespace=<ns>` | CPU/Memory usage per pod | `kubectl top pods -n prod` |
| `kubectl top nodes` | CPU/Memory usage per node | `kubectl top nodes` |
| `kubectl get hpa` | List Horizontal Pod Autoscalers | `kubectl get hpa` |
| `kubectl describe hpa <name>` | Inspect HPA | `kubectl describe hpa nginx-hpa` |
| `kubectl logs <pod> -c <container>` | Logs from specific container | `kubectl logs nginx-1 -c web` |
| `kubectl logs <pod> --since=1h` | Logs from last 1 hour | `kubectl logs nginx-1 --since=1h` |
| `kubectl get events -A --sort-by=.metadata.creationTimestamp` | View recent events | `kubectl get events -A --sort-by=.metadata.creationTimestamp` |







---

## 🛠️ Cluster Maintenance & Troubleshooting

| Command | Description | Example |
|---------|------------|--------|
| `kubectl drain <node> --ignore-daemonsets --delete-emptydir-data` | Safely drain node | `kubectl drain worker-2 --ignore-daemonsets --delete-emptydir-data` |
| `kubectl cordon <node>` | Mark node unschedulable | `kubectl cordon worker-2` |
| `kubectl uncordon <node>` | Mark node schedulable | `kubectl uncordon worker-2` |
| `kubectl taint nodes <node> <key>=<value>:<effect>` | Add taint | `kubectl taint nodes worker-1 gpu=true:NoSchedule` |
| `kubectl describe node <node>` | Inspect node status | `kubectl describe node worker-1` |
| `kubectl get pod -n <ns> -o wide` | Check pod node assignment | `kubectl get pod -n prod -o wide` |
| `kubectl exec -it <pod> -- nslookup <service>` | DNS troubleshooting | `kubectl exec -it nginx-1 -- nslookup redis` |
| `kubectl exec -it <pod> -- ping <pod/service>` | Connectivity check | `kubectl exec -it nginx-1 -- ping redis` |
| `kubectl debug node/<node> -it --image=busybox` | Ephemeral debugging container | `kubectl debug node/worker-1 -it --image=busybox` |







---

## ⚡ CI/CD & Automation

| Command | Description | Example |
|---------|------------|--------|
| `kubectl apply -k <directory>` | Apply kustomize overlays | `kubectl apply -k ./overlays/prod` |
| `kubectl set image deployment/<deploy> <container>=<image>` | Update image in deployment | `kubectl set image deploy/nginx nginx=nginx:1.20.2` |
| `kubectl rollout status deployment/<name>` | Check rollout progress | `kubectl rollout status deploy/nginx` |
| `kubectl rollout undo deployment/<name>` | Rollback deployment | `kubectl rollout undo deploy/nginx` |
| `kubectl apply -f <gitops.yaml>` | Apply manifest via GitOps | `kubectl apply -f deploy.yaml` |







---

## 🔄 Advanced Flags & Tips

- `--dry-run=client` → Validate manifest without applying  
- `--force` → Force delete pods or resources  
- `--grace-period=<seconds>` → Graceful termination of pods  
- `--all` → Apply/delete all resources of a type  
- `--recursive` → Apply/delete resources in directories recursively  
- `--selector, -l` → Label filter for batch operations  


