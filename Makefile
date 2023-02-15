MAKEFLAGS += --always-make

build:
	docker build -t adult-model .

run:
	docker run -d --name model adult-model

preprocessing:
	docker container exec model python3 preprocessing.py

train:
	docker container exec model python3 train.py

test:
	docker container exec model python3 test.py

results:
	docker container exec model cat /home/jovyan/results/train_metadata.json /home/jovyan/results/test_metadata.json

all: preprocessing train test results