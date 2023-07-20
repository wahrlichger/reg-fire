
data = readtable('forestfires.csv'); 

data = rmmissing(data);


X = [ones(height(data),1), data.temp, data.RH, data.wind];  

beta = X \ data.area;  


fitted = X * beta;


residuals = data.area - fitted;


figure;
scatter(fitted, residuals, 'filled');
xlabel('Fitted values');
ylabel('Residuals');
title('Residuals vs Fitted');
grid on;


numericVars = varfun(@isnumeric, data, 'OutputFormat', 'uniform');
dataNumeric = data(:, numericVars);


corrMatrix = corr(dataNumeric{:,:}, 'Rows', 'complete');


figure;
imagesc(corrMatrix);
colorbar;
title('Correlation Matrix Heatmap');
xticks(1:width(dataNumeric));
xticklabels(dataNumeric.Properties.VariableNames);
yticks(1:width(dataNumeric));
yticklabels(dataNumeric.Properties.VariableNames);
