% Lab 1 ImageProc
% 2026-03-23

close all; clear all; clc;

% intro

% **** !!! submit all exercises 25/05/2026 23h59 final deadline !!! ****
% for bonus +1 on project grade
% !!! minimum of 10/20 on BOTH the project and the theory exam

% project is 40% of grade... see project pdf
% (oral defense: not with prof, but usually same day of theory exam)

% 4 types of images: 
%   - indexed images, 
%   - greyscale images, 
%   - RGB images,
%   - binary/monochrome images

% For a colour table with J entries, this matrix has a size of Jx3
% for greyscale, same size as image size
% double(0-1) or UINT8 values (0-255)

% we can convert from indexed to rgb or greyscale (ind2RGB(), ind2gray() )

% YUV color space (luminance so like greyscale, blue proj, red proj), good for compressing
% for the human eye
% HSV, HSL, LAB color space

% ... 1D filtering, see doc or DSP course (0 padding, inverse the filter
% (xyz->zyx), etc)

%% Ex 1
close all;

[aind,amap] = imread('trees.tif','TIF');
% check:
figure;
imshow(aind,amap);
title("indexed color image")
%convert indexed to RGB:
argb = ind2rgb(aind,amap);
% check:
figure;
imshow(argb);
title("RGB color image");

pxl_x = 60;
pxl_y = 15;
idx = aind(pxl_y,pxl_x)+1; % !!! +1 because indexed images start at 0 but matlab 1
disp(["IND: ",num2str(aind(pxl_y,pxl_x)),"-> ",num2str(amap(idx,1)), ...
    num2str(amap(idx,2)),num2str(amap(idx,3)),"; RGB: ", ...
    num2str(argb(pxl_y,pxl_x,1)),num2str(argb(pxl_y,pxl_x,2)), ...
    num2str(argb(pxl_y,pxl_x,3))]);

agray = ind2gray(aind,amap); % converts to RGB values then to the YUV 
% colour space, and only use the Y channel (luminance)
figure;
imshow(agray);
title("Greyscale image");

% check if rgb to Y was done correctly
R = amap(idx,1);
G = amap(idx,2);
B = amap(idx, 3);
Y = 0.299*R + 0.587*G + 0.114*B; % formula in ex doc
disp(["Y from formula: ", num2str(Y*255), " -> Converted Greyscale: ", num2str(agray(pxl_y, pxl_x))]);

%% Ex 2
close all;


X=[1 2 3;3 1 2;2 3 1];
X_map=[1 0 0;... % red
       0 1 0;... % green
       0 0 1];   % blue

% show image
figure;
imshow(X, X_map,'InitialMagnification', 'fit');
title('Given RGB map image');

% change color map to cyan magenta yellow
CMY_map = [0 1 1;... % cyan (=green+blue)
           1 0 1;... % magenta (=red+blue)
           1 1 0];   % yellow (=red+green)

figure;
imshow(X,CMY_map);
title("CMY map image");

% change color map to black grey and white
grayscale_map = [0 0 0;...      % black
                 0.5 0.5 0.5;...% gray
                 1 1 1];        % white

% show image with grayscale map
figure;
imshow(X, grayscale_map);
title("Grayscale map image");

%% Ex 3
close all; clear all; clc;

% write module, performs filtering on 1D signal for filters with an odd
% number of samples. use zeros to fill the borders (padding).

signal = [rand() rand() rand() rand() rand() rand() rand()];
filter = 1/3.*[1 1 1]; % average filter
disp(["signal: ",num2str(signal)]);
disp(["filter: ",num2str(filter)]);

out = my_filtering_ex3(signal, filter); %
m_out = conv(signal, filter,'same');
% check with matlab's conv function (using 'same' arg):
disp(["my conv: ",num2str(out),"; matlab's conv('same'): ",num2str(m_out)]);
disp(["same? :",num2str(isequal(out,m_out))]);

%% Ex 4 - DFT
close all; clear all; clc;

% create black image 128x128 that has a white horizontal rectangle slit in 
% the middle

filter_img = zeros(128, 128); % Create a black image
y_size_rect = 61:70;
x_size_rect = 20:108;
filter_img(y_size_rect, x_size_rect) = 1; % Add a white horizontal rectangle in the middle
figure;
imshow(filter_img);
title('filter\_img: Black Square Image with White Horizontal Slit in middle');

% look at spectrum of img: with surfc and imagesc
% Compute the 2D Discrete Fourier Transform (DFT) of the filter image
dft_img = fft2(filter_img);
% Shift the zero-frequency component to the center
dft_img_shifted = fftshift(dft_img);
% Display the magnitude spectrum
figure;
surfc(log(abs(dft_img_shifted) + 1));
title("surfc of shifted dft of image in dB scale (surfc)")
colorbar;
figure;
surfc(abs(dft_img_shifted));
title("surfc of shifted dft of image (surfc)")
colorbar;
figure;
imagesc(log(abs(dft_img_shifted) + 1)); % Use log for better visibility
colorbar;
%colormap('gray');
title('Magnitude Spectrum of the Filter Image in dB scale (imagesc)');
figure;
imagesc(abs(dft_img_shifted)); % Use log for better visibility
%colormap('gray');
colorbar;
title('Magnitude Spectrum of the Filter Image (imagesc)');

