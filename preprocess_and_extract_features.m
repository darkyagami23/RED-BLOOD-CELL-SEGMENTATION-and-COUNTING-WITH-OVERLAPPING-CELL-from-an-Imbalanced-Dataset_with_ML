function [features] = preprocess_and_extract_features(imagePath, Ravg, Gavg, Bavg)
    % Load Image
    I = imread(imagePath);

    % Normalize the Image
    normalized_img = normalize_image(I, Ravg, Gavg, Bavg);

    % Create Mask
    BW_img = createMask(normalized_img);

    [~,~,features]=filterRegions(BW_img);

end