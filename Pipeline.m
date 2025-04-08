%% loading the model and parameters
%%
loadedData = load("E:\BME Stuffs\BME Resources\3-2 resources\DSP project\Final_pipeline\Final_iteration_pipeline\finalModel2.mat");  % Adjust the filename if necessary
finalModelLoaded = loadedData.modelStruct.model;  % Access the loaded model

mu=loadedData.modelStruct.mu;
sigma=loadedData.modelStruct.sigma;
Ravg=loadedData.modelStruct.Ravg;
Gavg=loadedData.modelStruct.Gavg;
Bavg=loadedData.modelStruct.Bavg;

disp('Model loaded successfully!');

%%
imagePath="E:\BME Stuffs\BME Resources\3-2 resources\DSP project\Dataset_2\45.jpg";
Features=preprocess_and_extract_features(imagePath,Ravg,Gavg,Bavg);
%%
X=Features{:,:};
X_scaled = (X - mu) ./ sigma;

y_pred=predict(finalModelLoaded,X_scaled);

y_ans=str2num(cell2mat(y_pred));
% Sum of all elements in the array
totalSum = sum(y_ans);  % Flatten the array into a single vector and sum all elements
two_cell_count=sum(y_ans==2);
three_cell_count=sum(y_ans==3);

disp(['Total sum of array: ', num2str(totalSum)]);