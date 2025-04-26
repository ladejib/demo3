IMAGE_NAME=your-dockerhub-username/playwright-runner
TAG=latest

build:
	docker build -t $(IMAGE_NAME):$(TAG) .

push:
	docker push $(IMAGE_NAME):$(TAG)

deploy:
	kubectl apply -k manifests/

delete:
	kubectl delete -k manifests/

