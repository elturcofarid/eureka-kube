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

      stage('Delete Docker Container') {
            steps {
              script{
       		 try{
                echo "-=- delete Docker container -=-"
                      sh "kubectl get all"
                sh "docker stop  ${APP_NAME}"
                sh "docker rm  ${APP_NAME}"
               sh "docker image rm ${APP_NAME}:test"
            }      
         catch(Exception e) {
           echo "-=- -=-"
             
          
        }}
            }}
     

        stage('Build Docker image') {
            steps {
                echo "-=- build Docker image -=-"
              sh "sudo docker build -t ${APP_NAME}:test ."
            }
        }



        stage('Run Docker image') {
            steps {
                echo "-=- run Docker image -=-"
                sh "sudo kubectl apply -f eureka.yaml"
            }
        }

}
}
