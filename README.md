In order to be able to control our system, we need to model it first, and to do this we have established a thermal study (for the system temperatures) and another hydraulic (flow rate and position of the valves).

**Thermal study**
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

**Hydraulic study**
=====

The valves used in this process are valves with positioners, so they can be modeled by the following 2nd order system:
