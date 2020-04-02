close all;
clear all;
clc;
-----------------------------------------------------------------------------------------------------------------------
imgFolder1 = fullfile('C:\Users\GOWTHAM KISHORE\Documents\MATLAB\rice_leaf_diseases\Leaf smut');
imgset1 = imageSet(imgFolder1);
-----------------------------------------------------------------------------------------------------------------------
imgFolder2 = fullfile('C:\Users\GOWTHAM KISHORE\Documents\MATLAB\rice_leaf_diseases\Brown spot');
imgset2 = imageSet(imgFolder2);
-----------------------------------------------------------------------------------------------------------------------
imgFolder3 = fullfile('C:\Users\GOWTHAM KISHORE\Documents\MATLAB\rice_leaf_diseases\Bacterial leaf blight');
imgset3 = imageSet(imgFolder3);
-----------------------------------------------------------------------------------------------------------------------
% % imshow(read(imgset1,48));
% % newimage = cell2mat(YourCellArray);
% % imshow(newimage)
image=0;
ic1=0;% array indexing
for n1=1:(imgset1.Count)-38
    ic1=ic1+1;
    ii1=read(imgset1,n1);
    sp1(ic1) ={imresize( imsharpen(ii1,'Radius',2,'Amount',1),[64,220])};
    ssp1(ic1)={1};
    image=image+1
    i1=imrotate(ii1,90);
    ic1=ic1+1;
    sp1(ic1) = {imresize(imsharpen(i1,'Radius',2,'Amount',1),[64,220])};
    image=image+1
    i1=imrotate(ii1,180);
    ic1=ic1+1;
    sp1(ic1) = {imresize(imsharpen(i1,'Radius',2,'Amount',1),[64,220])};
    image=image+1
end
ic2=0;% array indexing
for n2=1:(imgset2.Count)-35
    ic2=ic2+1;
    ii2=read(imgset2,n2);
    sp2(ic2) = {imresize(imsharpen(ii2,'Radius',2,'Amount',1),[64,220]),2;};
    image=image+1
    i2=imrotate(ii2,90);
    ic2=ic2+1;
    sp2(ic2) = {imresize(imsharpen(i2,'Radius',2,'Amount',1),[64,220])};
%     image=image+1
    i2=imrotate(ii2,180);
    ic2=ic2+1;
    sp2(ic2) = {imresize(imsharpen(i2,'Radius',2,'Amount',1),[64,220])};
    image=image+1
end
ic3=0;% array indexing
for n3=1:(imgset3.Count)-35
    ic3=ic3+1;
    ii3=read(imgset3,n3);
    sp3(ic3,2) = {imresize(imsharpen(ii3,'Radius',2,'Amount',1),[64,220]),3;};
    image=image+1
    i3=imrotate(ii3,90);
    ic3=ic3+1;
    sp3(ic3) = {imresize(imsharpen(i3,'Radius',2,'Amount',1),[64,220])};
%     image=image+1
    i3=imrotate(ii3,180);
    ic3=ic3+1;
    sp3(ic3) = {imresize(imsharpen(i3,'Radius',2,'Amount',1),[64,220])};
    image=image+1
end
% --------------------------------------------------------------------------------------------------
% --------------------------------------------------------------------------------------------------
% --------------------------------------------------------------------------------------------------
% --------------------------------------------------------------------------------------------------
layers = [
    imageInputLayer([64 220 3])
    convolution2dLayer(3,8,'Padding','same')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    fullyConnectedLayer(3)%num classes is 3
    softmaxLayer
    classificationLayer
    ];
options  = trainingOptions('sgdm','MaxEpochs',1,'ValidationData',sp1,'ValidationFrequency',3,'Verbose',false, 'Plots','training-progress');
 labelIDs=[28 28 1];
 net = trainNetwork(sp1,layers,options);
YPred = classify(net,sp3);
YValidation = imdsValidation.Labels;
accuracy = (sum(YPred == YValidation)/numel(YValidation))*100