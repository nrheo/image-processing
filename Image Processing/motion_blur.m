original_image = imread('Fig5.26a.jpg');
original_image_double = im2double(original_image);

[M,N] = size(original_image_double);
[V,U] = meshgrid(1:N, 1:M);
U = U - floor(M / 2);
V = V - floor(N / 2);
a = 0.1;
b = 0.1;
T = 1;

exponential = pi*((U * a) + (V * b) + eps);
degradation_function = T ./ exponential .* sin( exponential ) ...
    .* exp(-1j * exponential);

degradation_function = ifftshift(degradation_function);
frequency_shift = fft2(original_image_double);
applied_filter = degradation_function .* frequency_shift;
new_image = real(ifft2(applied_filter));
new_image = im2uint8(mat2gray(new_image));

subplot(1, 3, 1);
imshow(new_image); title('[2](b) Blurred Image');
B = imnoise(new_image, 'gaussian', 0);
subplot(1, 3, 2);
imshow(B); title('[2](c) Gaussian Noise');

%Implement Wiener filter
PSF = fspecial('motion', 21, 11);
blurred = imfilter(original_image, PSF, 'conv', 'circular');
noise_mean = 0;
noise_var = 0.0001;
blurred_noisy = imnoise(blurred, 'gaussian', noise_mean, noise_var);
signal_var = var(original_image_double(:));
wiener_filter = deconvwnr(blurred_noisy, PSF, noise_var / signal_var);

subplot(1, 3, 3);
imshow(wiener_filter); title('[2](d) Wiener Filter');