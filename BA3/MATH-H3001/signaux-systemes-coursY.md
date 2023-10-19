> cours 19/10/2023

**Rattraper cours Convolution ?!!!**

# Signaux systemes - Cours Y

-------------------

## Série de Fourier pour les signaux continus
### Motivation
$y(t) = H(i \omega)exp(i\omega t)$  
où $H(i \omega)= \int^\infty_{-\infty}h(\tau)exp(-i \omega \tau)d\tau$  

### Déf

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/fdd5ff43-8ffb-440f-a6a6-b3d02d9065dd)  

> exemple: onde carrée périodique slide annoté 9  

calcul des coefficients: slides annotés 10-12  

### Conditions de convergence

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/4ff4cf9e-b898-467c-8a6c-1f532214316e)  

Conditions de Dirichlet:  
![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/3e51ead5-fcbd-43f5-aba0-08db72cf42ad)  

# Transformation de Fourier pour les signaux continus
## Transformée de Fourier d'un signal continu non périodique

### Transformée de Fourier et transformée inverse

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/919e2658-0540-46be-bd04-29d9ce0b84a2)  

### Conditions de convergence

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/d707c72d-159e-4239-a40a-23e1e443375c)  
> $e_N(t)$ l'indice $N$ est un faute de frappe $\Rightarrow$ ignorer le $N$  

conditions de Dirichlet:  
![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/95239939-0c87-496b-b8fb-be94eef8d9ba)  

> exemple de Transfo slide annoté 14,15  

impulsion? delta de Dirac  $\delta(t)$:  
$X(i\omega)=\int^{+\infty}_{-\infty}\delta(t)e^{-i\omega t}dt=...=1$  

$\text{sinc}(x)=\frac{\sin(\pi x)}{\pi x}$  
![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/30f0d33d-22fd-4a93-b1a6-f92964a5d7ad)  

## Transformée de Fourier d'une fonction périodique continue

### Mise en garde

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/4de72484-2ee7-4235-bdb4-485e335c76c1)  

### Approche informelle
slide annoté 20  

> exemple slides annotés 21-23  

## Propriétés de la transformée de Fourier

### Notation

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/7f1b1216-72f7-4405-bc2c-e443b537b4f3)  

### Linéarité

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/a6e349fb-cda1-4fa6-a968-7463b8dd1664)  

### Propriétés de symétrie
slide annoté 27:  
![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/5717b4f1-f965-4aaf-b6a7-1ae175748724)  

28:  
![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/5aa952ef-dad8-45d3-aa0c-fd05e7643692)  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/9245f974-21c3-4584-8ebb-7cc94561e1a4)  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/47b2c74f-4991-4c7a-b6b6-5719e0aa9e1c)  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/e5d0d177-8067-47eb-8a42-3b2105a2262f)  

### Glissement dans le temps
"translation"  
![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/ac46556c-beef-4bc0-a68a-616e0db94b74)  

Glissement temporel subi par $x(t) \rightarrow$  
- Déphasage de $-\omega t_0$ dans la transfo de Fourier  
- Pas de changelent de module $|X(i\omega)|$

### Glissement en fréquence
"translation"  
![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/1d3378b9-b775-4e04-8d3e-6f03eeea0ccd)  

**Dualité entre glissement temporel et glissement fréquentiel**  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/e70174ee-f332-4b16-990e-bf9463076f91)  

### Changement d'échelle

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/ca650217-90e3-4dae-b9d8-0f3e19570423)  

> $\Rightarrow$ son: vitesse d'écoute plus grande = fréquence plus haute, note plus aigue (et inversément)  

### Transformée de Fourier de la dérivée d'une fonction

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/40b403cf-c82a-4626-a52a-51fccec6e291)  
**fort utile (résolutions équadif ou EDP)**  

### Dérivée de la transformée de Fourier
> duelle de la propriété précédente  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/1e4ec764-5d01-412d-8ae9-cc8a2f29f76a)  

 












