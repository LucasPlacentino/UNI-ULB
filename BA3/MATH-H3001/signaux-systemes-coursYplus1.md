> cours 24/10/2023

# Signaux systemes - cours Y+1

--------------
suite cours Y  

### Transformée de Fourier d'une convolution

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/f4fa839c-5634-4d57-b3d8-9734c978f79b)  

# **Peut tomber exam ^^^ ?**

> slide annoté 42  

### Transoformée de Fourier d'un produit

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/ae4b1aa7-c738-4087-b4ae-8b14a6f5b214)  

> démo slide annoté 44  
> illustration slides annotés 45-49  

### Relation de Parceval (ou Théorème de Prancherel)

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/fa3d38dd-d319-4658-806e-cc06bb9c334b)  


> démo slides annoté 51  

------------

comme un généralisation de la transfo de Fourier

# Transformée de Laplace

## Définition et région de convergence

### Définition

> chez anglosaxons: $p$ remplacé par $s$  
![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/575c7543-36e2-43ca-bf7a-5d4df2aeac53)  

Transfo de Laplace $\Rightarrow$ transfo de Fourier $x(t)e^{-\sigma t}$  

> exemples slides annotés  

### Convergence de la transformée de Laplace

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/7550a63e-3c27-4470-8e4e-7a2f95b19aff)  

### Transformée inverse

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/472d1b09-83b8-41f7-a0bc-e266a53b8256)  

- Transformée de Laplace inverse notée $x(t)=\mathcal{L}^{-1}(X(p))$  
- Région de convergence (RDC) : ensemble des valeurs de $\sigma$ pour lesquelles les intégrales convergent  
    $$\Rightarrow$$  
    RDC formée de bandes parallèles à l'axe imaginaire  
- Attention: ne pas confondre le rayon de convergence d'une série de Taylor  

### Détermination de la RDC

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/942571b5-b6a3-45e6-bfb5-a9eb3883359a)  

> illustration slide annoté 15  

> exemple fraction rationnelle slides annotés 16-18  

La partie réelle des pôles de la fraction rationnelle caractérise la RDC  
**Fonction causale**: fonction nulle pour $t<0$  
> \>< fonction anti-causale, $t>0$  

> slide annoté 19-20 laisser tomber  

## Propiétés de la transformée de Laplace

### Linéarité

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/c423a0b0-f4e5-4ccb-803f-dc086b3c948b)  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/e124b3b7-150e-459b-9bc3-6fe8af06f556)  

### Fonction complexe conjuguée

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/9a3c8609-9d3e-47e6-9db9-966e1e7785a0)  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/ac859461-c1c0-474d-9439-5772e833b319)  

### Glissement dans le temps

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/f5b23477-40ae-4c48-9d12-b79e40b35348)  

### Glissement en $p$

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/efab030b-682b-40b7-9153-c99ef2bc0e7b)  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/cec4e689-6d96-4c5b-8017-37b467de422d)  

### Changement d'échelle

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/e3dd264a-bb9e-4140-ad47-3c3493a54e81)  

### Transformée de Laplace de la dérivée d'une fonction

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/78765b6a-5651-48a6-af08-132f4c80a985)  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/a7f9bf27-adc3-4b2a-92e9-bb28bf9a38f6)  

### Dérivée de la transformée de Laplace

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/1ea38a90-e8d9-4ff5-9f4b-1b016fbe6058)  

### Transformée de Laplace d'une convolution

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/741deedf-8186-4923-bb6f-322f66ff3f6d)  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/eff2d263-50cd-4540-ac7c-384ac48bd88c)  
$S(p)$ et $Q(p)$ sont causales  
à droite du pôle: causal  
> à gauche du pôle: anti-causal  

### Intégration
dériver c'est multiplier par $p$, et intégrer c'est diviser par $p$  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/fe4ac793-5435-4bc0-aab4-5cf40bccfe1a)  



