% Rotate image 45, 60 and 90°

% Rotate the filter image by specified angles
angles = [0, 45, 60, 90];
% Rotate the filter image by specified angles and display the results
for angle = angles
    rotated_img = imrotate(filter_img, angle, 'crop');
    figure();
    subplot(1,2,1);
    imshow(rotated_img);
    title(['Rotated Image by ', num2str(angle), ' Degrees']);
    subplot(1,2,2);
    dft_r_img = fft2(rotated_img);
    dft_r_img_shifted = fftshift(dft_r_img);
    imagesc(log(abs(dft_r_img_shifted) + 1)); % Use log for better visibility
    %colormap('gray');
    title(['Magnitude Spectrum of the ',num2str(angle),'° Rotated Image in dB scale (imagesc)']);

    % save images to new array with same index as the angle index

    images{find(angles==angle)} = rotated_img;
    spectrums{find(angles==angle)} = dft_r_img_shifted;
end

% compare each rotated image spectrum with the original spectrum:
% Compare the magnitude spectrum of each rotated image with the original spectrum
figure;
for i = 1:length(angles)
    comparison = abs(spectrums{i}) - abs(spectrums{1});
    subplot(2,2,i)
    imagesc(log(abs(comparison) + 1));
    title(['[dB scale] Comparison Mag Spectrum ', num2str(angles(i)), '° Rotation, dB scale']);
    colorbar;
end
figure;
for i = 1:length(angles)
    comparison = abs(spectrums{i}) - abs(spectrums{1});
    subplot(2,2,i)
    imagesc(comparison);
    title(['[linear] Comparison Mag Spectrum ', num2str(angles(i)), '° Rotation']);
    colorbar;
end
figure;
for i = 1:length(angles)
    comparison = abs(spectrums{i}) - abs(spectrums{1});
    subplot(2,2,i)
    imagesc(abs(comparison));
    title(['[abs(linear)] Comparison Mag Spectrum ', num2str(angles(i)), '° Rotation']);
    colorbar;
end


%% Ex 5
close all; clear all; clc;

% read "mandrill.tif" and "zebra.tif" images

% Read the images
mandrill_img = imread('mandrill.tif');
zebra_img = imread('zebra.tif');
figure;
subplot(1,2,1);
imshow(mandrill_img);
subplot(1,2,2);
imshow(zebra_img);


% compute DFT and then its modulus and phase values for each picture
% Compute the DFT of each image and extract modulus and phase
dft_mandrill = fft2(mandrill_img);
dft_zebra = fft2(zebra_img);
modulus_mandrill = abs(dft_mandrill);
phase_mandrill = angle(dft_mandrill);
modulus_zebra = abs(dft_zebra);
phase_zebra = angle(dft_zebra);

% Display DFT modulus for images
figure;
subplot(1,2,1);
imshow(mandrill_img);
title("Mandrill image")
subplot(1,2,2);
% Display modulus and phase for mandrill image
imagesc(log(modulus_mandrill+1));
title('Modulus of Mandrill Image DFT');
colorbar;

figure;
subplot(1,2,1);
imshow(zebra_img);
title("Zebra image")
subplot(1,2,2);
% Display modulus and phase for mandrill image
imagesc(log(modulus_zebra+1));
title('Modulus of Zebra Image DFT');
colorbar;

% same for shifted variants
% Compute the DFT of the shifted images and extract modulus
dft_mandrill_shifted = fftshift(dft_mandrill);
dft_zebra_shifted = fftshift(dft_zebra);
modulus_mandrill_shifted = abs(dft_mandrill_shifted);
modulus_zebra_shifted = abs(dft_zebra_shifted);

% Display modulus of shifted DFT for each image
figure;
subplot(1,2,1);
imshow(mandrill_img);
title("Mandrill image")
subplot(1,2,2);
imagesc(log(modulus_mandrill_shifted + 1));
title('Shifted Modulus of Mandrill Image DFT');
colorbar;
figure;
subplot(1,2,1);
imshow(zebra_img);
title("Zebra image")
subplot(1,2,2);
imagesc(log(modulus_zebra_shifted + 1));
title('Shifted Modulus of Zebra Image DFT');
colorbar;

% Create two new DFTs by using the modulus of the DFT of one image with 
% the phase information of the other (use 1i for the imaginary unit). 

% Create new DFTs using modulus of one image and phase of the other
dft_combined_mz_pm = modulus_zebra .* exp(1i * phase_mandrill);
dft_combined_mm_pz = modulus_mandrill .* exp(1i * phase_zebra);

% Compute the inverse DFT to obtain the images from the combined DFTs (use
% round of ifft)
reconstructed_img_mz_pm = round(ifft2(dft_combined_mz_pm));
reconstructed_img_mm_pz = round(ifft2(dft_combined_mm_pz));

% Display the reconstructed images
figure;
subplot(2,1,1);
imshow(reconstructed_img_mz_pm, []);
title('Reconstructed Image from Modulus of Zebra and Phase of Mandrill');
subplot(2,1,2);
imshow(reconstructed_img_mm_pz, []);
title('Reconstructed Image from Modulus of Mandrill and Phase of Zebra');


% end of lab1