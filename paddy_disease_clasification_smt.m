close all;
clear all;
clc;
% -----------------------------------------------------------------------------------------------------------------------
imgFolder1 = fullfile('C:\Users\GOWTHAM KISHORE\Documents\MATLAB\rice_leaf_diseases\Leaf smut');
imgset1 = imageSet(imgFolder1);
% -----------------------------------------------------------------------------------------------------------------------
imgFolder2 = fullfile('C:\Users\GOWTHAM KISHORE\Documents\MATLAB\rice_leaf_diseases\Brown spot');
imgset2 = imageSet(imgFolder2);
% -----------------------------------------------------------------------------------------------------------------------
imgFolder3 = fullfile('C:\Users\GOWTHAM KISHORE\Documents\MATLAB\rice_leaf_diseases\Bacterial leaf blight');
imgset3 = imageSet(imgFolder3);
% -----------------------------------------------------------------------------------------------------------------------
% imshow(read(imgset1,48));
% newimage = cell2mat(YourCellArray);
% imshow(newimage)
image=0;
for n1=1:imgset1.Count
    i1=read(imgset1,n1);
    sp1(n1) = {imgaussfilt(i1,2)};
    image=image+1
end
for n2=1:imgset2.Count
    i2=read(imgset2,n2);
    sp2(n2) = {imgaussfilt(i2,2)};
    image=image+1
end
for n3=1:imgset3.Count
    i3=read(imgset3,n3);
    sp3(n3) = {imgaussfilt(i3,2)};
    image=image+1
end