function llr = ofdm_demodulator(rx, modScheme, params)
% Removes CP, FFT, then soft‑demaps to LLRs

% 1) Remove CP & reshape
Nfft = params.Nfft; Ncp = params.Ncp;
rxMat  = reshape(rx, Nfft+Ncp, []);
rxNoCP = rxMat(Ncp+1:end, :);

% 2) FFT
Y = fft(rxNoCP);

% 3) Determine M
if modScheme=="QPSK"
    M = 4;
else
    M = str2double(extractAfter(modScheme,"QAM"));
end

% 4) Soft‑demap to LLR
llr = qamdemod(Y(:), M, 'OutputType','llr','UnitAveragePower',true);
end
