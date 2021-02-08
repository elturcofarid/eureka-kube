pipeline {
    agent any
    environment {
        APP_NAME = "eureka-server"
        TEST_CONTAINER_NAME = "${APP_NAME}-${BUILD_NUMBER}"
    }

    stages {
        stage('Compilación') {
            steps {
                echo "-=- packaging project -=-"
                 sh "mvn package"
          }
     }

        stage('Construcción de Imagen') {
            steps {
                echo "-=- build Docker image -=-"
              sh "sudo -S docker build -t ${APP_NAME}:test ."
            }
        }


        stage('Deployment eb Kubernetes') {
            steps {
                echo "-=- run Docker image -=-"
                sh "sudo -S kubectl apply -f eureka.yaml"
            }
        }
  }
}
