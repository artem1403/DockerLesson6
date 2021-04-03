# Тренировка сборки контейнеров

Проходим курс https://devops-school.ru/devops_engineer.html, собираем такой Docker-контейнер, чтобы он мог выполнить сборку java-приложения средствами maven и запустить его в веб-сервере tomcat.

Приложение выбрано 
https://github.com/GoogleCloudPlatform/appengine-java-vm-sudoku-sample

Конкретнее этот [коммит](https://github.com/GoogleCloudPlatform/appengine-java-vm-sudoku-sample/commit/ee79082e076efc81da7798d19653e89659d83afd)

## Что просходит в Dockerfile

За основу взят образ `ubuntu:20.04`. 
В него ставим 
* `default-jdk`
* `tomcat9`
* `maven`
Одной командой `RUN`, чтобы не создавать лишние слои.


### Команды на память
```bash
docker build -t dockerlesson6 .
docker run -d -p 8080:8080 --name lesson6 dockerlesson6:latest
docker start lesson6
```