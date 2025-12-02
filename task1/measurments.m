
[file, path] = uigetfile('*.csv', 'Select the readings CSV file');
data = readtable(fullfile(path, file), 'VariableNamingRule', 'preserve');


distance = data.("Distance (cm)");

 
mu = mean(distance);
sigma = std(distance);


figure;
histogram(distance, 'Normalization', 'pdf', 'FaceColor', [0.4 0.6 0.8], 'NumBins', 8);
hold on;


x = linspace(min(distance), max(distance), 100);
y = normpdf(x, mu, sigma);

plot(x, y, 'r-', 'LineWidth', 2);


xline(mu, 'k--', 'LineWidth', 1.5);


text(mu, max(y)*0.8, sprintf('Mean = %.2f\nStd = %.2f', mu, sigma), ...
    'Color', 'k', 'FontSize', 12, 'FontWeight', 'bold', 'BackgroundColor', 'w');


title('Histogram with Normal Distribution ');
xlabel('Distance (cm)');
ylabel('Probability Density');
legend('Data Histogram', 'Normal Distribution', 'Mean');
grid on;

