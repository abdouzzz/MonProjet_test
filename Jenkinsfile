pipeline {
    agent any  // Utilisation de l'agent par défaut pour exécuter sur n'importe quel noeud

    environment {
        DOCKER_IMAGE = "monprojet:latest"  // Nom de l'image Docker
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Cloner le dépôt Git
                git url: 'https://github.com/abdouzzz/MonProjet_test.git', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Installer les dépendances Python depuis requirements.txt
                sh 'pip3 install -r requirements.txt'
            }
        }

        stage('Run Unit Tests') {
            steps {
                // Exécuter les tests unitaires
                sh 'python3 -m unittest discover -s tests'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Construire l'image Docker
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Deploy to Test Server') {
            steps {
                // Déployer l'application Docker sur un serveur de test (via SSH ou une autre méthode)
                // Assurer que le serveur de test est configuré pour accepter les commandes
                // Exemple d'une commande SSH pour lancer le conteneur Docker sur le serveur de test
                sh 'ssh user@test-server "docker run -d -p 8000:8000 $DOCKER_IMAGE"'
            }
        }
    }

    post {
        success {
            // Si tout a bien fonctionné, afficher un message de succès
            echo '✅ Pipeline exécuté avec succès !'
        }
        failure {
            // Si une étape échoue, afficher un message d'erreur
            echo '❌ Erreur dans le pipeline !'
        }
    }
}
