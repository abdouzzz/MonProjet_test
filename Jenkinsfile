pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Cloner la branche main du dépôt public
                git url: 'https://github.com/abdouzzz/MonProjet_test.git', branch: 'main'
            }
        }
        stage('Check Python Version') {
            steps {
                script {
                    // Vérifier que python3 et pip3 sont disponibles dans le PATH
                    sh 'python3 --version'
                    sh 'pip3 --version'
                }
            }
        }
        stage('Install Dependencies') {
            steps {
                script {
                    // Installer les dépendances dans l'environnement global
                    sh 'pip3 install --break-system-packages -r requirements.txt'
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    // Exécuter les tests avec python3
                    sh 'python3 -m unittest discover -s tests'
                }
            }
        }
    }
}
