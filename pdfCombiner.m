function [flag] = pdfCombiner
currentdir = cd;
try
  defaultdir = fullfile(getenv('userprofile'),'documents');
catch me  %#ok<NASGU>
  defaultdir = fullfile(getenv('userprofile'));
end
[fileName,filePath] = uigetfile([defaultdir,'\']);
if ~(filePath)
  flag = 1;
  return
end
fID = fopen(fullfile(filePath,fileName)); % Open txt file

c = 0; % Setup Counter
while ~feof(fID) % While not at end of file
    
    c = c + 1; % Increase Counter by one
    
    temp = fgetl(fID); % Store line from file in temp variable
    
		temp = strsplit(temp,'%');
		
    if ~isempty(strtrim(temp{1}))
        % Check if line is a 'comment' (%)
        
        levels(c) = length(strfind(temp{1},sprintf('\t'))); % Count number of tabs in front of a line
        names{c} = strtrim(temp{1}); % Remove whitespace from string
    else
        % If line is a comment or empty, ignore line and reduce counter by one
        c = c - 1; 
    end
end

fclose(fID); % Close txt File

[filePath] = uigetdir(filePath);
if ~(filePath)
  flag = 1;
  return
end
cd(filePath);  % CD to PDF Location

Ulevels = unique(levels); % Make a list of the different levels
Dlevels = diff(levels);   % Make a list of the change in level
Dlevels(Dlevels<0) = -1;  % Change all negative level changes into '-1'

for c = Ulevels(end):-1:1 
    % Loop through the levels from high to low
    
    if createPDF(names, levels, Dlevels,c) % Create PDFs from the documents at level 'c'
      flag = 1;
    end
    mask = levels~=c;
    names = names(mask);     % Remove the names at level 'c'
    levels = levels(mask);   % Remove the levels at level 'c'
    Dlevels = diff(levels);  % Recalculate the list of level changes
    Dlevels(Dlevels<0) = -1; % Change all negative level changes to '-1'
end

flag = 0;

cd(currentdir);

end
function [sysflag] = createPDF(names, levels, Dlevels,c)
    sysflag = 0;
    if levels(end)==c
        temp = [names{end},'.pdf'];
        flag = 0;
    else
        flag = 1;
    end
    for m = length(levels)-1:-1:1
        switch Dlevels(m)
            case 0
                if ~flag && levels(m)==c
                    temp = [names{m},'.pdf',' ',temp];
                end
            case 1
                if ~flag && levels(m)==(c-1)
                    [sysStatus,~] = system(...
                        sprintf('pdftk %s cat output %s&',temp,[names{m},'.pdf']))
                    if sysStatus
                      sysflag = 1;
                    end
                    flag = 1;
                    temp = '';
                end
            case -1
                flag = 0;
                if levels(m)==c
                    temp = [names{m},'.pdf'];
                end
        end
        
    end
end