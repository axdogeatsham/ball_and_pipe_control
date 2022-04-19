function [A,B]=findab(pwm)
    syms s
    vBall = (6.3787*10^-4) * (pwm -2727.0447);
    top=-2.32625*(vBall-0.002204);
    bottom=s*((s-3649.9*(vBall-0.002204)));

    [symNum,symDen] = numden(top/bottom); %Get num and den of Symbolic TF
    TFnum = sym2poly(symNum);    %Convert Symbolic num to polynomial
    TFden = sym2poly(symDen);    %Convert Symbolic den to polynomial
    transferFunction =tf(TFnum,TFden);
    [A,B,C,D]=tf2ss(TFnum,TFden);
end