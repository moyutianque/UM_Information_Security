function [ message ] = decodeMessage( oriImage, watImage )
%decodeMessage is the function to decode message from an image
%   oriImage: the original image matrix
%   watImage: the watermarked image matrix

alpha = 20;
differenceMatrix = (watImage-oriImage)./alpha;
message = 'test';
% ====================== Description ==============================
%   To decode the message we can choose any one of the RGB layer
%   another thing we know is when ascii character convert to binary 
%   in matlab, its length is 7, and row information is already stored
%   in the dimensionStep accroding to the encodeMessage function

[imageRow,imageCol,imageDi]=size(oriImage);

% Decode the number of rows information
numOfRows = num2str(differenceMatrix(1,:,1)); 
numOfRows(isspace(numOfRows)) = '';
numOfRows = bin2dec(numOfRows);

% DEFINE rowStep and colStep
%   rowStep: the gap between each element in a row
%   colStep: the gap between each element in a column
 
rowStep = floor(imageRow/numOfRows)-1; 
colStep = floor(imageCol/7)-1; % actually column always equal to 7

% Create the message binary matrix
binMessage = zeros(numOfRows,7,3);

% Decode two of the three layer to ensure the water marked image do not
% lose information
for i=1:3
    for j=1:numOfRows
        for k=1:7
            binMessage(j,k,i) = ...
                differenceMatrix((i+1)+(j-1)*rowStep,(i+1)+(k-1)*colStep,i);
        end
    end
end

% To check the message is correct or not
str1 = binMessage2Str(binMessage(:,:,1));
str2 = binMessage2Str(binMessage(:,:,2));
str3 = binMessage2Str(binMessage(:,:,3));
if strcmp(str1,str2)
    message = str1;
elseif strcmp(str1,str3)
    message=str1;
elseif strcmp(str2,str3)
    message=str2;
else
    message = ['Image lost information, three different message: ';...
                      str1;str2;str3];
end


end

