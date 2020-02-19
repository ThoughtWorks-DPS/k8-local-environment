## 2. Local Kubernetes install/setup (with userspace virtualization, on macos) 

Virtualization running in Userspace will consistently outperform typical virtualization applications, all else being equal. RAM is a potentially critical requirement. (16gb at least in order to support istio.)  

• [minikube](https://minikube.sigs.k8s.io) on [hyperkit(https://github.com/moby/hyperkit)], or  

• [docker-for-mac edge](https://docs.docker.com/docker-for-mac/edge-release-notes/) with kubernetes  

(_note. See prereqs.sh for a potential run-once-setup option for Macs, or look at the notes related to that helper script in the [Local Tools](doc/tools.md) section_)  

### minikube

• install hyperkit and minikube  

```bash
$ brew install hyperkit
$ brew install minikube
```

• configure minikube settings and start  

```
$ minikube config set vm-driver hyperkit
$ minikube config set memory 12288
$ minikube config set cpus 6
$ minikube start --extra-config=kubelet.authentication-token-webhook=true
```

• Launch minikube LoadBalancer *In separate terminal window*  

```
$ minikube [tunnel](https://minikube.sigs.k8s.io/docs/tasks/loadbalancer/#using-minikube-tunnel)
```

### docker-for-mac  

• Install Docker-for-Mac edge and enable Kubernetes under preferences  

until Docker-for-Mac edge releases Kubernetes version >= 1.16, the following additionl  
configuration is needed to assure admissioncontroller customization health   

• Edit kubernetes manifest AdmissionController settings  

```bash
$ screen  ~/Library/Containers/com.docker.docker/Data/vms/0/tty  
$ vi /etc/kubernetes/manifests/kube-apiserver.yaml  
```

edit the following line: (_add text inside the quotes, but not the quotes_)  

```
--enable-admission-plugins=Initializers,NodeRestriction",MutatingAdmissionWebhook,ValidatingAdmissionWebhook"  
```

• Restart Docker-for-Mac   

[Return](../README.md)