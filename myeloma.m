clc; clear;

% variable t for time (days)
t = 0:1:1500;

% Decay Rate
lambda = -0.0006371;

% Equation to model bone mineral density loss from spaceflight
BMD = ((-69) * exp(lambda * t) + 69) * -1;

% our formula for the rate of change of bone volume depending on myeloma is: BVC = -K1*OCa + K2*OBa (rate of formation minus rate of reapsortion)
% OCa = number of  active osteoclasts (time dependent)
% OBa = number of active osteoblasts (time dependent)
%we set a time range of 1 to 1600 days (4 years)
% K1 = Rate of reapsorption 
% K2 = Rate of formation 
% These rates change depending of how aggressive is the myeloma

% For a high proliferation rate of the cancer:
%OBa rate
y1_high = 5.618*10.^-10*t.^3 - 1.881*10.^-6*t.^2 + 0.002046*t + 0.9358;

%OCa rate 
y2_high = 3.412*10.^-10*t.^3 - 1.416*10^-06*t.^2 + 0.001951*t + 1.1097;

% We compute the bone volume percentage loss due to mm:
BVL_high = abs(-2*y1_high + 0.334*y2_high);

% For second highest proliferation rate of the cancer:
%OBa rate
y1_2high = 

%OCa rate
y2_2high = 

% We compute the bone volume percentage loss due to mm:
BVL_2high = abs(-2*y1_2high + 0.334*y2_2high);

% For the second lowest proliferation rate of the cancer:
%OBa rate
y1_2low = 

%OCa rate
y2_2low = 

% We compute the bone volume percentage loss due to mm:
BVL_2low = abs(-2*y1_2low + 0.334*y2_2low);

% For the  lowest proliferation rate of the cancer:
%OBa rate
y1_low = 

%OCa rate
y2_low = 

% We compute the bone volume percentage loss due to mm:
BVL_low = abs(-2*y1_low + 0.334*y2_low);

% integration of BMD loss with BV loss due to multiple myeloma:
TotalBMD = (((-69) * exp(lambda * t .* BVL_high) + 69) * -1 );

% Plot for intial bone mineral density loss
figure
plot(t, BMD, 'r', 'LineWidth', 1.5)
grid on
hold on

% Addition of vertical line to indicate length of round trip mars mission
xline(1095, 'b')
text(1095, max(BMD), 'Day 1095', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left', 'Color', 'b');

plot(t,TotalBMD);
title('BMD% change with both conditions integrated')
xlabel("Time (days)")
ylabel("Bone Mineral Density Change (%)")