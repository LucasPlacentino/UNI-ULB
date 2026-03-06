% Lab 1:
% Generating excitation signals
% 2026-03-06

% we'll generate multisine and random nois signals (for excitation signals
% for dynamic systems in next labs)

clear all; clc; close all;

%% 1.1 Discrete Fourier Transform (DFT)
% freq axis k is expressed in bin

% at bin k, the complex exp e^((j*2*pi*k*n)/N) is periodic in n, and has a
% perid which fits exactly k times in the time interval of N points.

% DFT: X_k = fft(x_n)

% IDFT: x_n = ifft(X_k)

% Tasks
% => SEE HANDWRITTEN NOTES

%% 1.2 DTF of a (co)sine

%% Task 1.2.1 DTF of 3 periods of a cosine
% Generate a cosine sequence with a randomly selected phase, and with a
% period that fits exactly 3 times in a data sequence of N = 1000 samples.

N = 1000;                 % Number of samples
k = -N/2:N/2-1;           % frequency bin axis for plotting (shifted)

n = 0:N-1;                % time/sample indices
freq = 3 / N;             % normalized frequency (cycles per sample)
phase = rand() * 2 * pi;  % random phase in radians

% Generate cosine signal
cosineSignal = cos(2 * pi * freq * n + phase);

figure;
plot(n, cosineSignal);
title("cosine signal")
xlabel('n (samples)'); ylabel('Amplitude');
xlim([0 N-1]);

% Compute DFT
% ATTENTION: need to to fftshift(fft(...)) !
X_k = fftshift(fft(cosineSignal));        % shifted DFT
amplitude = abs(X_k);                     % amplitude spectrum
phaseSpectrum = angle(X_k);               % phase spectrum
% phaseSpectrum = round(angle(X_k));               % phase spectrum

% figure;
% stem(k,X_k)
% title("DFT of cosine signal")
% xlabel('k (bins)');
% hold on;

figure;
subplot(2, 1, 1);
stem(k,amplitude)
title("dft amplitude")
xlabel('k (bins)'); ylabel('Amplitude');
grid on;
subplot(2, 1, 2);
stem(k,phaseSpectrum)
title("dft phase");
xlabel('k (bins)'); ylabel('Phase');
grid on;
hold on;

% Task 1.2.2 Perfet reconstruction
% From the DFT plot, check that the condition for perfect reconstruction 
% is satisfied. Is there any leakage visible?

% check the plot of the dft above

% => .....

% omega_k = 2*pi*k/(N*Ts)
% t = nT

% => omega_k*t = 2*pi*k*n/N

% ???

% Task 1.2.3 Interpretation of the frequency axis
% At which indices of the DFT do you obtain non-zero values? Explain. 
% (Keep in mind that Matlab indices start at 1.)

% => :

% Find bins where amplitude is (significantly) non-zero
tol = max(amplitude) * 1e-6;               % numerical tolerance
nonzero_bins = find(amplitude > tol);      % indices in the shifted DFT (1..N)

% Convert shifted-bin indices to bin numbers k (we previously defined k = -N/2:N/2-1)
% Note: length(k) == N and corresponds to indices 1..N of X_k
nonzero_k = k(nonzero_bins);               % bin numbers (can be negative)

% Display results
fprintf('Non-zero DFT bins (shifted indices -> bin k):\n');
for i = 1:length(nonzero_bins)
    fprintf('  index %3d -> k = %3d, amplitude = %.4g\n', nonzero_bins(i), nonzero_k(i), amplitude(nonzero_bins(i)));
end

% Explanation from copilot:
% The cosine has frequency 3 cycles over N samples, so its DFT has two non-zero
% components at +/-k0 where k0 = 3. After fftshift, these appear at the entries
% corresponding to k = +3 and k = -3. Matlab indices start at 1, so the positions
% in the shifted array are nonzero_bins as printed above.

%% Task 1.2.4 Frequency axis in bins
% Construct the frequency axis for the plots, expressed in bins

% => already did in 1.2.1 => k :
k = -N/2:N/2-1; % frequency bin axis for plotting (shifted)

%% Task 1.2.5 Frequency axis in Hertz
% Consider that the sample frequency is f_s = 100 Hz. Construct the 
% frequency axis for the plots, expressed in Hz. (Hint: use the results 
% from Task 1.1.1.)

% => :
fs = 100;
Ts = 1/fs;
% task 1.1.1: omega_k = 2*pi*k/T where T=N*Ts :
omega_k = 2*pi*k/(N*Ts);

