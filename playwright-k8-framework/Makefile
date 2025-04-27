IMAGE_NAME=saifb/playwright-runner
TAG=latest

build:
	docker build --no-cache -t $(IMAGE_NAME):$(TAG) .

push:
	docker push $(IMAGE_NAME):$(TAG)

namespace:
	kubectl create ns playwright

deploy:
	kubectl apply -k manifests/

delete:
	kubectl delete -k manifests/

