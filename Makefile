NAME = terjesannum/java-logger-test
VERSION = 3

.PHONY: clean jar build

build: jar
	docker build -t $(NAME):$(VERSION) .

jar:
	cd java; mvn -Dbuild.version=$(VERSION) package

clean:
	cd java; mvn clean


