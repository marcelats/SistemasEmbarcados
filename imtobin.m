function imtobin(imageName, binName)
  image = imread(imageName);
  grayImg = rgb2gray(image);
  fileID = fopen(binName, "w");
  fwrite(fileID, grayImg);
  fclose(fileID);
endfunction
