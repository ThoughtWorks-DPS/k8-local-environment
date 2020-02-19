## 3. Deploy to kubernetes  

The python `invoke` files in this repository provide a convenient way to install the following services.  

• [metrics-server](https://github.com/kubernetes-incubator/metrics-server)  
• [kube-state-metrics](https://github.com/kubernetes/kube-state-metrics)  
• [istio](https://istio.io)  
• [open policy agent](https://www.openpolicyagent.org/docs/latest/) (pending)

_setup invoke under python3_  

```bash
$ python3 -m venv .venv  
$ source .venv/bin/activate  
$ pip install --upgrade -r requirements.txt  
```

Use `invoke -l` to see a list of available shortcuts.  

### metrics apis 

• metrics-server (0.3.6)  
• kube-state-metrics (v1.9.3)  

```bash
$ invoke deploy.metrics   local metrics-server v0.3.6, kube-state-metrics api v1.9.3   
```

### istio  

• Install the istioctl cli (v1.4.3)  

```bash
$ brew install istioctl  
```
_or add the local folder to your $PATH_ 

• deploy istio with the following configuration:    

--set profile=default  
--set values.tracing.enabled=true  
--set telemetry.enabled=true  
--set values.kiali.enabled=true  
--set values.kiali.dashboard.jaegerURL=http://jaeger-query:16686  
--set values.kiali.dashboard.grafanaURL=http://grafana:3000  

```bash
$ invoke deploy.istio
```

### opa-istio-plugin (pending)  

• opa-istio-plugin (v0.14.2)  

The next release of this guide will included opa capability  

### confirm health  

Confirm the cluster services are healthy  
```bash
$ invoke 
```



[Return](../README.md)