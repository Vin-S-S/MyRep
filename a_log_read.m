%Read log and add to the TsAGI's m-data file
clear;
ARSP_Read();
ATSP_Read();
ATT_Read();
ATTC_Read();
Body_mm();
%ECU_Read();
%ESC_Read();
GPS_Read();
IMU_Read();
LPOS_Read();
LPSP_Read();
PARM_Read(); 
OUT_Read();
% ESC_Read();
%Fuel_Read();
%SRV_Read();
%Baro_Read();
SampleTime = ts;
params = fillPosEstimatorInavParams(Par);
if(exist('slBus1') ~= 0)
    clear('slBus1');
end
Simulink.Bus.createObject(params);
%%
ESC=xlsread2('LOG_ESC1_MSG.csv', -1);

ESC0=[ESC(:,1) ESC(:,4)];

U0=[ESC(:,1) ESC(:,2)];

VCS_Eps = 0.00001;