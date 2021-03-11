%% 
% 

spectra = importdata('spectra.csv');
starNames = importdata('star_names.csv');
lambdaStart = importdata('lambda_start.csv');
lambdaDelta = importdata('lambda_delta.csv');
nObs = size(spectra, 1); %число наблюдений
nStar = size(starNames, 1); %число звёзд
lambdaEnd = lambdaStart + (nObs - 1) * lambdaDelta;
lambda = (lambdaStart : lambdaDelta : lambdaEnd)';
[minIntensity, idx] = min(spectra); % minIntensity - массив мин интенсивностей, idx - массив их индексов
lambdaHa = lambda(idx); %массив длин волн с минимальной интенсивностью
lambdaPr = 656.28;
speedOfLight = 299792.458; % км/c
%% 
% 

z = (lambdaHa / lambdaPr) - 1;
speed = z * speedOfLight % красное смещение - для 4 5 6


%% 
% 


x = lambda;
a = spectra(:, 1);
b = spectra(:, 2);
c = spectra(:, 3);
d = spectra(:, 4);
e = spectra(:, 5);
f = spectra(:, 6);
g = spectra(:, 7);

fg1 = figure;

hold on;
for i = [a, b, c, d, e, f, g]
    if i == a | i == b | i == c | i == g
        plot(x, i,'--', 'LineWidth', 1 )
    else
        plot(x, i, "LineWidth", 3)
    end
end
set(fg1, 'Visible', 'on')
xlabel('Длина волны, нм')
ylabel(['Интенсивность, эрг/см^2/c/', char(197)])
title('Спектры звёзд')
legend('HD30584', 'HD10032', 'HD64191', 'HD5211', 'HD56030', 'HD94028', 'SAO102986')
text(640, 3.074e-13,'Белостоцкий Артемий Б04-006')
grid on
saveas(fg1, 'spectra.png')
movaway = starNames(speed>0);