figure;
subplot(2, 1, 1);
stem(omega_k,amplitude)
title("dft amplitude")
xlabel('\omega_k'); ylabel('Amplitude');
grid on;
subplot(2, 1, 2);
stem(omega_k,phaseSpectrum)
title("dft phase");
xlabel('\omega_k'); ylabel('Phase');
grid on;
hold on;

t = (0:N-1) * Ts; % Time vector in seconds
figure;
plot(t,cosineSignal)
title("Cosine signal")
xlabel("t (s)"); ylabel("Amplitude");
hold on;


%% 1.3 Time domain construction of a multisine

% see pdf for mathematical definition

% The frequencies ω_k for which the amplitudes A_k are non-zero are called 
% the excited frequencies.

%% Task 1.3.1 Time domain random phase multisine
% Generate a multisine in the time domain, by implementing (1.6), with 
% N = 1000 samples and K = 10 excited frequencies. Set the amplitudes 
% A_k = 1, and choose the phases φ_k randomly between 0 and 2π 
% (i.e. a random phase multisine). Check that this multisine satisfies the 
% condition for perfect reconstruction by plotting its DFT. Include the 
% frequency axis, expressed in bin.

% => :

N = 1000;
n = 0:N-1;
K = 10;                          % number of excited harmonics
A_k = ones(1, K);                % amplitudes (1 x K)
k_idx = 1:K;           % excited bin indices (1..K)
% or
k_idx = rand(1,K);     % excited bin (10 random, uniform distribution, 1xK)
phi_k = rand(1, K) * 2*pi;       % random phases (1 x K)

% Build multisine: sum over k of A_k * cos(2*pi*(k_idx/N).*n + phi_k)
multisine_matrix = A_k.' .* cos((2*pi*k_idx.' * n)/N + phi_k.'); % (K x N)
multisine_signal = sum(multisine_matrix, 1);                     % 1 x N

figure;
plot(n, multisine_signal);
title("Multisine signal (random phases)");
xlabel('n (samples)'); ylabel('Amplitude');
xlim([0 N-1]);

% Compute and plot shifted DFT with frequency axis in bins
X_k_ms = fftshift(fft(multisine_signal));
k = -N/2:N/2-1;
amplitude_ms = abs(X_k_ms);
phase_ms = angle(X_k_ms);
% phase_ms = round(angle(X_k_ms));

figure;
subplot(2,1,1);
stem(k, amplitude_ms, '.');
title("DFT amplitude of multisine");
xlabel('k (bins)'); ylabel('Amplitude');
grid on;
subplot(2,1,2);
stem(k, phase_ms, '.');
title("DFT phase of multisine");
xlabel('k (bins)'); ylabel('Phase');
grid on;
hold on;

% % Check for expected non-zero bins (should be at +/-k_idx)
% tol = max(amplitude_ms) * 1e-6;
% nonzero_bins = find(amplitude_ms > tol);
% nonzero_k = k(nonzero_bins);
% fprintf('Non-zero DFT bins (shifted indices -> k):\n');
% for i = 1:length(nonzero_bins)
%     fprintf('  index %3d -> k = %3d, amplitude = %.4g\n', nonzero_bins(i), nonzero_k(i), amplitude_ms(nonzero_bins(i)));
% end

%% Task 1.3.2 Frequency exis in Hz
% For the multisine generated in Task 1.3.1, consider that the sampling 
% frequency is fs = 100 Hz. Include the frequency axis expressed in Hz in 
% the DFT plot, and the time axis expressed in seconds in the time domain 
% plot.

% => :
fs = 100;
Ts = 1/fs;
omega_k = 2*pi*k/(N*Ts); % from task 1.1.1

figure;
subplot(2,1,1);
stem(omega_k, amplitude_ms, '.');
title("DFT amplitude of multisine");
xlabel('\omega_k'); ylabel('Amplitude');
grid on;
subplot(2,1,2);
stem(omega_k, phase_ms, '.');
title("DFT phase of multisine");
xlabel('\omega_k'); ylabel('Phase');
grid on;
hold on;

t = (0:N-1) * Ts; % Time vector in seconds

figure;
plot(t, multisine_signal);
title("Multisine signal (random phases) in time domain");
xlabel('t (s)'); ylabel('Amplitude');
%xlim([0 N-1]);
hold on;

%% Task 1.3.3 Excite specific frequency lines
% Generate a random phase multisine with a sampling frequency of 200 Hz, 
% with excited frequencies [4, 8, 12, 16, 20, 24] Hz. Plot the time and 
% frequency domain results, with appropriate axes.

