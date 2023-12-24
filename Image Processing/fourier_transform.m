% read image
image = imread('Fig5.26a.jpg');

% convert the image to double for processing
image_double = double(image);

% compute the Fourier transform of the image using fft2
fourier_transform = fft2(image_double);

% shift the zero-frequency component to the center
centered_spectrum = fftshift(fourier_transform);

% compute the magnitude spectrum
magnitude_spectrum = abs(centered_spectrum);

% display the original image
subplot(1, 2, 1);
imshow(image);
title('Original Image');

% display the centered Fourier spectrum
subplot(1, 2, 2);
imshow(log(1 + magnitude_spectrum), []); % Use log for better visualization
title('Centered Fourier Spectrum');