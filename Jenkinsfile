pipeline {
    agent any

    stages {
        stage('Check Python and Pip') {
            steps {
                script {
                    // Vérifier si Python 3 et pip3 sont installés
                    sh 'python3 --version'
                    sh 'pip3 --version'
                }
            }
        }

        stage('Install Python and Pip') {
            steps {
                script {
                    // Installer Python 3 et pip3 si non installés
                    sh 'apt-get update && apt-get install -y python3 python3-pip'
                }
            }
        }

        stage('Install dependencies') {
            steps {
                script {
                    // Installer les dépendances à partir de requirements.txt
                    sh 'pip3 install -r requirements.txt'
                }
            }
        }

        stage('Run tests') {
            steps {
                script {
                    // Exécuter les tests unitaires avec pytest
                    sh 'pytest'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Construire une image Docker
                    sh 'docker build -t my-app-image .'
                }
            }
        }

        stage('Deploy to Test Server') {
            steps {
                script {
                    // Déployer l'application sur le serveur de test
                    sh './deploy.sh'  // Assurez-vous que le script de déploiement est en place
                }
            }
        }
    }
}
