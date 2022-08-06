function [cc,grain,labeled, RGB_label]=identifyObject(bw)
    % MUHD AIMAN BIN REDWAN
    cc = bwconncomp(bw,4) % Find & count connected component in binary image
    cc.NumObjects
    grain = false(size(bw));
    grain(cc.PixelIdxList{50}) = true;
    
    % figure,imshow(grain)
    labeled = labelmatrix(cc);%visualize 
    whos labeled

    %change to rgb
    RGB_label = label2rgb(labeled,'spring','c','shuffle');

end