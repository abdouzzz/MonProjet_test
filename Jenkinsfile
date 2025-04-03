pipeline {
    agent any

    environment {
        IMAGE_NAME = "abdouzzzz/monimage:latest"
        DOCKER_CREDENTIALS = "docker-hub-credentials"
    }

    stages {
        stage('Cloner le dépôt') {
            steps {
                git 'https://github.com/abdouzzz/MonProjet_test.git'
            }
        }

        stage('Construire l\'image Docker') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }

        stage('Connexion à Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', "$DOCKER_CREDENTIALS") {
                        echo "Connexion réussie à Docker Hub"
                    }
                }
            }
        }

        stage('Pousser l\'image Docker') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', "$DOCKER_CREDENTIALS") {
                        sh 'docker push $IMAGE_NAME'
                    }
                }
            }
        }

        stage('Déployer sur le serveur distant') {
            steps {
                script {
                    sshagent(['remote-server-credentials']) {
                        sh """
                        ssh user@remote-server 'docker pull $IMAGE_NAME && docker run -d -p 8080:80 $IMAGE_NAME'
                        """
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'L\'image Docker a été construite, poussée et déployée avec succès.'
        }

        failure {
            echo 'Une erreur s\'est produite lors du pipeline.'
        }
    }
}
