function tx = ofdm_modulator(bits, modScheme, params)
% Maps bits → symbols, IFFT, adds cyclic prefix

% 1) Determine M
if modScheme=="QPSK"
    M = 4;
else
    M = str2double(extractAfter(modScheme,"QAM"));
end
k = log2(M);

% 2) Bits → integers
ints = bi2de( reshape(bits, k, []).', 'left-msb' );

% 3) Modulate (unit power)
sym = qammod(ints, M, 'InputType','integer','UnitAveragePower',true);

% 4) Pad to integer number of OFDM symbols
Nfft = params.Nfft; Ncp = params.Ncp;
padLen = ceil(numel(sym)/Nfft)*Nfft - numel(sym);
sym = [sym; zeros(padLen,1)];

% 5) IFFT + CP
X   = reshape(sym, Nfft, []);
x   = ifft(X);
cp  = x(end-Ncp+1:end,:);
tx  = reshape([cp; x], [], 1);
end
