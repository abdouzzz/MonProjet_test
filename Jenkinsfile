pipeline {
    agent any

    environment {
        IMAGE_NAME = "abdou/test-python"  
        IMAGE_TAG = "latest"
        DOCKER_CREDENTIALS = "docker-hub-credentials"  
    }

    stages {
        stage('Cloner le dépôt') {
            steps {
        
                git 'https://github.com/abdouzzz/MonProjet_test.git'  
            }
        }

        stage('Exécuter les tests unitaires') {
            steps {
              
                sh 'python -m unittest discover tests'  
            }
        }

        stage('Construire l’image Docker') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'  
            }
        }

        stage('Pousser sur Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: DOCKER_CREDENTIALS, url: '']) {
                    sh 'docker push $IMAGE_NAME:$IMAGE_TAG'  
                }
            }
        }

        stage('Déployer sur un serveur local') {
            steps {
                sh 'docker pull $IMAGE_NAME:$IMAGE_TAG && docker run -d -p 8000:8000 $IMAGE_NAME:$IMAGE_TAG'  
            }
        }
    }
}
