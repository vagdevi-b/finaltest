# Build Petclinic Spring Boot application using Maven and deploy it inside a Docker container.


pipeline {
    agent any

    stages {
        stage('Clean Workspace'){
            steps{
                cleanWs()
            }
        }
        stage ('Cloning Repo') {
            steps {
                sh 'git clone https://github.com/vagdevi-b/springboot-petclinic.git'
            }
        }
        stage ('Building and Deploying') {
            steps {
                    dir('spring-petclinic-main') {
                    sh 'pwd'                
                    sh 'docker build -t petimage .'
                    sh 'docker stop petcont'
                    sh 'docker rm petcont'
                    sh 'docker run -dt --name petcont -p 8081:8080 petimage /bin/sh'
                }
             }
        }
        stage('Post-deployment-status') {
          steps {
            // sleep time: 2, unit: 'MINUTES'
            sh returnStatus: true, script: '''#!/bin/bash
            url="http://localhost:8081"
            http_code=$(curl -s -o /dev/null -w "%{http_code}" "$url")
            if [ "$http_code" -eq "200" ]; then
            echo "Accessible with status code"
            else
            echo "Not accessible or has a different status code"
            fi'''
          }
        }
    }
}