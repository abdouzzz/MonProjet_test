pipeline {
    agent any

    environment {
        IMAGE_NAME = "ton-utilisateur/monprojet"
        IMAGE_TAG = "latest"
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

        stage('Déployer sur un serveur de test') {
            steps {
                sh 'docker run -d -p 8000:8000 $IMAGE_NAME:$IMAGE_TAG'
            }
        }
    }
}
