pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "monprojet:latest"
    }

    stages {
        stage('Install Dependencies (System)') {
            steps {
                script {
                    sh '''
                    apt-get update && apt-get install -y python3 python3-pip git
                    '''
                }
            }
        }

        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/abdouzzz/MonProjet_test.git', branch: 'main'
            }
        }

        stage('Check Python Version') {
            steps {
                script {
                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                        sh 'python3 --version'
                        sh 'pip3 --version'
                    }
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    sh 'pip3 install --break-system-packages -r requirements.txt'
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                        sh 'python3 -m unittest discover -s tests'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker run -d -p 8000:8000 $DOCKER_IMAGE'
                }
            }
        }
    }

    post {
        failure {
            echo '❌ Erreur dans le pipeline !'
        }
        success {
            echo '✅ Pipeline exécuté avec succès !'
        }
    }
}
