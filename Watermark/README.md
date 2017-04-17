# CISB461-Information Security  Assignment2

Wang Zehao DB427041

### Message Encoding

I first change each letter of the image into binary representation. Then according to the size of the original image, append columns and rows with 0 in the middle of each binary letter. (e.g. original message in binary is [1 0 0 1 0], append to [1000001000] based on the rowStep variable which is calculated based on the original image and row variable which is the message length).  The initial position of the corner binary letter will have a offset based on the RGB layer, because I do not want to let the same point has add the same value for three times.

Another important thing is that I need to add the length of the message to the watermarked image, so that we can use it to decode the message from the watermarked image.

### Message Decoding

First subtract the original image from the watermarked image.  Then extract the first row of the Red layer, convert it to decimal to get the message length. Then use this length and the already known length of the binary representation of each letter, which is 7 (ascii to binary), to find which rows and columns have the information of  message. We remove the useless lines and shrink the matrix. Then transpose the matrix and convert it to characters.

Another thing I did in decoding phase is that I will extract message from all three layer, although they contain same information. Maybe some layers have noise during image processing or overflow, so I recheck all three decoded messages, return the most possible one.

More detailed interpretations are in the comments of each source code file.