% => :
fs = 200;
frequencies = [4 8 12 16 20 24];
N = 1000; % Number of samples for the new multisine
n = 0:N-1; % Sample indices
k_idx = frequencies;
phi_k = rand(1, length(frequencies)) * 2 * pi; % Random phases for each frequency (uniform distrib)
%A_k = ones(1,length(frequencies));
A_k = rand(1,length(frequencies)); % random amplitudes of each cosine (uniform distrib)

% Build multisine: sum over k of A_k * cos(2*pi*(k_idx/N).*n + phi_k)
multisine_matrix = A_k.' .* cos((2*pi*k_idx.' * n)/N + phi_k.'); % (K x N)
multisine_signal = sum(multisine_matrix, 1);                     % 1 x N

% Compute and plot shifted DFT with frequency axis in bins
X_k_ms = fftshift(fft(multisine_signal));
k = -N/2:N/2-1;
amplitude_ms = abs(X_k_ms);
phase_ms = angle(X_k_ms);
% phase_ms = round(angle(X_k_ms));

% Plot the DFT results with frequency axis in Hz
figure;
subplot(2,1,1);
stem(k, amplitude_ms, '.');
title("DFT amplitude of multisine with specific frequencies");
xlabel('k (bins)'); ylabel('Magnitude');
grid on;
subplot(2,1,2);
stem(k, phase_ms, '.');
title("DFT amplitude of multisine with specific frequencies");
xlabel('k (bins)'); ylabel('Phase');
grid on;
hold on;

Ts = 1/fs;
omega_k = 2*pi*k/(N*Ts);
figure;
subplot(2,1,1);
stem(omega_k, amplitude_ms, '.');
title("DFT amplitude of multisine with specific frequencies");
xlabel('\omega_k (rad/s)'); ylabel('Magnitude');
grid on;
subplot(2,1,2);
stem(omega_k, phase_ms, '.');
title("DFT amplitude of multisine with specific frequencies");
xlabel('\omega_k (rad/s)'); ylabel('Phase');
grid on;
hold on;

f_k = omega_k/(2*pi);
figure;
subplot(2,1,1);
stem(f_k, amplitude_ms, '.');
title("DFT amplitude of multisine with specific frequencies");
xlabel('Frequency (Hz)'); ylabel('Magnitude');
grid on;
subplot(2,1,2);
stem(f_k, phase_ms, '.');
title("DFT amplitude of multisine with specific frequencies");
xlabel('Frequency (Hz)'); ylabel('Phase');
grid on;
hold on;

% Plot the time domain results with appropriate axes
figure;
subplot(2,1,1);
plot(n, multisine_signal);
title("Multisine signal with specific frequencies in time domain");
xlabel('n (samples)'); ylabel('Amplitude');
xlim([0 N-1]);
grid on;

subplot(2,1,2);
t = (0:N-1) * Ts;
plot(t,multisine_signal);
title("Multisine signal with specific frequencies in time domain");
xlabel('t (s)'); ylabel('Amplitude');
grid on;
hold on;

%% 1.4 Frequency domain construction of a multisine
% It is also possible to generate a multisine in the frequency domain, so 
% to directly construct X(k), by specifying the amplitudes and phases of 
% the components. One difficulty is that X(k) must be constructed both for 
% the positive and the negative frequencies. However, the following trick 
% can be used such that only the positive frequencies need to be considered.

% Task 1.4.1 Trick for frequency domain multisine

% => SEE HANDWRITTEN NOTES

%% Task 1.4.2 Frequency domain multisine
% Use the trick from the previous task to construct a random phase 
% multisine in the frequency domain. Let N = 1000 and excite the first 
% K = 30 bins. Make time and frequency domain plots (time axis in sample 
% number, frequency axis in bin number).

% => :

% Construct X(k) properly (including conjugate symmetric negative bins)
N = 1000;
n = 0:N-1;
K = 30;

% Positive-frequency bin indices (1-based bins): 1..K
% We'll place energy at bins 1..K (these correspond to FFT bins 1..K)
A_k = rand(1,K);                    % amplitudes for positive bins
phi_k = rand(1,K) * 2*pi;           % random phases

% Build a full-length complex spectrum X (unshifted FFT ordering: bins 0..N-1)
X = zeros(1, N);                    % complex spectrum (1 x N)

% MATLAB FFT bins: 1 -> k=0 (DC), 2..(N/2) -> positive freqs, etc.
% We want to excite the first K positive harmonics excluding DC (k=0).
% So place components at bins 1+1 : 1+K (MATLAB indices 2 : K+1)
pos_bins = 2:(K+1);
X(pos_bins) = (A_k/2) .* exp(1j * phi_k);   % half-amplitude in positive bins

