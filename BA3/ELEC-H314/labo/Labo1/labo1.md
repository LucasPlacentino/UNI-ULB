# Labo 1 Instru

## Partie 1 - Simulation
### Ex 1 - signal sinusoidal

5. Rien change  

6. on perd de l'information numérique, car 8bit (2^8) et a un ADC de -5V à 5V, donc avec une entrée à 1mV on doit avoir une plus haute résolution ou mettre un ampli avant l'ADC.  

7. On peut changer la résolution? ou amplifier plus, mais le gain doit être limité pour pas saturer, sauf qu'on a que 2 échelons car on est autour de 4V. Ducoup on va rajouter une filtre pass-haut afin d'enelever l'offset (qui est un courant continu à 0Hz) et on garde notre singal à 50 Hz On set la fréquence de coupure entre 50Hz et 0Hz, attention à bien la choisir et selon l'ordre du filtre (1er, 2nd etc). Puis amplifier encore pour avoir un signal par exemple entre -4 et 4V puis ADC.  

8. On doit rajouter un fil. Ca varie un peu (de 1cm à 9999cm), on passe d'un SNR de 35dB à genre 23,8dB. Si on a un gain plus grand AVANT le cable, l'impact du bruit serait plus faible sur le signal. On veut toujours amplifier un maximum le plus tôt possible.  

9. Mettre un filtre passe-bas asssez proche de 50Hz mais pas trop proche sinon on coupe un peu notre signal, avant l'ADC.  

**Toujours amplifier le plus tôt possible**  

### Ex 2 - signal d'un EEG

$\frac{V}{0.05µV}$  
=> il faut 2000 échelons  
=> 2^11 = 2048 => ADC 11 bits (les réels sont à 12bits)  

Premier ampli à un gain de genre 49 pour pas saturer.  

On veut mettre un filtre passe-haut avec une fréquence de coupure la plus petite possible, genre entre 0 et 1Hz, on on prend un grand ordre pour avoir une pente raide. ça enlève le petit offset.  

Puis encore un ampli avec un gain à genre 1500 pour pas saturer.  
Puis un filtre passe-bas à coupure à par exemple 200Hz (trouvée via FFT au niveau de l'ampli juste avant, mais faut un compromis entre les fréquences du signal allant jusque peut etre 500Hz, et le bruit).  

Enfin le DAC à 11 bits avec sampling frequency à 1000Hz par exemple.  

#### Sélection composants tableau
calculs...  

- Ampli début => techniquement les 3 sont bons mais ça dépend de la fréquence qu'on veut, mais les 2 ou 3 sont quand même bien mieux....  
- Ampli fin => le 2 ou le 3...  
- ADC => CAN6 5kHz sampling, 12bits  
- Filtre PH => PH1 1Hz de coupure  
- Filtre PB => PB1 pour avoir fréq coupure à 500Hz  

#### Démonsration hardware

même chose que la simu ex2  

## Partie 2 - Dimensionnement analytique

> raccourci exam: page 8 pdf Intro_CalculBruit à droite le "Gagnez du temps!"  

Cahier des charges: voir pdf énoncé.  

On a 3 ampli pour l'maplification de tête,  
Et 3 ADC.  

Minimier $e_{wn}$ et $i_{wn}$  

### ADC:

AD7651, AD7788 ou MAX11100 ?  

- bruit: (il faudrait le faire à la fin, maison voit déjà le gain de 1200 demandé donc on peut déjà regarder) =>   
- résolution: faut 16bits => tous les 3 sont bons  
- $F_s$: faut 800 samples/s (donc min 1600Hz $F_s$)=> MAX11100 est bon  
- input range: minimum 4.8V (que ce soit de -2.4 à 2.4 ou de 0 à 4.8) => MAX11100 et AD7788 sont bons  

Seul le MAX11100 nous convient.  

### Ampli:
On vérifie notre modèle avec ce qui est donné dans les datasheets.  

total: 1200V/V  
CMMR: >80 dB  
Noise: <2 µV peak-to-peak referred to input

LT1167, LT1793 ou INA116 ?  
Attention le LT1793 est un ampli-op et pas un ampli d'instrumentation (différentiel), donc il viendra en deuxième ampli.  

Pour les datasheets, quand ça dépend du gain, on prend le gain proche du voulu qui donne les pires données.  

#### Premier ampli
Le gain du premier ampli est limité par l'offset: gain max est de 20 (offset max de +-250mV, donc gain max de 20) sinon on arrive à saturation 5V.  

Impédance à l'entrée de la chaine de $50k\Omega$.  

LT1167:  
- corner $f_c=9Hz$ à Gain de 10  
- densité bruit tension $e_n=\sqrt{e_{ni}^2+(e_{no}/G)^2}$ où on prend G=10 car bruit pire, $\Rightarrow$ ($e_{ni}=7.5$ et $e_{no}=67$) donc: $e_n=10.0568$ nV/sqrt{Hz}  
- densité bruit courant $i_n=124$ fA/sqrt{Hz}  
- CMMR: $\simeq$ 115dB (à un Gain de 10)  
- GBW:  

LT1793 (op-amp):  
- corner $f_c=30Hz$  
- densité bruit tension $e_n=6$ nV/sqrt{Hz} (à $f_0=1000Hz$, pour être dans le bruit blanc)  
- densité bruit courant $i_n=0.8$ fA/sqrt{Hz}  
- CMMR: $\simeq$ 100dB  
- GBW: 4.2 MHz ($f_0=100kHz$)  

INA116:  
- corner $f_c\simeq700Hz$ à un Gain de 10  
- densité bruit tension $e_n=28$ nV/sqrt{Hz}  
- densité bruit courant $i_n=0.1$ fA/sqrt{Hz}  
- CMMR: 92 (à Gain de 10)  
- GBW:  

Calculer la big formule, en utilsiant un gain de 10, pour chacun $\Rightarrow V_{RMS}$  
**Pas oublier de faire $V_{pp} = 6.6 * V_{RMS}$**  
$\Rightarrow V_{pp}$  

$I_{pp}$ ?  

Puis le faire pour un gain de 20.

#### Second ampli
> Second ampli, le CMMR on s'en fout, l'impédance d'entrée on s'en fout car c'est après un autre ampli dont on commande l'impédance de sortie. [?]  


On utile l'ampli-op LT1793?  
LT1793:  
$e_n=$ 2.4µV peak-to-peak c'est ok même si on veut 2µV car il vient après le premier ampli.  

faut calculer la big formule  

------------

**Voir corrigé sur l'UV**  

------------

> Conclusion, la méthode est toujours la même, c'est juste regarder un autre datasheet.  

**Exam**: tombe à 90% de chance, donc si on sait le faire, c'est gratuit.  

vraiment 1 formule à retenir:  
$$E_b^2=e_{wn}^2((f_{high}-f_{low})+f_{corner} ln(\frac{f_{high}}{f_{low}}))$$  

