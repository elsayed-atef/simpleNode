pipeline {
   agent any

    stages {
      
        stage('Build') {
          agent {
        docker {
            image 'node:6-alpine'
            args '-p 3000:3000'
        }
    }
            steps {
                sh 'npm install'
                echo 'Building..'
            }
        }
        stage('Build docker image') {
         
            steps {
                sh 'ls -l ' 
                sh 'docker build -t nexus.vodafone.com:8443/node:latest .'
                echo 'built....'
            }
        }
       
       stage('docker push') {
         
               steps {
      withDockerServer([uri: "tcp://nexus.vodafone.com:8443"]) {
        withDockerRegistry([credentialsId: 'nexus-credential', url: "https://nexus.vodafone.com:8443"]) {
             sh 'docker push nexus.vodafone.com:8443/node:latest'
                   }
             }
              }
        }

    /*    stage('Cleanup'){
            steps {
        echo 'prune and cleanup'
        sh 'npm prune'
        sh 'rm node_modules -rf'
            }
      }*/
    }
}
