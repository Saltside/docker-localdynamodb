ENVIRONMENT:=tmp/environment
DOCKER_IMAGE:=saltside/localdynamodb:latest

COMPOSE:=env DOCKER_IMAGE=$(DOCKER_IMAGE) docker-compose

$(ENVIRONMENT):
	$(COMPOSE) up -d dynamodb
	mkdir -p $(@D)
	touch $(ENVIRONMENT)

.PHONY: test
test: $(ENVIRONMENT)
	$(COMPOSE) run --rm test

.PHONY: push
push:
	$(COMPOSE) build
	docker push $(DOCKER_IMAGE)

.PHONY: clean
clean:
	$(COMPOSE) down
	rm -f $(ENVIRONMENT)
