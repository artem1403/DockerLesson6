# Тренировка сборки контейнеров

Проходим курс https://devops-school.ru/devops_engineer.html, собираем такой Docker-контейнер, чтобы он мог выполнить сборку java-приложения средствами maven и запустить его в веб-сервере tomcat.

Приложение выбрано 
https://github.com/farin/JCloisterZone

Конкретнее этот [коммит](https://github.com/farin/JCloisterZone/commit/90fc36957e55a52caf1e9f3884a8c83bcc32890d)

## Что просходит в Dockerfile

За основу взят образ `ubuntu:20.04`. 
В него ставим 
* `default-jdk`
* `tomcat9`
* `maven`
Одной командой `RUN`, чтобы не создавать лишние слои.