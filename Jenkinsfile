pipeline {
   agent none

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
          agent {
        docker {
            image 'node:6-alpine'
            args '-p 3000:3000'
        }
    }
            steps {
                sh 'docker build -t nexus.vodafone.com:8433/node:latest .'
                echo 'built....'
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
