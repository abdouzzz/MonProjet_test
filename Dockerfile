# Utiliser une image officielle de Python
FROM python:3.9

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers du projet dans le conteneur
COPY . .

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Exposer le port utilisé par l'application Flask
EXPOSE 3000

# Définir la commande de lancement de l'application
CMD ["python", "app.py"]
