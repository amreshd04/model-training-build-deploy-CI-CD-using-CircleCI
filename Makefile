NAME=model-training-build-deploy
COMMIT_ID=$(shell git rev-parse HEAD)

build-ml-api-aws:
	docker build --build-arg PIP_EXTRA_INDEX_URL=${PIP_EXTRA_INDEX_URL} -t $(NAME):$(COMMIT_ID) .

push-ml-api-aws:
	docker push ${AWS_ACCOUNT_ID}.dkr.ecr.us-east-2.amazonaws.com/$(NAME):$(COMMIT_ID)

tag-ml-api:
	docker tag $(NAME):$(COMMIT_ID) ${AWS_ACCOUNT_ID}.dkr.ecr.us-east-2.amazonaws.com/$(NAME):$(COMMIT_ID)