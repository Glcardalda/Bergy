
% clc
% clear all
%%%%%%%%%%%Test of PMSG and wn nominal calculation%%%%%%%%%%%%
% c=250e-9;
P1=20348.62314*.9;
P=15074.71602;
N=140;
f=16*N/(60);
wn=(2*pi*N/60);    %%%%%%%%%%Max wn
Tm=-P/(wn);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Windspeed=11;       % Units m/s
%%%%%%%%%%%% Voltage Source Parameters%%%%%%%%%%%%%%%%
% f=40;
% Vg=f*32*9*0.0341895;
%%%%%%%%%%%% Values for Stator %%%%%%%%%%%
RS=.51;
LS=12.8e-3;
%%%%%%%%%%%% Values for Passive Rectifier %%%%%%%%%%%%

Cs=Inf;                     %%% Snubber capacitance Cs (F)
Rs=1e6;                     %%% Snubber resistance Rs (Ohms)
Ron=1e-2;                   %%% Ron (Ohms) 
Vf=0.6;                     %%% Forward voltage Vf (V)
%%%%%%%%%%%% Values for Load Capacitor with losses %%%%%%%%%%%%

CL=2200e-6;                  %%% Capacitance on Load capacitor (F)
RCL=.00084;                %%% resistance of capacitor CL (Ohms)
%%%%%%%%%%%% Values for Capacitor with losses Before Rectifier%%%%%%%%%%%%

C=55e-6;                    %%% Capacitance on Load capacitor (F)  
R=0.001;                    %%% resistance of capacitor CL (Ohms)
%%%%%%%%%%%% Values for Load %%%%%%%%%%%%

RL=27.8;                      %%% RL (Ohms) 
%%%%%%%%%%%%%%%%%Time setting and some specs for discrite simulation from
%%%%%%%%%%%%%%%%%Autonomouse microgrid forecasting main

Ts_Power =20e-6;
Ts_Control=10*Ts_Power; 
Ts = Ts_Power;     

%%%%%%%%%%%%%%%%%CP calculations%%%%%%%%%%%%%%%%%%%%%%%%%
% Import the data from Excel for a Cp lookup table
cp_data = xlsread('InfoRPMWind.xlsx','Sheet1');
% Row indices for lookup table
breakpoints1 = cp_data(2:end,1)';
% Column indices for lookup table
breakpoints2 = cp_data(1,2:end);
% Output values for lookup table
RPM_Wind_table_data = cp_data(2:end,2:end);

%%%%%%%%%%%%%%%%%%%%Control Values
Pdesired=5000;      %P Reference for control PQ
Qdesired=300;       %Q reference for PQ
Kp=10;              %Protportional gain for current control
Ki=5;               %Integral gain for current control 
Kpdc=1;             %Protportional gain for Vdc control
Kidc=.5;            %Integral gain for Vdc control
Kpp=10;             %Protportional gain for real power control
Kip=5;              %Integral gain for real power control
Kpq=10;             %Protportional gain for reactive power control
Kiq=05;             %Integral gain for reactive power control
w=2*pi*60;          % for reactance calculation
Lline=1.0/(2*pi*60)*(115e3^2/2500e6);
Rline=.06;

%%%%%%%%%%%%%%%%%%APC Values 
f_setpoint=60;
protection=true;
mode=[2 2];
k=0.05;         %For voltage block case 1
db=.02;         %For voltage block case 1
VB9=525;
Voltage_setpoint=525;
