% read image
original_image = imread("Fig3.08(a).jpg");

% display original image
figure, imshow(original_image); 
enhanced_image = histeq(original_image, 256);

% display enhanced image
figure, imshow(enhanced_image);

% display original image histogram
figure, imhist(original_image); 

% display enhanced image histogram
figure, imhist(enhanced_image);

% normalized histogram
hnorm = imhist(original_image)/numel(original_image); 
cdf = cumsum(hnorm);
r = linspace (0,1,256);

% histogram equalization transformation function
figure, plot(r, cdf);

title('\textbf{Histogram equalization transformation function}',...
'interpreter','latex','fontsize',20);

xlabel('Input intensity values','interpreter','latex','fontsize',18);
ylabel('Output intensity values','interpreter','latex','fontsize',18);

