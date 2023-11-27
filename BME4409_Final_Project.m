clc; clear;

% variable t for time (days)
t = 0:1:1500;

% Decay Rate
lambda = -0.0006371;

% Equation to model bone mineral density loss from spaceflight
BMD = ((-69) * exp(lambda * t) + 69) * -1;

% Plot for intial bone mineral density loss
plot(t, BMD, 'r', 'LineWidth', 1.5)
hold on
% Addition of vertical line to indicate length of round trip mars mission
xline(1095, 'b')
text(1095, max(BMD), 'Day 1095', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left', 'Color', 'b');
title("BMD Percent Change From Microgravity Only")
xlabel("Time (days)")
ylabel("Bone Mineral Density Change (%)")
grid on
