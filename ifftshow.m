function [] = ifftshow(f)
    f1 = abs(f);
    fm = max(f1(:));
    figure, imshow(f1/fm);
end