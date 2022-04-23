function [action] = set_pwm(device, pwm_value)
%% Sets the PWM of the fan
% Inputs:
%  ~ device: serialport object controlling the real world system
%  ~ pwm_value: A value from 0 to 4095 to set the pulse width modulation of
%  the actuator
% Outputs:
%  ~ action: the control action to change the PWM
%
% Created by:  Kyle Naddeo 1/3/2022
% Modified by: Conor Peterson, Sanjay Thallam and Mike Mulvihill

%% Force PWM value to be valid
% pwm_value = [0 4095] % Bound value to limits 0 to 4095

%% Send Command
bounded = max(min(pwm_value, 4095),0); %bound the pwm to the limits of the fan
pwm_value; %print pwm value (for debug)
bounded; %print bounded pwm value (for debug)
action = strcat("P", sprintf("%04.f",bounded(1))); % string value of pwm_value
write(device, action, "string"); %write the pwm to the fan
% use the serialport() command options to change the PWM value to action

end
