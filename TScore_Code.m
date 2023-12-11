clc; clear;

% Code used for calculating T Scores

% Asks the user what the BMD is pre-mission and the length of the mission
BMD_Pre = input('What is the pre-mission BMD of the astronaut? ');
time = input('What is the length of time in days of the mission? ');

% Calculate the BMD% loss
BMD_Percent_wo = ((-69) * exp(-0.0006371 * time) + 69);

% Calculate the BMD post-mission
BMD_Post_wo = BMD_Pre * (100 - BMD_Percent_wo)/100;

% Calculate the T Score
Tscore_wo = (BMD_Post_wo - 0.858) / 0.120;

% Results of T score without myeloma
% A T score between -1 and +1 is considered normal
if Tscore_wo > -1 && Tscore_wo <= 1
    fprintf('The T score without myeloma is %.2f and this is considered normal\n', Tscore_wo)
% A T score between −1 and −2.5 indicates osteopenia
elseif Tscore_wo <= -1 && Tscore_wo > -2.5
    fprintf('The T score without myeloma is %.2f and this indicates osteopenia\n', Tscore_wo)
% A T score less than -2.5 indicates osteoporosis
elseif Tscore_wo <= -2.5
    fprintf('The T score without myeloma is %.2f and this indicates osteoporosis\n', Tscore_wo)
end

% Results of T score with myeloma

% For a high proliferation rate of the cancer:
%OBa rate
y1_high = 5.618*10.^-10*time.^3 - 1.881*10.^-6*time.^2 + 0.002046*time + 0.9358;

%OCa rate 
y2_high = 3.412*10.^-10*time.^3 - 1.416*10^-06*time.^2 + 0.001951*time + 1.1097;

% We compute the bone volume percentage loss due to mm:
BVL_high = abs(-2*y1_high + 0.334*y2_high);

% Calculate the BMD% loss
BMD_Percent = ((-69) * exp(-0.0006371 * time .* BVL_high) + 69);

% Calculate the BMD post-mission
BMD_Post = BMD_Pre * (100 - BMD_Percent)/100;

% Calculate the T Score
Tscore = (BMD_Post - 0.858) / 0.120;


% A T score between -1 and +1 is considered normal
if Tscore > -1 && Tscore <= 1
    fprintf('The T score with highest myeloma proficiency rate is %.2f and this is considered normal', Tscore)
% A T score between −1 and −2.5 indicates osteopenia
elseif Tscore <= -1 && Tscore > -2.5
    fprintf('The T score with highest myeloma proficiency rate is %.2f and this indicates osteopenia', Tscore)
% A T score less than -2.5 indicates osteoporosis
elseif Tscore <= -2.5
    fprintf('The T score with highest myeloma proficiency rate is %.2f and this indicates osteoporosis', Tscore)
end
