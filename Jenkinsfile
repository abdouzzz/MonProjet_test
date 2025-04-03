pipeline {
    agent any

    environment {
        IMAGE_NAME = "monprojet:latest"
        CONTAINER_NAME = "monprojet_container"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/abdouzzz/MonProjet_test.git'
            }
        }

        stage('Check Python Version') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'python3 --version'
                        sh 'pip3 --version'
                    } else {
                        bat 'python --version'
                        bat 'pip --version'
                    }
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'pip3 install -r requirements.txt'
                    } else {
                        bat 'pip install -r requirements.txt'
                    }
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'python3 -m unittest discover -s tests'
                    } else {
                        bat 'python -m unittest discover -s tests'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat 'docker build -t %IMAGE_NAME% .' // Windows
                    sh 'docker build -t $IMAGE_NAME .' // Linux/Mac
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    bat '''
                    docker stop %CONTAINER_NAME% || exit 0
                    docker rm %CONTAINER_NAME% || exit 0
                    docker run -d -p 8000:8000 --name %CONTAINER_NAME% %IMAGE_NAME%
                    '''
                    sh '''
                    docker stop $CONTAINER_NAME || exit 0
                    docker rm $CONTAINER_NAME || exit 0
                    docker run -d -p 8000:8000 --name $CONTAINER_NAME $IMAGE_NAME
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline exécuté avec succès ! 🎉"
        }
        failure {
            echo "Erreur dans le pipeline ! ❌"
        }
    }
}
