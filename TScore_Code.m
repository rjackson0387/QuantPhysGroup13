clc; clear;

% Code used for calculating T Scores

% Asks the user what the BMD is pre-mission and the lenght of the mission
BMD_Pre = input('What is the pre-mission BMD of the astronaut? ');
time = input('What is the length of time in days of the mission? ');

% Calculate the BMD% loss
BMD_Percent = ((-69) * exp(-0.0006371 * time) + 69);

% Calculate the BMD post-mission
BMD_Post = BMD_Pre * (100 - BMD_Percent)/100;

% Calculate the T Score
Tscore = (BMD_Post - 0.858) / 0.120;

% Results of T score
% A T score between -1 and +1 is considered normal
if Tscore > -1 && Tscore <= 1
    fprintf('The T score is %.2f and this is considered normal', Tscore)
% A T score between −1 and −2.5 indicates osteopenia
elseif Tscore <= -1 && Tscore > -2.5
    fprintf('The T score is %.2f and this indicates osteopenia', Tscore)
% A T score less than -2.5 indicates osteoporosis
elseif Tscore <= -2.5
    fprintf('The T score is %.2f and this indicates osteoporosis', Tscore)
end

