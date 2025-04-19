function berResults = ber_simulation(params)
% Loops over mod schemes & channel types and computes BER

for m = 1:numel(params.modSchemes)
    ms = params.modSchemes(m);
    for c = 1:numel(params.channelTypes)
        chan = params.channelTypes(c);
        berVec = zeros(size(params.SNR_dB));
        
        for i = 1:numel(params.SNR_dB)
            snr = params.SNR_dB(i);
            bits = randi([0 1], params.numBits, 1);
            
            % LDPC encode
            coded = ldpc_encoder(bits);
            
            % OFDM + mod
            tx = ofdm_modulator(coded, ms, params);
            
            % Channel + AWGN
            rx = channel_model(tx, chan, params);
            rx = awgn(rx, snr, 'measured');
            
            % OFDM demod → LLRs
            llr_full = ofdm_demodulator(rx, ms, params);
            llr      = llr_full(1:numel(coded));  % trim padding
            
            % LDPC decode
            decoded = ldpc_decoder(llr, params.numBits);
            
            % BER
            berVec(i) = mean(bits ~= decoded);
        end
        
        berResults.(ms).(chan) = berVec;
    end
end
end