% % Mirror to negative frequencies to ensure a real time-domain signal.
% % Negative frequency bins correspond to MATLAB indices N-K+1 : N (wrap-around)
% neg_bins = N - (K-1) : N;
% X(neg_bins) = conj(X(pos_bins));             % conjugate symmetry

% In case K includes the Nyquist bin when N even, handle it (here K<<N so not needed).
% Now inverse FFT to get time-domain signal. Note: ifft expects full-length X.
% x_n = ifft(X, N, 'symmetric') * N;  % scale by N to match the 2N*Real(ifft(...)) idea
x_n = 2.*N.*real(ifft(X));

% Plot time-domain signal (sample axis)
figure;
plot(n, x_n);
title("Multisine signal created from the freq domain, using task 1.4.1")
xlabel("n (samples)"); ylabel("Amplitude");
xlim([0 N-1]);
grid on;
hold on;

X_k = fftshift(fft(x_n));
k = -N/2:N/2-1;
magnitude = abs(X_k);
phase = angle(X_k);
figure;
subplot(2,1,1);
stem(k,magnitude);
title("Multisine signal created from the freq domain, using task 1.4.1")
xlabel("k (bins)");ylabel("Magnitude");
grid on;
subplot(2,1,2);
stem(k,phase);
title("Multisine signal created from the freq domain, using task 1.4.1")
xlabel("k (bins)");ylabel("Phase");
grid on;
hold on;

%% 1.4.3 Specified excited frequency band
% Construct a random phase multisine in the frequency domain, which excites
% the frequency band [5, 15] Hz at 31 equidistantly spaced frequencies. 
% Choose an appropriate sampling frequency. Make time domain and frequency 
% domain plots (time axis in seconds, frequency axis in Hz). How long is 
% one period of this multisine (expressed in seconds)? What is the 
% corresponding frequency resolution (expressed in Hz)?

% => :

exc_freqs = [5 15];
K = 30;

% choose fs to satisfy Nyquist
f_max = exc_freqs(2);
fs = 2*f_max;            % sampling frequency in Hz (>= 2*f_max)
Ts = 1/fs;

% Freq vector for the K equidistant freqs b/w 5 and 15 Hz
freqs = linspace(exc_freqs(1), exc_freqs(2), K);

k = freqs;

% resolution
res = exc_freqs(2)-exc_freqs(1)/K;






A_k = rand(1,K);                    % amplitudes for keep bins
phi_k = rand(1,K) * 2*pi;           % random phases

X = zeros(1, N);                    % complex spectrum (1 x N)

keep_bins = 2:(K+1);
X(keep_bins) = (A_k/2) .* exp(1j * phi_k); % half-amplitude in positive bins

x_n = 2.*N.*real(ifft(X));

figure;
plot(n, x_n);
title("Multisine signal created from the freq domain")
xlabel("n (samples)"); ylabel("Amplitude");
xlim([0 N-1]);
grid on;
hold on;



%% 1.5 Setting the Root-Mean-Square of a signal
% see pdf to see mathematical def of RMS

% Hence, the RMS value of a signal depends on the number of excited 
% frequencies and on the choice of the amplitudes Ak.

%% Task 1.5.1 
% Set the RMS of the signal from the previous task to RMS_des = 3:
% x_des(n) = x(n) * ( RMS_des/RSM(x) )

% => ...

% ... TODO: ... !!... ?


%% 1.6 Influence of the phase of a multisine
% Choice of phase affects the time domain properties;
% It will influence its crest factor (CF), defined as:
% CF(x) = max(|x|) / RMS(x)
% It's the ratio bewteen the peak value of the signal in the time domain
% and the RMS value of the signal.

%% Task 1.6.1 
% Construct a multisine in the frequency domain with N = 500 samples, with 
% the first K = 60 bins excited and with the following phases:
%   • Random phase: chosen randomly in [0, 2π] (uniform distribution),
%   • Schroeder phase: φk = (k(k+1)π)/K ,
%   • Linear phase: φk = kπ.
%   • Constant phase
% Make time and frequency domain plots (in samples and bins), and compute 
% the Crest Factors. Describe, qualitatively, the relationship between the 
% time domain plot and the crest factor. What is the advantage of a 
% low/high crest factor?

% => :

N = 500;
K = 60;

% 1. random phases :
phase_random = rand(1,K) *2*pi;

% 2. Schroeder phase :


% 3. linear phase :


% 4. constant phase :



 % .... TODO: THE REST .... !!! ..... ???
