pipeline {
    agent any

    stages {
        stage('Check Git Version') {
            steps {
                // Vérifie si git est installé et affiche la version
                sh 'git --version'
            }
        }

        stage('Hello World') {
            steps {
                // Affiche "Hello World" avec echo
                sh 'echo "Hello World from Jenkins!"'
            }
        }
    }
}
