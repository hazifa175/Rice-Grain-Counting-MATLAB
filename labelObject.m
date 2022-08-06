function [s,k,c]=labelObject(L,I)
    % NORHAZIFA BINTI HARUM
    s = regionprops(L, 'Centroid'); % see label of each object
    imshow(I)
    hold on
    for k = 1:numel(s)
        c = s(k).Centroid;
        text(c(1), c(2), sprintf('%d', k), ...
            'HorizontalAlignment', 'center', ...
            'VerticalAlignment', 'middle');
    end
    hold off
end