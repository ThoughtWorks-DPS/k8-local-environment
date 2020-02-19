
## 5. View dashboards

#### Install kubernetes Web UI ([dashboard](https://github.com/kubernetes/dashboard))  (_recommend not using dashboard on remote clusters_)  

This will create a local admin-user and launch the kubernetes dashboard.    

```bash
$ inv deploy.dash
```

To view the dashboard:
```bash
$ inv view.dash
dashboard token copied to clipboard
Starting to serve on 127.0.0.1:8001
```
A browser windows will appear. Select the `token` authentication method and Ctrl-V to paste  
the admin-user token in your clipboard. (You will receive a 'unsigned' cert error message.)

#### Istio Dashboards

$ istioctl dashboard prometheus
$ istioctl dashbaord jaeger
$ istioctl dashboard kiali

Kill all forwarders  

```bash
$ inv view.off
```

*Kiali is part of the istio deployment. The local username and password are: kiali



[Return](../README.md)