NAME = terjesannum/java-logger-test
VERSION = 6
PROFILE = logback

.PHONY: clean jar build

build: jar
	docker build -t $(NAME):$(VERSION)-$(PROFILE) .

jar:
	cd java; mvn -P $(PROFILE) -Dbuild.version=$(VERSION) package

clean:
	cd java; mvn clean


