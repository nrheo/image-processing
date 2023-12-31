% read image
image = imread("image.jpg");

% display original image
subplot(1,2,1) 
imshow(image); 
title('Original Image')

% set desired intensity level to 2
desiredLevel = 2;

% reduce intensity levels by:
% 1.normalizing original image to range [0, 1]
% 2.quantizing image to desired intensity level
% 3.scaling quantized image back to range [0, 255]
quantizedImage_2 = floor(double(image)/(255 / desiredLevel)) * (255 / desiredLevel);

% display quantized image
subplot(1,2,2); imshow(quantizedImage_2, []); title('New Image: 2 Intensity Levels');