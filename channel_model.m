function faded = channel_model(tx, chanType, params)
% Flat fading: Rayleigh, Rician, mmWave≈Rayleigh

N = numel(tx);
switch chanType
    case "Rayleigh"
        h = (randn(N,1)+1j*randn(N,1))/sqrt(2);
    case "Rician"
        K     = params.ricianK;
        sigma = sqrt(1/(2*(K+1)));
        h     = sqrt(K/(K+1)) + (randn(N,1)+1j*randn(N,1))*sigma;
    case "mmWave"
        h = (randn(N,1)+1j*randn(N,1))/sqrt(2);
end
faded = h .* tx;
end
