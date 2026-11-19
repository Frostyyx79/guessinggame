#!/bin/bash
# guessinggame.sh - Devinez le nombre de fichiers du répertoire actuel

# Retourne le nombre de fichiers (non cachés) du répertoire actuel
count_files() {
  find . -maxdepth 1 -type f ! -name '.*' | wc -l | tr -d ' '
}

# Vérifie que la saisie est un entier positif
is_number() {
  [[ "$1" =~ ^[0-9]+$ ]]
}

nb_files=$(count_files)
guess=-1

echo "Bienvenue dans le jeu de devinette !"
echo "Combien de fichiers y a-t-il dans le répertoire actuel ?"

while [[ $guess -ne $nb_files ]]
do
  read -p "Entrez votre estimation : " guess || exit 1

  if ! is_number "$guess"
  then
    echo "Veuillez entrer un nombre entier positif."
    guess=-1
    continue
  fi

  guess=$((10#$guess))

  if [[ $guess -lt $nb_files ]]
  then
    echo "Trop bas ! Essayez encore."
  elif [[ $guess -gt $nb_files ]]
  then
    echo "Trop haut ! Essayez encore."
  else
    echo "Félicitations ! Il y a bien $nb_files fichiers dans ce répertoire."
  fi
done
