pipeline {
    agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
        }
    }

    environment {
        APP_NAME = "eureka-server"
        TEST_CONTAINER_NAME = "${APP_NAME}-${BUILD_NUMBER}"
    }

    stages {


        stage('Package') {
            steps {
                echo "-=- packaging project -=-"
                 sh "ls"
            }
        }

      stage('Delete Docker Container') {
            steps {
              script{
       		 try{
                echo "-=- delete Docker container -=-"
                sh "sudo docker stop  ${APP_NAME}"
                sh "sudo docker rm  ${APP_NAME}"
               sh "sudo docker image rm ${APP_NAME}:test"
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
