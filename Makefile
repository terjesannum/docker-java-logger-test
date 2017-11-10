NAME = terjesannum/java-logger-test
VERSION = 5
PROFILE = logback

.PHONY: clean jar build

build: jar
	docker build -t $(NAME):$(VERSION)-$(PROFILE) .

jar:
	cd java; mvn -P $(PROFILE) -Dbuild.version=$(VERSION) package

clean:
	cd java; mvn clean


