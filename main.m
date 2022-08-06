clc       % this clear the screen
close all % this closes all figures
clear all % this clears the workspace

% Assign image into variable
img='rice.jpeg'

% Function: read.m file - AIN FATIHAH AIMAN BINTI MOHD YUSSUF
% read image, convert to greyscale, covert to binary
[a, I, bw ]=read(img) 

% Function: identifyObject.m - MUHAMMAD AIMAN BIN REDUAN
[cc,grain,labeled, RGB_label]=identifyObject(bw)


%Computer Area-Based Statistic - NORHAZIFA BINTI HARUM
graindata = regionprops(cc,'basic') %display basic properties 
grain_areas = [graindata.Area]; %holds the area measurement for each grain.
grain_areas(50) %Find the area of the 50th component.
[min_area, idx] = min(grain_areas) % the grain with the smallest area.
[max_area, idx] = max(grain_areas) % the grain with the largest area.
grain = false(size(bw));
grain(cc.PixelIdxList{idx}) = true;

L = bwlabel(I); % label each object
%Step 2: see the label of each object

%Function: labelObject.m 
[s,k,c]=labelObject(L,I)

% Step 3: find the area of the object you want using its label
Total_value=0;
Standard=0;
Area_1=0;
figure
for k = 1:numel(s)

Obj = (L == k);   %  is the label number of the first object. 
Area_1 = regionprops(Obj,'Area') % determine each rice grain area

for (k=1)
%figure
imshow(Obj);

end
%depend on the picture size
%count total rice grain that bigger than 300
if (Area_1.Area >300) 
    Total_value=Total_value + 1;
else
    Total_value=Total_value + 0;
end
%standard size of rice grain between 500 and 800
if ((Area_1.Area >500)&&(Area_1.Area <800))
    Standard=Standard + 1;
else
    Standard=Standard + 0; 
end

end
close
figure,imshow(RGB_label),title('RGB')
figure,histogram(grain_areas),title('Graph Number of Grain Rice vs. Size of Rice Grain')
h = msgbox(['The total number of rice grains ' num2str(Total_value)], 'Count Rice Grain')
h = msgbox(['The total number of rice grains that fits the standards ' num2str(Standard)], 'Count Standard Rice Grain')




