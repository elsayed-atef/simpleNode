pipeline {
  agent {
        docker {
            image 'node:6-alpine'
            args '-p 3000:3000'
        }
    }

    stages {
      /* stage('Check out') {
           steps {
            checkout scm
            echo 'checkout..'
            git url: 'https://github.com/sayed24/simpleNode.git'
            checkout scm

                echo 'checked..'
            }

        }*/
        stage('Build') {
            steps {
                sh 'npm install'
                echo 'Building..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
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
