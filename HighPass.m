clear all;clc;
filedir = fullfile('rice_leaf_diseases','Bacterial leaf blight','DSC_0366.JPG');
a = imread(filedir);
hb = butterhp(a,1,20);
af = fftshift(fft2(a));
afhb = af.*hb;
% fftshow(afhb);
afhbi = ifft2(afhb);
ifftshow(afhbi);