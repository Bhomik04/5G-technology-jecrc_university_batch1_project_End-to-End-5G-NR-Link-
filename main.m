% main.m
% 5G NR Link‑Level Simulation (AMC + LDPC)

clear; clc; close all;

%% Simulation Parameters
params.SNR_dB       = 0:2:20;                          % SNR sweep (dB)
params.modSchemes   = ["QPSK","QAM16","QAM64","QAM256"];% valid struct‐field names
params.numBits      = 8448;                           % single LDPC block size
params.channelTypes = ["Rayleigh","Rician","mmWave"];
params.ricianK      = 5;                              % Rician K‑factor
params.Nfft         = 1024;                           % OFDM FFT size
params.Ncp          = 72;                             % cyclic prefix length

%% Run BER Simulation
ber = ber_simulation(params);

%% Prepare output directories
if ~exist('results/figures','dir'), mkdir('results/figures'); end
if ~exist('results/logs','dir'),    mkdir('results/logs');    end

%% Plot & Save per channel
for c = 1:numel(params.channelTypes)
    chan = params.channelTypes(c);

    % 1) Plot
    figure; hold on;
    for m = 1:numel(params.modSchemes)
        ms = params.modSchemes(m);
        plot(params.SNR_dB, ber.(ms).(chan), '-o', 'LineWidth',1.5);
    end
    xlabel('SNR (dB)'); ylabel('BER'); grid on;
    title(sprintf('BER vs SNR (%s channel)', char(chan)));
    legend(params.modSchemes, 'Location','southwest');
    saveas(gcf, fullfile('results','figures', sprintf('BER_%s.png', char(chan))));

    % 2) Save CSV
    % Start with SNR column
    T = table(params.SNR_dB.', 'VariableNames', {'SNR_dB'});
    % Now add one column per modulation scheme
    for m = 1:numel(params.modSchemes)
        ms = params.modSchemes(m);
        % Field name must be a valid MATLAB identifier:
        colName = char(ms);
        T.(colName) = ber.(ms).(chan).';
    end
    % Write to file
    writetable(T, fullfile('results','logs', sprintf('BER_%s.csv', char(chan))));
end
