function data = bintoim(binName, imageName)
  fileID = fopen(binName, "r");
  data = fread(fileID, [100 100]);
  fclose(fileID);
  imwrite(data, imageName);
endfunction
