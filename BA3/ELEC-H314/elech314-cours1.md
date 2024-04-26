# ELECH314 **Instru** - Cours 1

## Intro 1
slide 24: que la partie bleue pour nous (première partie d'instru)  

exam écrit  
cours fort pratique quand même, c'est possible que ça se reflète dans l'exam (sans doute pas 50/50 theorie-pratique)  

matière porte sur l'entièreté du cours (theorie, séance d'exo et labos)  
exams différents pour chaque section (et temps différents)  


## Intro 2

### Chaine d'acquisition

#### Transucteur
conversion grandeur à mesurer vers une grandeur électrique  
slide 14  
capteur  
différentes grandeurs  

#### Conditionneur
slide 18  
assure la conversion de la grandeur électrique de sortie du transducteur (brute) en une grandeur électrique exploitable par l'organe de traitement  

...

#### Multiplexage

...

#### Organe de traitement

...

Carte d'acquisition  

Logiciel  

chaine d'acquisition: variantes  
à considérer: budget délai, budget précision  

### Rappels d'électricité et d'électronique

#### impédances d'entrée et de sortie
équiv de Thevenin  

- commande en **tension**: imp d'entrée >> imp de sortie
- commande en **courant**: imp d'entrée << imp de sortie

#### Ampli-op
montage non-inverseur  
zéro virtuel  
rétroaction  

montage suiveur:  
cas particulier  

montage inverseur  
zéro virtuel  
rétraction  
! particularité $Z_{in}=R_1$ faible  

Ampli-op utilisé (avec rétroaction) pour adapt d'impédance, se retrouve dans de très nombreux conditionneurs. aussi amplificateur, convertisseur charge->tension ou courant->tension, etc.  

#### Semi-conducteurs
différentes opportunités:  
1. utilisés en tant que transducteurs
2. utilisées des effets propres à certains SC spécifiques
3. intégrer le capteur dans la même puce que le conditionnement
4. utiliser des techniques de fabrication microélectroniques faire des MEMS

## Chap2 - Propriétés génériques

### Capteur idéal (erreur nulle)
principe d'une mesure

loi du capteur  
2 propriétés fondamentales:  
- sensibilité élevée
- sensibilité constante (capteur linéaire)

### Capteur réel (erreur non-nulle)
cas réel principe d'une mesure

#### 1. Erreurs systématiques

erreur due à une connaissance erronée ou incomplète du capteur / systèlme de mesure  
origine interne au capteur / système de mesure  
erreur constante d'une mesure à l'autre  

exemples:...  

#### 2. Erreurs accidentelles (ou conditionnelles)
origine externe au capteur / système de mesure  
erreur variable d'une mesure à l'autre  

exemples:...  

#### 3. Erreurs stochastiques

erreur variable d'une mesure à l'autre (_variation aléatoire / statistique : dispersion_)  
origine interne au capteur / système de mesure  
typiquement dues aux bruits internes au processus  

#### précision, fidélité et justesse
**SLIDE 17**  

#### types d'erreurs systématiques

- linéarité et hystérèse  
slide 20  

- résolution  
slide 22  

- grandeurs d'influence et dérive  
slide 24  

#### domaine d'utilisation
**slide 26**  













