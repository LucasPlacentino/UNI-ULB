# Instru ELEC-H314 - cours 6 19/20/2024

## 3.2 Parasites
### Compatibilité électromagnétique
#### exemple: alimentation à découpage
Campagne de tests: appareils testés en émissions et en immunité  
Dispositif de test en extérieur, en chambre de faraday  

Attention en extérieur, niveau de bruit de l'appareil de mesure (venant de rayonnement externe genre radio, TV, etc)  
=> Test avant et après la mise ne marche de l'appareil à mesurer.  

## 3.3 Câblage et connexions

### Référence d'un signal

"tension", masse  

1. impédance de masse  

2. plusieurs montages  

![alt text](image-26.png)  

### Terre = sécurité

si défaut dans l'appareil...  

### Montage "single-ended"

#### 1) cas idéal
![alt text](image-27.png)  
> système qui va en général donner de mauvais résultats  

![alt text](image-28.png)  

#### 2) cas réel
![alt text](image-29.png)  
> => situation dégueu  

![alt text](image-30.png)  

Qu'est-ce qu'on fait alors?
### Montage différentiel
#### Principe
![alt text](image-31.png)  

#### Mode commun et mode différentiel (déf)
![alt text](image-32.png)  

#### Cocnlusion: avantages et inconvénients
![alt text](image-33.png)  

#### Remarques
![alt text](image-34.png)  

### > Montage "single-ended"
#### montage single-ended + multiplexage
![alt text](image-35.png)  

### > Montage différentiel
#### montage différentiel + multiplexage
![alt text](image-36.png)  

### Symétrie des voies d'amenée

#### déséquilibre série
![alt text](image-37.png)  
> impédance d'entrée grande  

![alt text](image-38.png)  

#### déséquilibre parallèle
![alt text](image-39.png)  

![alt text](image-40.png)  

![alt text](image-41.png)  

#### déséquilibre parallèle: garde
![alt text](image-42.png)  
> diminue l'impédance d'entrée, que faire ? on ne relie alors pas le blindage à la masse mais à une tension donnée $\text{v}'_{\text{mc}}$: celle du mode commun. Donc on est virtuellement en circuit ouvert au niveau du blindage.  

### Montage différentiel avec $\text{v}_{\text{mc}}$ élevée ($\text{v}_{\text{mc}}$>>)
![alt text](image-43.png)  

#### Solution n°1
Limiter la tension de mode commun  
![alt text](image-44.png)  

#### "bias resistors" pour source flottante
![alt text](image-45.png)  

#### Solution n°2
"ampli d'isolation"  
![alt text](image-46.png)  

### Conclusion
![alt text](image-47.png)  

![alt text](image-48.png)  

