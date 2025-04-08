function normalized_img=normalize_image(img,Ravg,Gavg,Bavg)
I = double(img);
normalized_img = zeros(480,640,3);

ravg = mean(I(:,:,1),"all");
gavg = mean(I(:,:,2),"all");
bavg = mean(I(:,:,3),"all");

normalized_img(:,:,1) = I(:,:,1) + (Ravg - ravg);
normalized_img(:,:,2) = I(:,:,2) + (Gavg - gavg);
normalized_img(:,:,3) = I(:,:,3) + (Bavg - bavg);

normalized_img = uint8(normalized_img);
