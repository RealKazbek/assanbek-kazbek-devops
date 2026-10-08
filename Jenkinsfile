pipeline {
    agent any

    environment {
        STUDENT_NAME = 'Kazbek'
        STUDENT_SURNAME = 'Assanbek'
        STUDENT_GROUP = 'IT2-2302'
        STUDENT_ID = '37765'
        IMAGE_NAME = 'assanbek-kazbek-devops:jenkins'
        CONTAINER_NAME = 'assanbek-kazbek-jenkins-app'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git rev-parse --short HEAD'
            }
        }
        stage('Build') {
            steps {
                sh '''#!/usr/bin/env bash
                    echo "Student: $STUDENT_NAME $STUDENT_SURNAME"
                    echo "Group: $STUDENT_GROUP"
                    echo "Student ID: $STUDENT_ID"
                '''
                sh 'python3 -m compileall app'
            }
        }
        stage('Test') {
            steps {
                sh 'python3 -m unittest discover -s tests -v'
            }
        }
        stage('Docker Build') {
            steps {
                sh '/usr/bin/docker build -t "$IMAGE_NAME" .'
            }
        }
        stage('Docker Run') {
            steps {
                sh '''#!/usr/bin/env bash
                    set -euo pipefail
                    /usr/bin/docker rm -f "$CONTAINER_NAME" 2>/dev/null || true
                    /usr/bin/docker run -d --name "$CONTAINER_NAME" \\
                      -e STUDENT_NAME -e STUDENT_SURNAME -e STUDENT_GROUP -e STUDENT_ID \\
                      "$IMAGE_NAME"
                    sleep 2
                    /usr/bin/docker logs "$CONTAINER_NAME"
                    /usr/bin/docker exec "$CONTAINER_NAME" python -c "from app.app import application_text; print(application_text())"
                '''
            }
        }
    }
    post {
        always {
            sh '/usr/bin/docker ps -a --filter "name=$CONTAINER_NAME" || true'
        }
    }
}
