function decoded = ldpc_decoder(llr_vec, Kinfo)
% LDPC decode per BG1; llr_vec is [Ncw×1], Ncw=66*Zc

bgn     = 1;
maxIter = 25;

% Direct decode
decodedMat = nrLDPCDecode(llr_vec, bgn, maxIter);

% Flatten & trim to Kinfo
tmp     = decodedMat(:);
decoded = tmp(1:Kinfo);
end
