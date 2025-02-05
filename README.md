# md_docs_to_pdf

Cet outil permet de convertir des fichiers markdown en pdf.
\
L'outil se base sur [docs-to-pdf](https://github.com/jean-humann/docs-to-pdf) pour la conversion des fichiers markdown en pdf.

## Installation
La première étape est de cloner le dépôt git de l'outil.
```bash
git clone git@github.com:MrTommy15/md_docs_to_pdf.git
```

Ensuite, vous allez devoir rendre exécutable les fichiers bash.
```bash
chmod +x generate_pdf.sh install_mdpdf.sh
```

Pour finir, vous allez devoir lancer le fichier ****install_mdpdf.sh**** pour installer les dépendances nécessaires.
```bash
source install_mdpdf.sh
```
Laissez-vous guider par le script d'installation.

## Utilisation
Pour utiliser le script de conversion, vous allez devoir lancer le fichier ****generate_pdf.sh**** :
```bash
./generate_pdf.sh
```

## Informations
L'outil est de base conçu pour fonctionner avec Docusaurus.\
Cependant vous avez le possibilité d'indiquer à l'outil qu'il s'agit d'un site autre que Docusaurus, alors il vous sera demandé de choisir un **contentSelector** qui va être la cible de l'export en PDF.
\
**Le _contentSelector_ doit être une balise html !**
\
Par exemple lorsqu'il s'agit d'un site type docusaurus le **contentSelector** est à **"article"**.

Vous avez la possibilité de choisir le nom du fichier de sortie, veuillez ne pas mettre l'extension lors de la saisie du nom !

## Problèmes
Il arrive que la variable d'environnement ne soit plus existante après un redémarrage de session et/ou de Terminal.
\
Lorsque ça arrive l'outil vous indiquera de définir de nouveau la variable en lançant la commande ci-dessous :
```bash
source install_mdpdf.sh
```
_Lorsque vous avez des problèmes de packages, n'hésitez pas à relancer une installation complète de l'outil, l'installation ne supprimera en aucun cas les sorties PDF déjà existantes !_

**_Version : 1.1_**