#!/bin/bash
echo "We're going to try to install the dependencies for you!"

set -e

# this quick setup only supports MacOS at the moment
[[ $(uname) == "Darwin" ]] || ( echo "installation only works on Mac" && exit 1 )

# assumes homebrew in already installed
hash brew &>/dev/null || ( echo "you need to install homebrew manually" && exit 1 )

# install brew packages
hash hyperkit &>/dev/null || brew install hyperkit
hash minikube &>/dev/null || brew install minikube
hash kubectl &>/dev/null || brew install kubernetes-cli
hash helm &>/dev/null || brew install helm
hash stern &>/dev/null || brew install stern
hash kube-ps1 &>/dev/null || brew install kube-ps1
hash kubectx &>/dev/null || brew install kubectx
hash kubefwd &>/dev/null || brew install txn2/tap/kubefwd
hash hadolint &>/dev/null || brew install hadolint
hash kubeval &>/dev/null || brew install kubeval
hash vault &>/dev/null || brew install Vault
hash consul &>/dev/null || brew install Consul
hash istioctl &>/dev/null || brew install istioctl
hash bk &>/dev/null || (brew tap buildkite/cli && brew install bk)
hash mkcert &>/dev/null || brew install mkcert
hash git-secrets &>/dev/null || brew install git-secrets

#install python packages
hash python3 &>/dev/null || brew install python3
[[ -e .env/bin/activate ]] || python3 -m venv .env
( . .env/bin/activate && pip install --upgrade pip invoke )
echo "python dependencies installed in a virtualenv. run \`. .env/bin/activate\` to use"
hash bundle &>/dev/null || ( echo -e "you somehow have no Ruby, so we're installing latest\n" && brew install ruby )
bundle install || ( echo "your bundle install failed, which means you're running base install Ruby or a pre 2.1 version. You'll need to resolve it yourself if you want to run the tests, but the rest will work fine." && exit 1)
