# Utiliser une image de base officielle Python
FROM python:3.9-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier requirements.txt dans le conteneur
COPY requirements.txt /app/

# Installer les dépendances depuis requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copier le reste des fichiers du projet dans le conteneur
COPY . /app/

# Définir la commande d'exécution (ici, par exemple pour une application Flask)
CMD ["python3", "app.py"]

# Exposer le port sur lequel l'application écoutera
EXPOSE 8000
