function [ corrCoefficient ] = correlation3d( oriImage, watImage )
%CORRELATION FUNCTION FOR THREE DIMENSION SIGNAL
%   Because of the encode message method, the correlation is closed to
%   0.99999
%   oriImage: original image matrix
%   watImage: watermarked image matrix
%   corrCoefficient: correlation coefficient
oriImage = double(oriImage);
watImage = double(watImage);

meanA = mean(oriImage(:));
meanB = mean(watImage(:));

numeratorTermMatrix = (oriImage-meanA).*(watImage-meanB);
denominatorTerm1 = (oriImage-meanA).^2;
denominatorTerm2 = (watImage-meanB).^2;

numerator = sum(numeratorTermMatrix(:));
denominator = sqrt(sum(denominatorTerm1(:))*sum(denominatorTerm2(:)));

corrCoefficient = numerator/denominator;

end

