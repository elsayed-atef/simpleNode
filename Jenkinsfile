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
                sh 'docker build -t nexus.vodafone.com:8443/node-vf:latest .'
                echo 'built....'
            }
        }
       
       stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'nexus-credential', passwordVariable: 'nexusPassword', usernameVariable: 'nexusUser')]) {
          sh "docker login nexus.vodafone.com:8443 -u ${env.nexusUser} -p ${env.nexusPassword}"
          sh 'docker push nexus.vodafone.com:8443/node-vf:latest'
          sh "docker login nexus.vodafone.com:443 -u ${env.nexusUser} -p ${env.nexusPassword}"
        }
      }
    }

  stage('Deploy') {
      
      steps {
         withCredentials([usernamePassword(credentialsId: 'nexus-credential', passwordVariable: 'nexusPassword', usernameVariable: 'nexusUser')]) {
          sh "docker login nexus.vodafone.com:443 -u ${env.nexusUser} -p ${env.nexusPassword}"
          sh 'kubectl apply -f nodejs.yml'
            sh 'kubectl apply -f nodejs-service.yml'
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
