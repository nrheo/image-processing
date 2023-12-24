% read image
A = imread('Fig4.11(a).jpg');

%%Low Pass Filter
[M N] = size(A);

B = double(A);
for i = 1:M
    for j = 1:N
        d = (i-1) + (j-1);

        C(i,j) = B(i,j)*(-1)^d;
    end 
end

D=fft2(C);
for u = 1:M
    for v = 1:N
        P = (u - ((2 * M - 1) / 2))^2; Q = (v - ((2 * N - 1) /2))^2; H(u,v) = exp(-(P+Q)/(2*(25^2)));
    end 
end

for i = 1:M,
    for j = 1:N
        E(i,j) = D(i,j).*H(u,v);
    end 
end

F = ifft2(E);
imshow(F);

%%High Pass Filter
[M N] = size(A);

B = double(A);
for i = 1:M
    for j = 1:N
        d = (i-1) + (j-1);
        C(i,j) = B(i,j)*(-1)^d;
    end 
end

D=fft2(C);
for u = 1:M
    for v = 1:N
        P = (u - ((2 * M - 1) / 2))^2;
        Q = (v - ((2 * N - 1) /2))^2; H(u,v) = 1- exp(-(P+Q)/(2*(25^2)));
    end 
end

for i = 1:M,
    for j = 1:N
        E(i,j) = D(i,j).*H(u,v);
    end 
end

F = ifft2(E);
imshow (F);
