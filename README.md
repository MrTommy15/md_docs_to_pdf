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
Il s'agit d'une première version de l'outil, il est possible que des bugs soient présents.

Dans les prochaines semaines, je vais ajouter des fonctionnalités supplémentaires à l'outil.

L'outil se base sur des balises HTML pour récupérer les éléments à convertir en pdf.\
Pour l'instant l'outil ne fonctionne qu'avec **Docusaurus**.

La prochaine étape est de vous permettre de customiser les balises HTML à cibler.