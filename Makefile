NAME = terjesannum/java-logger-test
VERSION = 7
PROFILE = logback

.PHONY: clean jar build

build: jar
	docker build -t $(NAME):$(VERSION)-$(PROFILE) .

jar:
	cd java; mvn -P $(PROFILE) package

clean:
	cd java; mvn clean


