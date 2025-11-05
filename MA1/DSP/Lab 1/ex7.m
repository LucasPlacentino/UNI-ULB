% Exercise 7 - Lab Session 1 - DSP 2025
close all
clear

% Considering that the pixel values of a grayscale image range from 0 to 
% 255, how many bits do you need for their encoding? Implement a uniform 
% quantizer that encodes the pixel values of a 2-D grayscale image with 
% 4 bits. Load the greyscale image 'lenagray.png', apply 4-bit quantization
% and display the quantized image.

% 0-255 -> L=2^N=256 so N=8 bits
% we reduce to 4 bits

I = imread("lenagray.png");
%I = im2double(I);
I = double(I); % ??????
I_q = ex7_my_2D_uniform_quantizer(I);

subplot(1,2,1);
imshow(uint8(I));% ?????
%imshow(I);
title('Original 8-bit image');

subplot(1,2,2);
imshow(uint8(I_q));% ?????
%imshow(I_q);
title('Quantized 4-bit image');

