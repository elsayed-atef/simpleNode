pipeline {
    agent any

    stages {
       stage('Check out') {
           steps {
            checkout scm
            echo 'checkout..'
            git url: 'https://github.com/sayed24/simpleNode.git'
            checkout scm
                echo 'checked..'
            }
        }
        stage('Test') {
            steps {
               npm install
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }

        stage('Cleanup'){
            steps {
        echo 'prune and cleanup'
        sh 'npm prune'
        sh 'rm node_modules -rf'
            }
      }
    }
}
