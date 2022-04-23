% A MATLAB script to convert the ball and pipe system transfer function to
% the A and B vectors neded for the LQR
% Created by Sanjay Thallam, Conor Peterson, Michael Mulvihill

function [A,B, C, D]=findab(pwm) %Declare the function, return the A, B, C, and D vectors for the system
    syms s
    vBall = (6.3787*10^-4) * (pwm - 2727.0447); %The ball velocity conversion 
    top=-2.32625*(vBall-0.002204); %Create the symbolic function for the numerator of the TF
    bottom=s*((s-3649.9*(vBall-0.002204))); %Create the symbolic function for the denominator of the TF

    [symNum,symDen] = numden(top/bottom); %Get num and den of Symbolic TF
    TFnum = sym2poly(symNum)    %Convert Symbolic num to polynomial
    TFden = sym2poly(symDen)    %Convert Symbolic den to polynomial
    transferFunction =tf(TFnum,TFden); %Create the transfer function
    [A,B,C,D]=tf2ss(TFnum,TFden); %return the ss representation for the transfer function
end
