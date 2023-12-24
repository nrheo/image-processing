% read image
image = imread('Fig3.37(a).jpg');

% linear average filter
% filtered = filter2(1/9 * [1 1 1; 1 1 1; 1 1 1], double(image));

filtered = zeros(size(image));

% loop through interior pixels of image
for i = 2:size(image,1) - 2
        for j = 2:size(image,2) - 2

            % create filter
            filter = [0 0 0 0 0 0 0 0 0];
            count = 1;

            % loop through filter
            for x = 1:3
                for y = 1:3
                    % replace values of filter with those of image
                    filter(count) = image(i+x-1, j+y-1);
                    count = count + 1;
                end
            end

            % sort array to find median value
            for a = 1:50
                for b = 1:8
                    if filter(b) > filter(b+1)
                        % swap values
                        temp = filter(b);
                        filter(b) = filter(b+1);
                        filter(b+1) = temp;
                    end
                end
            end

            % get median value for filtered image
            filtered(i,j)=filter(5);

        end
end

% display filtered image with median filter
imshow (uint8(filtered));

