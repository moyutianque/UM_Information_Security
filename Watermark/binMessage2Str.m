function [ message ] = binMessage2Str( binMessageMatrix )
%Convert binary array of message to string
%   binMessageMatrix: binary array of matrix
[row,column] = size(binMessageMatrix);
message = zeros(row,1);

for i=1:row
    temp = num2str(binMessageMatrix(i,:));
    temp(isspace(temp))='';
    message(i,1)=bin2dec(temp);
end

message = char(message');

end

