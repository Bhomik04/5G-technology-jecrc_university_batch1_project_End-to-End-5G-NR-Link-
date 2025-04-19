function coded = ldpc_encoder(info)
% Single‑block LDPC encode (BG1)
bgn        = 1;
encodedMat = nrLDPCEncode(info, bgn);
coded      = encodedMat(:);
end
