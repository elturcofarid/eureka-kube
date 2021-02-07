pipeline {
     
     agent any
     
    environment {
        APP_NAME = "eureka-server"
        TEST_CONTAINER_NAME = "${APP_NAME}-${BUILD_NUMBER}"
    }

    stages {


        stage('Package') {
            steps {
                echo "-=- packaging project -=-"
                 sh "mvn package"
            }
        }

        stage('Build Docker image') {
            steps {
                echo "-=- build Docker image -=-"
              sh "docker build -t ${APP_NAME}:test ."
            }
        }


        stage('Run Docker image') {
            steps {
                echo "-=- run Docker image -=-"
                sh "kubectl apply -f eureka.yaml"
            }
        }

}
}
