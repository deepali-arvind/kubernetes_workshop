#!/bin/bash
#
# Copyright (c) METAMAGIC GLOBAL INC, USA
#
# This script will create the database setup
#

echo " MAKE SURE YOU HAVE EXECUTED BELOW YAML BEFORE..."

echo "install/kubernetes/helm/istio/templates/crds.yaml && install/kubernetes/istio-demo.yaml"



echo "Create Shoppingportal namespace"
kubectl replace -f https://raw.githubusercontent.com/meta-magic/kubernetes_workshop/master/yaml/istio/shopping-ns.yaml

echo "Creating MYSQL(secret, volumn, deployment and service) in k8"
kubectl create -f https://raw.githubusercontent.com/meta-magic/kubernetes_workshop/master/yaml/mysqlfiles/mysql-secret.yaml
kubectl create -f https://raw.githubusercontent.com/meta-magic/kubernetes_workshop/master/yaml/mysqlfiles/mysql-pv.yaml
kubectl create -f https://raw.githubusercontent.com/meta-magic/kubernetes_workshop/master/yaml/mysqlfiles/mysql-pvc.yaml
kubectl create -f https://raw.githubusercontent.com/meta-magic/kubernetes_workshop/master/yaml/mysqlfiles/mysql-dep.yaml
kubectl create -f https://raw.githubusercontent.com/meta-magic/kubernetes_workshop/master/yaml/mysqlfiles/mysql-svc.yaml

echo "Create Product Microservice deployment and service in k8"
kubectl create -f https://raw.githubusercontent.com/meta-magic/kubernetes_workshop/master/yaml/istio/product/product-v1.yaml
kubectl create -f https://raw.githubusercontent.com/meta-magic/kubernetes_workshop/master/yaml/istio/product/product-v2.yaml
kubectl create -f https://raw.githubusercontent.com/meta-magic/kubernetes_workshop/master/yaml/istio/product/product-service.yaml
kubectl create -f https://raw.githubusercontent.com/meta-magic/kubernetes_workshop/master/yaml/istio/product/product-destination.yaml


echo "Create Product Review Microservice deployment and service in k8"
kubectl create -f https://raw.githubusercontent.com/meta-magic/kubernetes_workshop/master/yaml/istio/productreview/productreview-v1.yaml
kubectl create -f https://raw.githubusercontent.com/meta-magic/kubernetes_workshop/master/yaml/istio/productreview/productreview-service.yaml

echo "Create UI deployment and service in k8"
kubectl create -f https://raw.githubusercontent.com/meta-magic/kubernetes_workshop/master/yaml/istio/ui/ui-v1.yaml
kubectl create -f https://raw.githubusercontent.com/meta-magic/kubernetes_workshop/master/yaml/istio/ui/ui-v2.yaml
kubectl create -f https://raw.githubusercontent.com/meta-magic/kubernetes_workshop/master/yaml/istio/ui/ui-destination.yaml
kubectl create -f https://raw.githubusercontent.com/meta-magic/kubernetes_workshop/master/yaml/istio/ui/ui-service.yaml

echo "Create Gateway  in k8"
kubectl create -f https://raw.githubusercontent.com/meta-magic/kubernetes_workshop/master/yaml/istio/shoppingportal-gw.yaml

echo "Create Virtual Service in k8"
kubectl create -f https://raw.githubusercontent.com/meta-magic/kubernetes_workshop/master/yaml/istio/shoppingportal-virtualservice.yaml




echo $PWD

