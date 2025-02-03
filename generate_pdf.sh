#!/bin/bash

echo "🚀 Génération de PDF depuis une documentation Docusaurus"

# Demander l'URL de base
read -p "👉 Entrez l'URL de base de votre documentation (ex: http://localhost:3000/docs/): " PAGE_URL

# Vérifier si l'URL est vide
if [[ -z "$PAGE_URL" ]]; then
    echo "❌ L'URL ne peut pas être vide."
    exit 1
fi

# Demander si on veut une seule page ou toute la documentation
read -p "📄 Voulez-vous générer un PDF d'une seule page (1) ou de toute la documentation (2) ? " CHOIX

if [[ "$CHOIX" == "1" ]]; then
    echo "📄 Génération du PDF pour la page $PAGE_URL..."
    npx docs-to-pdf docusaurus --initialDocURLs="$PAGE_URL" --contentSelector="article" --paginationSelector="non-existent-selector"
    echo "✅ PDF généré pour la page unique."
elif [[ "$CHOIX" == "2" ]]; then
    read -p "📂 Voulez-vous un seul PDF (1) ou un PDF par page (2) ? " SPLIT_CHOICE

    if [[ "$SPLIT_CHOICE" == "1" ]]; then
        echo "📕 Génération d'un PDF unique pour toute la documentation..."
        npx docs-to-pdf docusaurus --initialDocURLs="$PAGE_URL" --contentSelector="article" --paginationSelector="a.pagination-nav__link.pagination-nav__link--next"
        echo "✅ PDF unique généré."
    elif [[ "$SPLIT_CHOICE" == "2" ]]; then
        echo "📄 Génération de plusieurs PDFs, un par page..."
        npx docs-to-pdf docusaurus --initialDocURLs="$PAGE_URL" --contentSelector="article" --paginationSelector="a.pagination-nav__link.pagination-nav__link--next" --split
        echo "✅ PDFs séparés générés."
    else
        echo "❌ Option invalide."
        exit 1
    fi
else
    echo "❌ Option invalide."
    exit 1
fi