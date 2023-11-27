clc; clear;

% variable t for time (days)
t = 0:1:1500;

% Decay Rate
lambda = -0.0006371;

% Equation to model bone mineral density loss from spaceflight
BMD = ((-69) * exp(lambda * t) + 69) * -1;

% Plot for intial bone mineral density loss
plot(t, BMD)
title("Bone Mineral Density Loss From Spaceflight")
xlabel("Time (days)")
ylabel("Bone Mineral Density Change (%)")
grid on