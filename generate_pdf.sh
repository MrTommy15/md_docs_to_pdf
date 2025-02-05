#!/bin/bash

echo "🚀 Génération de PDF depuis une documentation Docusaurus"

# On check la variable d'environnement
if [[ -z "$PUPPETEER_EXECUTABLE_PATH" ]]; then
    echo "❌ La variable d'environnement PUPPETEER_EXECUTABLE_PATH n'est pas définie."
    echo "👉 Veuillez lancer [source ./install_mdpdf.sh] et choisir l'option numéro 2 afin de redéfinir la variable d'environnement !"
    exit 1
fi

DIR_PATH="./PDF_files"
# Vérifier si le dossier existe
if [[ ! -d "$DIR_PATH" ]]; then
    echo "📂 Le dossier $DIR_PATH n'existe pas. Création en cours..."
    mkdir -p "$DIR_PATH"
    echo "✅ Dossier créé : $DIR_PATH"
fi

# Demander l'URL de base
read -p "👉 Entrez l'URL de base de votre documentation (ex: http://localhost:3000/docs/): " PAGE_URL

# Vérifier si l'URL est vide
if [[ -z "$PAGE_URL" ]]; then
    echo "❌ L'URL ne peut pas être vide."
    exit 1
fi

# Demande s'il s'agit d'un site docusaurus pour le contentSelector
CONTENT_SELECTOR=""
read -p "👉 Il s'agit d'un site de type docusaurus ? (o = oui / n = non) : " TYPE_DOCUS
if [[ "$TYPE_DOCUS" == "o" ]]; then
    # Type docusaurus alors contentSelector à article
    CONTENT_SELECTOR="article"
else
    # Pas docusaurus alors on demande le selector
    read -p "Veuillez indiquer le contentSelector à cibler : " TARGET_SELECTOR
    if [[ "$TARGET_SELECTOR" != "" ]]; then
        CONTENT_SELECTOR="$TARGET_SELECTOR"
    else
        echo "❌ Le contentSelector ne peut pas être vide"
        exit 1
    fi
fi

# Demander si on veut une seule page ou toute la documentation
read -p "📄 Voulez-vous générer un PDF d'une seule page (1) ou de toute la documentation (2) ? " CHOIX

if [[ "$CHOIX" == "1" ]]; then
    # Demande du nom du fichier en pdf
    read -p "📄 Entrez le nom du fichier PDF (sans l'extension) : " PDF_NAME

    echo "📄 Génération du PDF pour la page $PAGE_URL..."
    npx docs-to-pdf docusaurus --initialDocURLs="$PAGE_URL" --contentSelector="$CONTENT_SELECTOR" --paginationSelector="non-existent-selector" --outputPDFFilename="$DIR_PATH/$PDF_NAME.pdf"
    echo "✅ PDF généré pour la page unique."
elif [[ "$CHOIX" == "2" ]]; then
    read -p "📂 Voulez-vous un seul PDF (1) ou un PDF par page (2) ? " SPLIT_CHOICE

    if [[ "$SPLIT_CHOICE" == "1" ]]; then
        echo "📕 Génération d'un PDF unique pour toute la documentation..."
        npx docs-to-pdf docusaurus --initialDocURLs="$PAGE_URL" --contentSelector="$CONTENT_SELECTOR" --paginationSelector="a.pagination-nav__link.pagination-nav__link--next"
        echo "✅ PDF unique généré."
    elif [[ "$SPLIT_CHOICE" == "2" ]]; then
        echo "📄 Génération de plusieurs PDFs, un par page..."
        npx docs-to-pdf docusaurus --initialDocURLs="$PAGE_URL" --contentSelector="$CONTENT_SELECTOR" --paginationSelector="a.pagination-nav__link.pagination-nav__link--next" --split
        echo "✅ PDFs séparés générés."
    else
        echo "❌ Option invalide."
        exit 1
    fi
else
    echo "❌ Option invalide."
    exit 1
fi