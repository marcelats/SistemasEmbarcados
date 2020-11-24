function data = bintoim(binName, imageName)
  fileID = fopen(binName, "r");
  data = fread(fileID, [100 100], 'int=>double');
  fclose(fileID);
  maxValue = max(data(:));
  data = data / maxValue;
  imwrite(data, imageName);
endfunction
