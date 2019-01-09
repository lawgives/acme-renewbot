# Makefile for creating container file
# Override these with environmental variables
VERSION?=$(shell cat VERSION)
VERSION?=0.1
FULL_VERSION?=0.1

### Do not override below

user=legalio
app=acme-renewbot
version=$(VERSION)
#registry=docker.io

all: container

container:
	docker build --tag=$(user)/$(app):$(version) --tag=$(user)/$(app):latest .

push:
	docker push $(user)/$(app):$(version)

push-latest:
	docker push $(user)/$(app):latest

push-all: push push-latest

.PHONY: all container push push-latest push-all
