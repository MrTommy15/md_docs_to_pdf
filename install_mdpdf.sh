#!/bin/bash

echo "=== Installateur de MD_DOCS_TO_PDF ==="

echo "[1] Installation complète"
echo "[2] Check de la variable d'environnement"
read -p "Veuillez choisir 1 ou 2 :" CHOICE

if [[ "$CHOICE" == "1" ]]; then
    # Demande confirmation installation
    read -p "Voulez-vous installer MD_DOCS_TO_PDF sur votre machine ? (y/n) " CONFIRMATION

    if [[ "$CONFIRMATION" == "y" ]]; then
        echo "Lancement de l'installation..."

        # Installation de puppeteer
        echo "Installation de Puppeteer..."
        npm install -g puppeteer@latest

        # Installation de docs-to-pdf
        echo "Installation de docs-to-pdf..."
        npm install -g docs-to-pdf

        # On donne des droits d'exécution sur docs-to-pdf
        echo "Attribution des droits d'exécution..."
        sudo chmod +x /usr/local/bin/docs-to-pdf

        # Installation de fs-extra
        echo "Installation de fs-extra..."
        npm install -g fs-extra

        # Installation de chromium-browser
        echo "Installation de chromium-browser..."
        sudo apt update && sudo apt install -y chromium-browser

        # Création de la variable d'environnement
        echo "Création de la variable d'environnement PUPPETEER_EXECUTABLE_PATH..."
        # Vérification si chromium-browser est détecté
        CHROMIUM_PATH=$(which chromium-browser)
        echo "🔍 Chemin trouvé : $CHROMIUM_PATH"

        if [[ -z "$CHROMIUM_PATH" ]]; then
            echo "⚠️ Erreur : chromium-browser introuvable dans le PATH."
            exit 1
        fi

        export PUPPETEER_EXECUTABLE_PATH=$CHROMIUM_PATH
        echo "✅ PUPPETEER_EXECUTABLE_PATH défini : $PUPPETEER_EXECUTABLE_PATH"

        # Fin de l'installation
        echo "L'installation est temrinée..."

    else
        echo "❌ L'installation est annulée"
        exit 1
    fi
elif [[ "$CHOICE" == "2" ]]; then
    if [[ -z "$PUPPETEER_EXECUTABLE_PATH" ]]; then
        echo "❌ La variable d'environnement PUPPETEER_EXECUTABLE_PATH n'est pas définie."
        echo "👉 Création de la variable d'environnement..."

        # Vérification si chromium-browser est détecté
        CHROMIUM_PATH=$(which chromium-browser)
        echo "🔍 Chemin trouvé : $CHROMIUM_PATH"

        if [[ -z "$CHROMIUM_PATH" ]]; then
            echo "⚠️ Erreur : chromium-browser introuvable dans le PATH."
            exit 1
        fi

        export PUPPETEER_EXECUTABLE_PATH=$CHROMIUM_PATH
        echo "✅ PUPPETEER_EXECUTABLE_PATH défini : $PUPPETEER_EXECUTABLE_PATH"
    else
        echo "✅ La variable d'environnement PUPPETEER_EXECUTABLE_PATH est déjà définie !"
    fi

else
    echo "❌ Option invalide."
    exit 1
fi

