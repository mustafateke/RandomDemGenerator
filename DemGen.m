%Görüntüleri Yükle
im1 = imread('500x1000\1.jpg');
im2 = imread('500x1000\2.jpg');
im3 = imread('500x1000\3.jpg');
im4 = imread('500x1000\4.jpg');
im5 = imread('500x1000\5.jpg');
im6 = imread('500x1000\6.jpg');
im7 = imread('500x1000\7.jpg');
im8 = imread('500x1000\8.jpg');
im9 = imread('500x1000\9.jpg');
im10 = imread('500x1000\10.jpg');
im11 = imread('500x1000\11.jpg');
im12 = imread('500x1000\12.jpg');

baseIm1 = imread('Base\1.jpg');
baseIm2 = imread('Base\2.jpg');
baseIm3 = imread('Base\3.jpg');

%Dem Array'lerini set et, bunlar ileride 
%Dem Generation için kullanýlacak.
arr(1:500, 1:1000, 1) = im1;
arr(1:500, 1:1000, 2) = im2;
arr(1:500, 1:1000, 3) = im3;
arr(1:500, 1:1000, 4) = im4;
arr(1:500, 1:1000, 5) = im5;
arr(1:500, 1:1000, 6) = im6;
arr(1:500, 1:1000, 7) = im7;
arr(1:500, 1:1000, 8) = im8;
arr(1:500, 1:1000, 9) = im9;
arr(1:500, 1:1000, 10) = im10;
arr(1:500, 1:1000, 11) = im11;
arr(1:500, 1:1000, 12) = im12;

%Random Dem Üret.

%kullanýlacak katmanlarý belirle.
base = mod(ceil(10*rand()),3);

top = ceil(10.*rand(12,1));
top(1) = mod(top(1),12);
top(2) = mod(top(2),12);
top(3) = mod(top(3),12);
top(4) = mod(top(4),12);
top(5) = mod(top(5),12);

myDem = baseArr(:,:,base+1);
myDem(1:500,1:1000) = myDem(1:500,1:1000) + arr(:,:,top(1)+1);
myDem(1:500,1001:2000) = myDem(1:500,1:1000) + arr(:,:,top(2)+1);
myDem(1:500,2001:3000) = myDem(1:500,1:1000) + arr(:,:,top(3)+1);
myDem(1:500,3001:4000) = myDem(1:500,1:1000) + arr(:,:,top(4)+1);
myDem(1:500,4001:5000) = myDem(1:500,1:1000) + arr(:,:,top(5)+1);

h = fspecial('gaussian');
imfilter(myDem, h);
imwrite(myDem, 'dem.jpg');