% read image
f = im2double(imread('Fig3.40(a).jpg'));

% define the Laplacian filter mask
mask = [0 1 0; 1 -4 1; 0 1 0];

% get the size of the image
[m, n] = size(f);

% initialize the result matrix with zeros
g = zeros(m, n);

% apply the filter to interior pixels
for i = 2:(m-1)
    for j = 2:(n-1)
        % calculate the convolution using the 3x3 mask
        g(i, j) = f(i, j) - sum(sum(f(i-1:i+1, j-1:j+1) .* mask));
    end
end

% display the original image and the result
subplot(121), imshow(f);
subplot(122), imshow(g);
