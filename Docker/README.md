Kubectl Command Cheatsheet
Kubectl is the command-line interface for interacting with Kubernetes clusters. It allows you to deploy applications, inspect and manage cluster resources, and view logs. This cheatsheet provides a comprehensive reference of commonly used kubectl commands, organized by operation type.

Whether you're new to Kubernetes or an experienced administrator, this guide will help you quickly find the right command for your task. Commands are presented with their descriptions and practical examples to make your Kubernetes workflow more efficient.

Cluster Management Commands
Command	Description	Example
kubectl cluster-info	Display cluster info	kubectl cluster-info
kubectl version	Show kubectl and cluster version	kubectl version
kubectl config view	Show kubeconfig settings	kubectl config view
kubectl config current-context	Display current context	kubectl config current-context
kubectl config use-context <context>	Switch to another context	kubectl config use-context minikube
kubectl config set-context	Set a context parameter	kubectl config set-context --current --namespace=myapp
kubectl api-resources	List supported API resources	kubectl api-resources
Namespace Operations
Command	Description	Example
kubectl get namespaces	List all namespaces	kubectl get ns
kubectl create namespace	Create a namespace	kubectl create ns app-dev
kubectl delete namespace	Delete a namespace	kubectl delete ns app-dev
kubectl config set-context --current --namespace=<ns>	Set default namespace	kubectl config set-context --current --namespace=app-dev








Pod Operations
Command	Description	Example
kubectl get pods	List all pods in current namespace	kubectl get pods
kubectl get pods --all-namespaces	List pods in all namespaces	kubectl get pods -A
kubectl get pods -o wide	List pods with more details	kubectl get pods -o wide
kubectl describe pod <pod-name>	Show detailed pod information	kubectl describe pod nginx-pod
kubectl run <name> --image=<image>	Create and run a pod	kubectl run nginx --image=nginx
kubectl delete pod <pod-name>	Delete a pod	kubectl delete pod nginx-pod
kubectl logs <pod-name>	Get pod logs	kubectl logs nginx-pod
kubectl logs -f <pod-name>	Stream pod logs	kubectl logs -f nginx-pod
kubectl logs <pod-name> -c <container>	Get container logs from multi-container pod	kubectl logs webapp -c auth-service
kubectl exec -it <pod-name> -- <command>	Execute command in pod	kubectl exec -it nginx-pod -- /bin/bash
kubectl port-forward <pod-name> <local-port>:<pod-port>	Forward pod port to local	kubectl port-forward nginx-pod 8080:80






Deployment Operations
Command	Description	Example
kubectl get deployments	List all deployments	kubectl get deploy
kubectl describe deployment <name>	Show deployment details	kubectl describe deploy nginx-deploy
kubectl create deployment <name> --image=<image>	Create a deployment	kubectl create deploy nginx --image=nginx
kubectl scale deployment <name> --replicas=<count>	Scale a deployment	kubectl scale deploy nginx --replicas=5
kubectl rollout status deployment <name>	Check rollout status	kubectl rollout status deploy nginx
kubectl rollout history deployment <name>	View rollout history	kubectl rollout history deploy nginx
kubectl rollout undo deployment <name>	Rollback deployment	kubectl rollout undo deploy nginx
kubectl rollout restart deployment <name>	Restart deployment (for image refresh)	kubectl rollout restart deploy nginx
kubectl set image deployment/<name> <container>=<image>	Update container image	kubectl set image deployment/nginx nginx=nginx:latest
kubectl delete deployment <name>	Delete a deployment	kubectl delete deploy nginx




Service Operations
Command	Description	Example
kubectl get services	List all services	kubectl get svc
kubectl describe service <name>	Show service details	kubectl describe svc nginx-service
kubectl expose deployment <name> --port=<port> --type=<type>	Create a service for deployment	kubectl expose deploy nginx --port=80 --type=LoadBalancer
kubectl delete service <name>	Delete a service	kubectl delete svc nginx-service





ConfigMap and Secret Operations
Command	Description	Example
kubectl get configmaps	List all configmaps	kubectl get cm
kubectl get secrets	List all secrets	kubectl get secrets
kubectl create configmap <name> --from-file=<path>	Create configmap from file	kubectl create cm app-config --from-file=config.properties
kubectl create configmap <name> --from-literal=<key>=<value>	Create configmap from literal	kubectl create cm app-config --from-literal=api.url=https://api.example.com
kubectl create secret generic <name> --from-literal=<key>=<value>	Create secret from literal	kubectl create secret generic db-creds --from-literal=password=s3cr3t
kubectl describe configmap <name>	Show configmap details	kubectl describe cm app-config
kubectl describe secret <name>	Show secret details	kubectl describe secret db-creds





