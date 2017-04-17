%% ========== Assignment 2 - Watermarking =============
%%                          done by Wang Zehao DB427041
%% ====================================================

% Because my method to encode the message always make the correlation
% coefficient close to 0.99999
format long;

% Asking user input
fprintf('Welcome to My Watermarking!\n\n');
message = input('Please enter the plaintext:\n','s');
disp('-------------------------------------------------------------');

% Change message to binary representation
binMessage = dec2bin(message);

%%---------------------- Lena -----------------------
imdata1 = imread('lena512color.tiff');

[ encodedImage1 ] = encodeMessage(binMessage,imdata1);

[decodedMessage1] = decodeMessage(imdata1,encodedImage1);

[ coe1 ] =correlation3d(imdata1,encodedImage1);

% Display coefficient and decoded message
fprintf('The coefficient of lena is');disp(coe1);
fprintf('The retrieved plaintext from lena is %s.\n',decodedMessage1);
disp('-------------------------------------------------------------');

% Image display
figure;
subplot(1,2,1);
imshow(imdata1);
title('Original image');
subplot(1,2,2);
imshow(encodedImage1);
title('Watermarked image');
saveas(gcf,'displayLena.png');

%%---------------------- Baboon -----------------------
imdata2 = imread('baboon.bmp');

[ encodedImage2 ] = encodeMessage(binMessage,imdata2);

[decodedMessage2] = decodeMessage(imdata2,encodedImage2);

[ coe2 ] =correlation3d(imdata2,encodedImage2);

% Display coefficient and decoded message
fprintf('The coefficient of baboon is');disp(coe2);
fprintf('The retrieved plaintext from baboon is %s.\n\n',decodedMessage2);
disp('-------------------------------------------------------------');

% Image display
figure;
subplot(1,2,1);
imshow(imdata2);
title('Original image');
subplot(1,2,2);
imshow(encodedImage2);
title('Watermarked image');
saveas(gcf,'displayBaboon.png');

%%---------------------- Fruit -----------------------
imdata3 = imread('fruits.bmp');

[ encodedImage3 ] = encodeMessage(binMessage,imdata3);

[decodedMessage3] = decodeMessage(imdata3,encodedImage3);

[ coe3 ] =correlation3d(imdata3,encodedImage3);

% Display coefficient and decoded message
fprintf('The coefficient of fruit is');disp(coe3);
fprintf('The retrieved plaintext from fruit is %s.\n',decodedMessage3);

% Image display
figure;
subplot(1,2,1);
imshow(imdata3);
title('Original image');
subplot(1,2,2);
imshow(encodedImage3);
title('Watermarked image');
saveas(gcf,'displayFruit.png');
