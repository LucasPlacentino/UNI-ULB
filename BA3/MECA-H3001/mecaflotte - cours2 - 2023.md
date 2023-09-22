# Mecaflotte cours 2 - 22/09/2023

----------------
> suite cours 1  

seperation surface

normal compoenent is called pressure, $p$  
tangential is shear stress (contrainte de cisaillement) $\tau$  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/6826a127-aeb4-4df4-bb50-15b864579473)  

pressure is a scalar  

$p_{up}=p_{down}$  
at rest: no shear stress ($\tau_{up}=\tau_{down}=0$) (sliding of the fluid layers)  

### Shear stress and momentum flux

Shear stress is associated to the fluid internal friction  
-> Two adjacent fluid layers, ($v_A>v_B$) the faster layer accelerates the slower the faster layer (or the other way around) until they have the same velocity -> cancel out the velocity difference. Shear stress in the direction of motion.  
An external force is needed to keep the velocity difference  
MAcroscopically, molecular friction results a net **momentum flux** ($J_Q$ below) (force per unit area=shear stress), perpendicular to the motion:  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/f67ae588-ea2d-447e-bc69-67d2e04b6f3b)  

##### The velocity gradient induces a flux of momentum (to get equilibrium between the two layers), produces a shear stress that is a loss of energy.

### Relation between shear stress and momentum flux

- volumetric forces negligible  
- pressure is direction independent  
- identical shear stress  
- identical momentum fluxes on the vertical faces  

**Moment of forces**: $J_Q = \tau$  

$J_{Q_y} \propto - \frac{dv(y)}{dy}$

### Convection and diffusion

- convection: "transfer with flow", trasnfer associated to the bulk fluid motion  
- diffusion: "you can have transport without any flow", transfer associated to the particle randow walk  

#### Convection

convective flxu of momentum, energy and mass:  
- fluid with uniform velocity $v$  
- cylinder of section S and length $v \Delta t$  

$flux_A=\frac{A}{S\Delta t}$  

||Mass|Momentum|Energy|
|-|-|-|-|
||$M_c=\rho vS\Delta t$|$Q_c=\rho v^2S\Delta t$|$E_c=\rho c_v v (T-T_0)S\Delta t$|
|Flux|$J_{M_c}=\frac{M_c}{S\Delta t}=\rho v$|$J_{Q_c}=\frac{Q_c}{S\Delta t}=\rho v^2$|$J_{E_c}=\frac{E_c}{S\Delta t}=\rho c_v v(T-T_0)$|

> $Q$: momentum

#### Diffusion

two parallel fluid layers with bulk velocities $v_A>v_B$  

- diffusion of the particle towards the other region of slower particles, due to the velocity gradient, transferring a momentum flux $J_Q$  
- the friction between the layers is the origin of the net momentum flux $J_Q$ int the dir transversal to the flow  

### Momentum diffusion flux
#### The Newton law

Shear stress:  

- friciton force -> momentum flux $J_Q$ in dir transversal to flow  
- shear stress propotional to the velocity gradient  
$\tau \equiv\tau(\frac{dv}{dy})$ &mdash; Rheology=relation bewteen the shear stress and velocity gradient  
> [$\tau$] force per unit of area: pressure  
> always check the units  
- Newtonian fluids  
$\tau = \mu (\frac{dv}{dy})$ &mdash; gas, liquids, diluted polymer solutions  
    - µ, dynamic viscosity, **instrinsic resistance** of fluid to motion [kg $m^{-1}s^{-1}$]  
    - dv/dy, velocity gradient [$s^{-1}$]  
    - $\tau$ force per unit area 

### Planar Couette flow

> _slide 50_  

> plate moving continuously  

plate of infinite length, so no border effect  
we forget the transient  

Empirical observations:  
- No slip condition at walls; $u(0)=0$ and $u(l)=V$  

Laminar flow: flow organised in parallel layers:  
- the velocity profile is a sole function of y  

The drag force (shear stress x area) is imposed:
- $\tau = \frac{F}{A}=\mu \frac{du}{dy}=c$  

The velocity profile is:  
- $u(y)=V.\frac{y}{l}$  

|Qualitative behavior|Equation|Fluids|
|-|-|-|
|Netwonian, linear (factor µ)|$\tau=\mu(\frac{dv}{dy})$|gas, liquids, diluted polymers solutions|
|_(pseudo-plastic and dilatant)_|(...^n)|(n>1: solutions with suspended starch or sand, 0<n<1: panits polyler solutions, fluids with suspended particles)|
|_(Bringham fluids)_|(... has a threshold $\tau_0$)|(paints, toothpaste, chocolate, margarine, suspensions of clay)|
> _slide 52_  
> we only study **Newtonian fluids**, first line of the table above  

### Constitutive relations
> _slide 56_  

- Momentum diffusion flux (Newton's law)  
    $J_{Qd}=$...  
    kinematic viscosity: $v=\frac{\mu}{\rho}$  
    $\Rightarrow$ $J_Q=-v\frac{d(\rho v)}{dy}$...
- Energy diffusive flux (Fourier's law)  
    $J_{Ed}=$...  
    thermal diffusivity: $\alpha=\frac{k}{\rho c_v}$  
    internal energy: $u=c_v(T-T_0)$  
    $\Rightarrow$ $J_{Ed}=-\alpha\frac{d(\rho u)}{dy}$...
- Mass diffusion flux (Fick's law)  
    $J_{Md}=-D\frac{dc}{dy}$...  

> momentum, energy and mass diffusivities $v, \alpha, D= [L^2T^{-1}]$
> so that all the diffusion coefficients have the same units

### Gas viscosity

_big slide (57)_
> _on the UV, video step by step with proof_

Gas: temp increase $\Rightarrow$ viscosity inscreases (because higher possible shear stress caused by the possibility of colisions caused by higher kinetic energy)  
> Liquids: temp increase $\Rightarrow$ viscosity decreases  

$\Rightarrow$  **Sutherland law** (**gases**, for liquids: Touloukian law)  
$\mu \propto \sqrt{T}$  
> Absolute viscosity $\mu$ ($[\mu] : N.s/m^2$)  

Viscosity measurements using viscometers:  
Stationary cylinder inside which is a shaft and the liquid "lubricates" the shaft, used to measure the viscosity of the liquid by the torque of the shaft (_slide 59_)  

### Thermal conductivity
(_big slide 60_)  

### Mass diffusivity

(_big slide (60)_)  
// gas diffusivity  

### Relation between the diffusion coefficients

**voir photo 22/09/2023**

$\frac{\alpha}{v}=...=1$  

=1 means the diffusion process of heat and momentum happens at the same speed.  

\> 1 means faster  

$\frac{D}{v}=...=1$

### Diffusion and randow walk

_slide 65_  

normal walk: there would be a preferential direction of motion, NOT in random walk  

like a drunk person, random walk, no preferential direction of motion  

> (the probability of being at the start is maximum/highest)

$<R^2>=...=Nl^2$  
> $N$ : steps  
> $l$ : size of a step  

relation between displacment and time  

**Diffusion** is an **inefficient** transport mechanism, $L^2\propto t$  
> $L$: distance  





