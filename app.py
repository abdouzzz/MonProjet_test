from flask import Flask

# Crée une instance de l'application Flask
app = Flask(__name__)

# Définir une route pour la page d'accueil
@app.route('/')
def home():
    return "Bienvenue sur l'application Jenkins + Docker !"

# Lancer l'application sur le port 8000
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
