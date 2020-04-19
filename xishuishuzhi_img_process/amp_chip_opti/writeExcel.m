function writeExcel(new_row,sheet)
filename = 'GAop_result.xlsx';
old=xlsread(filename ,sheet);
[row, col]= size(old);

xlRange=strcat('A',num2str(row+1));
xlswrite(filename,new_row,sheet,xlRange)
end