Persistent Volume Operations
Command	Description	Example
kubectl get persistentvolumes	List persistent volumes	kubectl get pv
kubectl get persistentvolumeclaims	List persistent volume claims	kubectl get pvc
kubectl describe persistentvolumeclaim <name>	Show PVC details	kubectl describe pvc mysql-pvc
kubectl delete persistentvolumeclaim <name>	Delete a PVC	kubectl delete pvc mysql-pvc





Node Operations
Command	Description	Example
kubectl get nodes	List all nodes	kubectl get nodes
kubectl describe node <node-name>	Show node details	kubectl describe node worker-1
kubectl cordon <node-name>	Mark node as unschedulable	kubectl cordon worker-1
kubectl uncordon <node-name>	Mark node as schedulable	kubectl uncordon worker-1
kubectl drain <node-name>	Drain node in preparation for maintenance	kubectl drain worker-1 --ignore-daemonsets
kubectl taint nodes <node-name> <key>=<value>:<effect>	Add a taint to node	kubectl taint nodes worker-1 gpu=true:NoSchedule





Resource Management
Command	Description	Example
kubectl top nodes	Show CPU/Memory usage for nodes	kubectl top nodes
kubectl top pods	Show CPU/Memory usage for pods	kubectl top pods
kubectl get events	Show events in the cluster	kubectl get events
kubectl get all	Show all resources	kubectl get all




YAML Generation
Command	Description	Example
kubectl create deployment <name> --image=<image> --dry-run=client -o yaml	Generate deployment YAML	kubectl create deploy nginx --image=nginx --dry-run=client -o yaml > deploy.yaml
kubectl run <name> --image=<image> --dry-run=client -o yaml	Generate pod YAML	kubectl run nginx --image=nginx --dry-run=client -o yaml > pod.yaml
kubectl expose deployment <name> --port=<port> --dry-run=client -o yaml	Generate service YAML	kubectl expose deploy nginx --port=80 --dry-run=client -o yaml > svc.yaml





Apply and Diff
Command	Description	Example
kubectl apply -f <file.yaml>	Create/update resource from file	kubectl apply -f deploy.yaml
kubectl apply -f <directory>	Create/update from all files in directory	kubectl apply -f ./configs
kubectl diff -f <file.yaml>	Show difference with live configuration	kubectl diff -f deploy.yaml
kubectl delete -f <file.yaml>	Delete resources from file	kubectl delete -f deploy.yaml






Context Switching
Command	Description	Example
kubectl config get-contexts	List all contexts	kubectl config get-contexts
kubectl config current-context	Show current context	kubectl config current-context
kubectl config use-context <context>	Switch to context	kubectl config use-context prod-cluster
kubectl config rename-context <old> <new>	Rename context	kubectl config rename-context gke_proj_zone_name prod







Common Flags
Flag	Description	Example
-n, --namespace	Specify namespace	kubectl get pods -n kube-system
-A, --all-namespaces	All namespaces	kubectl get pods -A
-o, --output	Output format (yaml/json/wide/custom)	kubectl get pod nginx -o yaml
--watch, -w	Watch for changes	kubectl get pods -w
--selector, -l	Filter by label	kubectl get pods -l app=nginx
--field-selector	Filter by field	kubectl get pods --field-selector status.phase=Running
--sort-by	Sort output	kubectl get pods --sort-by=.metadata.creationTimestamp







Advanced Operations
Command	Description	Example
kubectl auth can-i <verb> <resource>	Check permissions	kubectl auth can-i create deployments
kubectl explain <resource>	Get documentation	kubectl explain pods.spec.containers
kubectl get componentstatuses	Check component health	kubectl get cs
kubectl wait --for=condition=<condition> <resource>	Wait for condition	kubectl wait --for=condition=Ready pod/nginx
kubectl patch <resource> <name> -p '<patch>'	Patch resource	kubectl patch deploy nginx -p '{"spec":{"replicas":3}}'
kubectl kustomize <dir>	Print kustomization	kubectl kustomize ./overlay/dev
