
% clc
% clear all
%%%%%%%%%%%Test of PMSG%%%%%%%%%%%%
% c=250e-9;
P1=20348.62314*.9;
P=20348.62314;
N=135;
f=16*N/(60);
wn=(2*pi*N/60);
w=f*(2*pi);
Tm=-P/(wn);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Windspeed=11;       % Units m/s
%%%%%%%%%%%% Voltage Source Parameters%%%%%%%%%%%%%%%%
f=40;
Vg=f*32*9*0.0341895;
%%%%%%%%%%%% Values for Stator %%%%%%%%%%%

RS=.51;
LS=12.8e-3;
%%%%%%%%%%%% Values for Passive Rectifier %%%%%%%%%%%%

Cs=Inf;                     %%% Snubber capacitance Cs (F)
Rs=1e6;                     %%% Snubber resistance Rs (Ohms)
Ron=1e-2;                   %%% Ron (Ohms) 
Vf=0.6;                     %%% Forward voltage Vf (V)
%%%%%%%%%%%% Values for Load Capacitor with losses %%%%%%%%%%%%

CL=.00084;                  %%% Capacitance on Load capacitor (F)
RCL=2200e-6;                %%% resistance of capacitor CL (Ohms)
%%%%%%%%%%%% Values for Capacitor with losses Before Rectifier%%%%%%%%%%%%

C=55e-6;                    %%% Capacitance on Load capacitor (F)  
R=0.001;                    %%% resistance of capacitor CL (Ohms)
%%%%%%%%%%%% Values for Load %%%%%%%%%%%%

RL=117.2980678;                      %%% RL (Ohms) 

% System frequency (Hz):
Fnom=60; 
% Specialized Power Systems sample time (s):
% Ts_Power=1/(33*Fnom)/100;

Ts_Power =20e-6;
% Inverter Control system sample time (s):
Ts_Control=10*Ts_Power; 
Ts = Ts_Power;      % Temp fix of SNL wind turbine block

% Import the data from Excel for a Cp lookup table
cp_data = xlsread('InfoRPMWind.xlsx','Sheet1');
% Row indices for lookup table
breakpoints1 = cp_data(2:end,1)';
% Column indices for lookup table
breakpoints2 = cp_data(1,2:end);
% Output values for lookup table
RPM_Wind_table_data = cp_data(2:end,2:end);
