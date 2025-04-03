# Utiliser une image officielle Python
FROM python:3.9

# Définir le dossier de travail
WORKDIR /app

# Copier le code source
COPY . .

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Exposer le port 8000
EXPOSE 8000

# Lancer l'application Flask
CMD ["python", "app.py"]
