---
title: 'Mitre Siphon - a full text search engine for mitre CVEs'
excerpt: 'Using Quartz, PostgreSQL, Kafka, Kubernetes, and Helm to create a REST API full text search engine for the MITRE CVE database thats continously updated'
coverImage: '/assets/blog/mitre-siphon/cover.jpg'
date: '2022-12-13T00:00:00.000Z'
author:
  name: bryopsida
  picture: '/assets/blog/authors/si.jpeg'
ogImage:
  url: '/assets/blog/mitre-siphon/cover.jpg'
---

## Mitre-Siphon

Watches the NVD CVE JSON repositories and on updates publishes to a queue. Queue data is processsed and saved into a database for full text searching across a REST Api.

### Prerequisites

- [docker](https://docs.docker.com/desktop/)
- [docker-compose](https://docs.docker.com/compose/)

## Running the tests

Tests are run using docker-compose.

```
docker-compose --file docker-compose.test.yml build
docker-compose --file docker-compose.test.yml run sut
```

## Getting Started

Run `docker-compose up` to launch the application. Once everything has started up you will be able to access the application at http://localost:8080/ the default credentials are test:test. Once you are logged in you will have access to the swagger ui to interact with the REST API. This will allow you to do paged multi term searches against the saved NVD CVE data.

![image](https://user-images.githubusercontent.com/8363252/106229649-9adac180-61b3-11eb-8aa9-614ebfb1dcf3.png)

## Built With

- [Spring Boot](https://spring.io/projects/spring-boot)
- [Gradle](https://gradle.org/)
- [Quartz](https://www.quartz-scheduler.org/)
- [Kafka](http://kafka.apache.org/)
- [PostgreSQL](https://www.postgresql.org/)
- [FlyWay](https://flywaydb.org/documentation/)
- [Hibernate](https://hibernate.org/)
- [OpenAPI3](https://swagger.io/blog/news/announcing-openapi-3-0/)

Source Code
---
[Github](https://github.com/curium-rocks/mitre-siphon)