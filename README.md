# Dockerfile examples

## PHP Info

#### Build
Open terminal and execute the following commands
```
cd php-info
```
Once you're inside the directory build the image and run it
```
docker build -t php-info .
```
- `-t php-info` the image name, tag will be "latest" by default
- `.` Dockerfile path, which is current path

#### Run
```
docker run -it --rm -p 2052:80 php-info
```
- `-it` enable interaction with the container
- `--rm` automatically remove the container when it exits
- `-p 2052:80` maps the host port 2052 to container port 80

Open browser and go to http://localhost:2052/info.php

#### Stop
Press ctrl+c on windows and macOS to exit and stop the container, which will be automatically deleted because `--rm` was passed in the run command

## Node Express

#### Build
Open terminal and execute the following commands
```
cd node-express
```
Once you're inside the directory build the image and run it
```
docker build -t node-express .
```
- `-t php-info` the image name, tag will be "latest" by default
- `.` Dockerfile path, which is current path

#### Run
```
docker run -it --rm -d -e PORT=8080 -p 2053:8080 node-express
```
- `-it` enable interaction with the container
- `--rm` automatically remove the container when it exits
- `-d` detach and run container in background
- `-e PORT=8080` set environment variable PORT value to 8080 
- `-p 2053:8080` maps the host port 2053 to container port 80
- `node-express` image name

Open browser and go to http://localhost:2053

#### Stop
Execute the following to get list of all containers
```
docker ps -a
```
- `-a` to list all containers
To stop the container execute:
```
docker stop CONTAINER_ID
```
Once the container is stopped it will be deleted automatically because `--rm` was passed in the run command

## CPP CMake

#### Build
Open terminal and execute the following commands
```
cd cpp-cmake
```
Once you're inside the directory build the image and run it
```
docker build -t cpp-cmake:staging .
```
- `-t cpp-cmake:staging` the image name, the tag is "staging"
- `.` Dockerfile path, which is current path

#### Run
```
docker run --rm cpp-cmake:staging
```
- `--rm` automatically remove the container when it exits

`Hello World!` will be printed on the terminal, and the container will exit once the sentence is printed

## Advanced PHP Yii2

#### Build
Open terminal and execute the following commands
```
cd advanced
```
Once you're inside the directory build the image and run it
```
docker build -t advanced .
```
- `-t php-info` the image name, tag will be "latest" by default
- `.` Dockerfile path, which is current path

#### Run
```
docker run -it --rm -e MYSQL_DATABASE="advanced_db" -e MYSQL_USERNAME="root" -e MYSQL_PASSWORD="" -p 2082:80 advanced
```
- `-it` enable interaction with the container
- `--rm` automatically remove the container when it exits
- `-e MYSQL_DATABASE="advanced_db"` set environment variable MYSQL_DATABASE value to "advanced_db" 
- `-e MYSQL_USERNAME="root"` set environment variable MYSQL_USERNAME value to "root" 
- `-e MYSQL_PASSWORD=""` set environment variable MYSQL_PASSWORD value to "" 
- `-p 2082:80` maps the host port 2082 to container port 80

Open browser and go to http://localhost:2082

#### Stop
Press ctrl+c on windows and macOS to exit and stop the container, which will be automatically deleted because `--rm` was passed in the run command