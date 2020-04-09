function [] = preprocess(foldername,imgset)
    for n1=1:(imgset.Count)

        ii1=read(imgset,n1);
        val = imresize( imsharpen(ii1,'Radius',2,'Amount',1),[64,220]);
        img = "img "+int2str(n1)+".jpg";
        baseFileName = sprintf(img, val);
        fullFileName = fullfile("training set",foldername, baseFileName);
        imwrite(val, fullFileName);
        i1=imrotate(ii1,90);

        val = imresize(imsharpen(i1,'Radius',2,'Amount',1),[64,220]);
        img = "imgRotated90 "+int2str(n1)+".jpg";
        baseFileName = sprintf(img, val);
        fullFileName = fullfile("training set" ,foldername, baseFileName);
        imwrite(val, fullFileName);
        i1=imrotate(ii1,180);

        val = imresize(imsharpen(i1,'Radius',2,'Amount',1),[64,220]);
        img = "imgRotated180 "+int2str(n1)+".jpg";
        baseFileName = sprintf(img, val);
        fullFileName = fullfile("training set" ,foldername, baseFileName);
        imwrite(val, fullFileName);

    end
end