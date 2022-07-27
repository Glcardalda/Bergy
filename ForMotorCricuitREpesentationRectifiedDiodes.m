
% clc
% clear all
%%%%%%%%%%%% Voltage Source Parameters%%%%%%%%%%%%%%%%
f=40;
Vg=f*32*9*0.0341895;
%%%%%%%%%%%% Values for Stator %%%%%%%%%%%

RS=.51;
LS=12.8e-3;

%%%%%%%%%%%% Values for Passive Rectifier %%%%%%%%%%%%

Cd=0;                       %%% Snubber capacitance Cs (F)
Rd=1e6;                     %%% Snubber resistance Rs (Ohms)
Ron=1e-2;                   %%% Ron (Ohms) 
Vf=0.6;                     %%% Forward voltage Vf (V)

%%%%%%%%%%%% Values for Load Capacitor with losses %%%%%%%%%%%%

CL=.00084;                  %%% Capacitance on Load capacitor (F)
RCL=2200e-6;                %%% resistance of capacitor CL (Ohms)

%%%%%%%%%%%% Values for Capacitor with losses Before Rectifier%%%%%%%%%%%%

C=55e-6;                    %%% Capacitance on Load capacitor (F)  
R=0.001;                    %%% resistance of capacitor CL (Ohms)

%%%%%%%%%%%% Values for Load %%%%%%%%%%%%

RL=20;                      %%% RL (Ohms) 


