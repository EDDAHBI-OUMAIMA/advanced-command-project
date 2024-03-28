In order to be able to control our system (heat exchenger pilot), we need to model it first, and to do this we have established a thermal study (for the system temperatures) and another hydraulic (flow rate and position of the valves).

**🔑 Thermal study**
=====
Considering variable thermal regimes gives rise to two necessities, which are complementary: the correct evaluation of thermal performance, and the prediction of output parameters. Their control determines the energy efficiency and quality of the processes (in particular through control and regulation), and also sometimes the reliability of the systems (particularly with regard to thermal constraints). Let's start by expressing the total heat balance of the heat exchanger as a function of time, for any variable regime. If we neglect the dissipation function Φ, the local enthalpy balance is written for an isochoric fluid:

![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/2be4721a-ca26-4918-8166-231e255e7599)

We will obtain the overall balance by integrating this equation successively on the domains that make up our system.
By writing the heat balance between the two fluids, we get:

![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/912f050f-2128-4d46-8aa4-b20596b56203)

mc and mf: The respective total masses of hot and cold fluids in the exchanger (in KG)

Cp : heat mass of water at constant pressure in J/(Kg °C)

h : the overall exchange coefficient

S: section of the tubular heat exchanger

Qc : mass flow rate of hot water in Kg/s

Qf : mass flow rate of cold water in Kg/s

**🔑Hydraulic study**
=====

The valves used in this process are valves with positioners, so they can be modeled by the following 2nd order system:

![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/0f97d9fb-7f04-42d6-bd3a-30089a890ded)

Therefore:

![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/32c15c4d-705b-4d2b-aa58-0903b1cc5c22)

The flow of water in the exchanger is proportional to the condition of the valve:Xv

![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/008c2548-fb55-4044-9191-bbcdd8ed281b)

By combining the valve models and the heat exchanger model based on the energy balance, the overall process state model is obtained.
Considering this state representation of a nonlinear system:

![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/0af96f9b-6f85-46a1-849a-dee22d9933bc)

And laying down the state vector, the input vector, and the output vector like this:

![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/b8090153-c06c-4487-8ea8-a2f650a03a76)

 The status model found:

 ![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/d909fc42-cd80-4ed9-a75c-11a8cde51bd2)

 **Decoupling control of nonlinear system**
 ====
 The decoupling control of nonlinear systems, or the linearization and decoupling method of I/O, is one of the methods used to control nonlinear systems, in fact, it consists of providing desired outputs by manipulating the inputs ![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/d85af57a-eebb-4a40-b4fc-2a5ca451dad2)
i = the characteristic number of the output such that yi
![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/aff9a6a4-4c0f-4886-bb5d-fd04246283ce)

The principle of this command is to determine the corrector in such a way as to compensate for the nonlinear effects of the system.
The servo system then behaves like a transfer function system: ![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/2dc2c7eb-39bc-4a17-a5c9-d745511ab0d5)


To do this, we need to find the control law, such that it is influenced only by![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/4a87a0d0-2851-4272-a19f-f1cdba3205bb)

We know that, and deriving the output: 

![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/a44b0b01-5438-410f-be66-811399b1398d)

....
	We continue to drift until we find the order , where ![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/9b936d5c-8f40-43f4-97bd-9bae9ea71cd6)


In our case, the outlet is a 2x1 vector of the system temperatures (T2 hot water outlet and T4 cold water outlet).

![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/cf0fea14-f12e-45b2-9039-62cf96c057b0)

	
By deriving these outputs respectively from the order p1 and p2

![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/c1b05235-14b6-4d89-91d2-eacf60e25cbe)


To be able to control them independently through the manipulation of , it is necessary to:yiVi

![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/ac72f649-93f6-40f5-897a-6fef91eb9a5e)


Let's find ![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/d7e166cc-cff9-483a-8e83-3da52c72dc45)
 1 et ![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/ddc69b3c-1c47-4ce3-a01c-b92b4005f432)
 2 :
 
We drift until the command appears:y1 and y2
These include:  ![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/5ec80c45-ab98-4fe4-9a08-072329656886)


By identification:

![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/f37558b7-e4d4-43af-9846-2a805951288c)

![image](https://github.com/EDDAHBI-OUMAIMA/advanced-command-project/assets/147321335/ff7763f0-f9dd-44eb-a9b1-4e2467761286)


To be able to act directly on the output, we act on yi,Vi.
Vi= - Kizi+ Vic ; such that /( is stable.KiAi-BiKi)
Vic => z3i=0 =Vi=  - Kizci+ Vic  => Vic = Kizci
=>Vi= -  Kizi-zci
=>V= -K(z-zc)
With K = diag(K1,K2)
Once we find V1 et V2, we move on to the following coordinate change:
Diffeomorphism:
We have , so we are in the case of assured stability.1+ 2=6=le nombre des variables d'état
Change of contact information:
z=z1 z2 z3  ; zi=z1i z2i z3i =yi yi yi  
                    =>       z1i=z2izi=Aizi+BiVi
                     z2i=z3i                         yi= Cizi
                     z3i=Vi= yi(i)
With:;  and Ai=0 1 0 0 0 1 0 0 0  Bi=0 0 1 Ci=1 0 0 

Our system is made up of 2 subsystems:
A=   A1 0 0 A2 ;B=B1 0 0 B2 ;C= C1 0 0 C2 

So the state representation of the system (*) after transformation and decoupling:
=>     z=Az+BV
                        y=Cz


 






