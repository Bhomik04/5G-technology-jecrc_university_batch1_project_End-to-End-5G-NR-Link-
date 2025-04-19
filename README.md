# 5G-technology-jecrc_university_batch1_project_End-to-End 5G NR Link-Level Simulation with Adaptive Modulation


## 📌 Project Overview

This project implements a full end-to-end link-level simulator for 5G New Radio (NR) in MATLAB. It focuses on Adaptive Modulation and Coding (AMC) and uses LDPC coding for forward error correction. The system evaluates Bit Error Rate (BER) performance under various channel conditions such as Rayleigh, Rician, and mmWave fading.

## 🎯 Objectives

- Simulate OFDM-based transmission using QPSK, 16-QAM, 64-QAM, and 256-QAM.
- Implement LDPC channel coding and decoding using MATLAB 5G Toolbox.
- Adapt the modulation scheme based on the Signal-to-Noise Ratio (SNR).
- Analyze BER vs. SNR under Rayleigh, Rician, and mmWave channel models.

## 🛠️ How to Run

1. **Requirements:**
   - MATLAB R2020b or newer
   - 5G Toolbox (required for LDPC functions)
   - Communications Toolbox (for modulation/demodulation)

2. **Steps:**
   - Clone this repository.
   - Open `main.m` in MATLAB.
   - Run `main.m` to simulate and generate BER results and plots.

   ```matlab
   run('main.m')
   ```

3. **Outputs:**
   - BER performance plots saved in `results/figures/`
   - Simulation log data saved in `results/logs/`

## 📁 File Structure

```
📦5G_NR_Simulation
 ┣ 📂results
 ┃ ┣ 📂figures
 ┃ ┗ 📂logs
 ┣ 📜main.m
 ┣ 📜ldpc_encoder.m
 ┣ 📜ldpc_decoder.m
 ┣ 📜ofdm_modulator.m
 ┣ 📜ofdm_demodulator.m
 ┣ 📜channel_model.m
 ┣ 📜ber_simulation.m
 ┗ 📜README.md
```

## 📊 Simulation Features

| Feature                      | Status       |
|-----------------------------|--------------|
| OFDM Transmission           | ✅ Implemented |
| Adaptive Modulation         | ✅ Implemented |
| LDPC Coding & Decoding      | ✅ Implemented |
| Rayleigh & Rician Channels  | ✅ Implemented |
| mmWave Approximation        | ✅ Implemented |
| BER vs. SNR Analysis        | ✅ Implemented |

## 📄 Project Report

Please refer to the `5G_NR_LinkLevel_Project_Report.pdf` for a detailed explanation of methodology, simulation setup, results, and future enhancements.
