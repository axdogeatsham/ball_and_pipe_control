function [distance,pwm,target,deadpan] = read_data(device)
%% Reads data sent back from Ball and Pipe system
% Inputs:
%  ~ device: serialport object controlling the real world system
% Outputs:
%  ~ distance: the IR reading from the time of flight sensor
%  ~ pwm: the PWM from the manual knob of the system (NOT THE SAME AS THE
%  PWM YOU MAY SET THROUGH SERIAL COMMUNICATION)
%  ~ target: the desired height of the ball set by the manual knob of the
%  system
%  ~ deadpan: the time delay after an action set by the manual knob of the
%  system
%
% Created by:  Kyle Naddeo 1/3/2022
% Modified by: Sanjay Thallam, Mike Mulvihill and Conor Peterson and 2/8/2022

%% Ask nicely for data
% use the serialport() command options to write the correct letter to the
% system (Hint: the letters are in the spec sheet)
write(device,"F","string"); %disable the fan speed control from the potentiomenter
%write(device,"P0000","string")
write(device,"S","string"); %read the current data from the ball pipe system
device.NumBytesAvailable; %check if there is valid data

%% Read data
% use the serialport() command options to read the response

data = read(device, 20, "string"); %read the 20 chars from the system (from the datasheet)

%% Translate
% translate the response to 4 doubles using str2double() and
% extractBetween() (Hint: the response is in the spec sheet)

distance = str2double(extractBetween(data,2,5)); %extract the distance measurement
pwm = str2double(extractBetween(data,7,10)); %extract the pwm measurement
target = str2double(extractBetween(data,12,15)); %extract the target measurement
deadpan = str2double(extractBetween(data,17,20)); %extract the deadpan measurement
end
