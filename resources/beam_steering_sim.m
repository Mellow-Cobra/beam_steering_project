clc; clear; close all;

f = 5.8e9;
lambda = 3e8 / f;
k = 2*pi/lambda;
d = lambda/2;
N = 4;

theta = -90:0.1:90;
theta0_list = [-45 -30 -15 0 15 30 45];

figure; hold on;
for theta0 = theta0_list
    phi_n = -k * d * sind(theta0) * (0:N-1);
    AF = zeros(size(theta));

    for n = 1:N
        AF = AF + exp(1j * ((n-1)*k*d*sind(theta) + phi_n(n)));
    end
    

    AF_norm = abs(AF) ./ max(abs(AF));
    plot(theta, 20*log10(AF_norm));
end

xlabel('Angle (degrees)');
ylabel('Normalized Gain (dB)');
title('4-Element Array Beam Steering');
grid on;
legend('-45°','-30°','-15°','0°','15°','30°','45°');