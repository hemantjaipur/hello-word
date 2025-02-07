pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "angular-app"
        CONTAINER_NAME = "angular-container"
    }
    stages {
        stage('Checkout COde') {
            steps {
                git branch: 'main', url: 'https://github.com/hemantjaipur/hello-word.git'
            }
        }
    
        stage('Build Angular app using docker ') {
            steps {
                stript {
                    echo 'building docker image for angular'
                    sh 'docker build -t $DOCKER_IMAGE .' 
                }
            }
        }
        stage('Run Angular App in Docker') {
            steps{
                script {
                    echo 'Stopping and Removing Existing Container'
                    sh 'docker stop $CONTAINER_NAME || true && docker rm $CONTAINER_NAME || true'

                    echo 'Running angular app in container'
                    sh 'docker run -d -p 4200:80 --name $CONTAINER_NAME DOCKER_IMAGE'
                }
            }
        }
    }
}