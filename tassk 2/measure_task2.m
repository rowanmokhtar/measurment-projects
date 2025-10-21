
% ==============================
% Ultrasonic Sensor Calibration
% ==============================

clc; clear; close all;

data = readtable('task2_Measurements.csv', 'VariableNamingRule', 'preserve');


measured = data{:,2};  
actual = [5 10 15 20 25 30 35 40 45 50 55 60 65 70 75]; % cm


if length(measured) > length(actual)
    n = floor(length(measured) / length(actual));
    measured = mean(reshape(measured(1:n*length(actual)), n, []))';
end


p = polyfit(measured, actual, 1); 
a = p(1);
b = p(2);

fprintf('\nCorrection Equation: Actual = %.4f * Measured + %.4f\n', a, b);


corrected = a * measured + b;

figure;
plot(actual, measured, 'o-b', 'LineWidth', 1.5, 'MarkerFaceColor', 'b'); hold on;
plot(actual, actual, '--r', 'LineWidth', 1.5);
grid on;
xlabel('Actual Distance (cm)');
ylabel('Sensor Output (cm)');
title('Calibration Curve (Before Correction)');
legend('Sensor Data', 'Ideal Line y=x', 'Location', 'best');

figure;
plot(actual, corrected, 'o-g', 'LineWidth', 1.5, 'MarkerFaceColor', 'g'); hold on;
plot(actual, actual, '--r', 'LineWidth', 1.5);
grid on;
xlabel('Actual Distance (cm)');
ylabel('Corrected Distance (cm)');
title('Calibration Curve (After Correction)');
legend('Corrected Data', 'Ideal Line y=x', 'Location', 'best');


T = table(actual', measured, corrected, ...
    'VariableNames', {'Actual_cm', 'Measured_cm', 'Corrected_cm'});
disp(T);
