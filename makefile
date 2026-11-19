.PHONY: all clean

all:
	@echo "# Projet : Jeu de devinette (Guessing Game)" > README.md
	@echo "" >> README.md
	@echo "- **Date et heure d'exécution de make :** $$(date '+%d/%m/%Y %H:%M:%S')" >> README.md
	@echo "- **Nombre de lignes de code dans guessinggame.sh :** $$(wc -l < guessinggame.sh | tr -d ' ')" >> README.md

clean:
	rm -f README.md
