function [ resultMatrix ] = encodeMessage( messageBin, imageMatrix )
%encodeMessage is the function to encode message into an image
%   I want to let the data of the message seperate to as large
%   area as possible. 
%   messageBin: the original binary string of the message
%   imageMatrix:   the 3d matrix of the image

alpha = 20;

messageMatrix = messageBin-'0'; % Important: convert string to matrix

[row,column]=size(messageMatrix);
[imageRow,imageCol,imageDi]=size(imageMatrix);

modifiedMatrix = zeros(imageRow,imageCol,imageDi);

% DEFINE rowStep and colStep
%   rowStep: the gap between each element in a row
%   colStep: the gap between each element in a column
 
rowStep = floor(imageRow/row)-1; 
colStep = floor(imageCol/column)-1; % actually column always equal to 7

% Embed message length in the first line of image
embedLengthInfo = dec2bin(row)-'0';
[a,b] = size(embedLengthInfo);
modifiedMatrix(1,(imageCol-b+1):imageCol,1) = ...
    modifiedMatrix(1,(imageCol-b+1):imageCol,1) + embedLengthInfo;

for i=1:3
    %dimensionStep= 5*2^i;
    dimensionStep=i+1;
    for j=1:row
        for k=1:column
            modifiedMatrix(dimensionStep+(j-1)*rowStep,dimensionStep+(k-1)*colStep,i)...
                =messageMatrix(j,k);
        end
    end
end

resultMatrix = alpha .* uint8(modifiedMatrix) + uint8(imageMatrix);

end

