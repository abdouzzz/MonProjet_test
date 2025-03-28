pipeline {
    agent any

    stages {
        stage('Cloner le dépôt') {
            steps {
                git url : 'https://github.com/abdouzzz/MonProjet_test.git' , branch : 'main'
            }
        }

        stage('Exécuter les tests unitaires') {
            steps {
                sh 'python -m unittest discover tests'
            }
        }

        stage('Construire l’image Docker') {
            steps {
                sh 'docker build -t abdou/test-python:latest .'
            }
        }

        stage('Déployer sur un serveur local') {
            steps {
                sh 'docker run -d -p 8000:8000 abdou/test-python:latest'
            }
        }
    }
}
