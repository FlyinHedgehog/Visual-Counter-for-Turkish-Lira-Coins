
% counts turkish lira coins

function [prop] = coin_counter(originalImage, flag)
    
    % initialize real diameters
    dia_const_area = 0.04;
    dia_5_kurus = 0.0175;
    dia_10_kurus = 0.0185;
    dia_25_kurus = 0.0205;
    dia_50_kurus = 0.02385;
    dia_1_tl = 0.02615;
    
    % initialize real pink area
    const_area = (dia_const_area/2)^2 * pi;
    
    % initialize the fixed ratio between the pink area and the coins 
    const_5_kurus = pi*((dia_5_kurus/2)^2) / const_area;
    const_10_kurus = pi*((dia_10_kurus/2)^2) / const_area;
    const_25_kurus = pi*((dia_25_kurus/2)^2) / const_area;
    const_50_kurus = pi*((dia_50_kurus/2)^2) / const_area;
    const_1_tl = pi*((dia_1_tl/2)^2) / const_area;
    
    % initialize total money
    total = 0;  
    
    % process the image to detect coins
    image = detect_coins(originalImage);
    
    % get 
    [L, ~] = bwlabel(double(image));

    prop = regionprops(L,'Area','Centroid');
    prop = struct2table(prop);
    pink_area = max(prop.Area);

    if flag == 1
        hold on
        figure, imshow(originalImage); 
        for n = 1:size(prop,1)
            kurus = prop.Centroid(n,:);
            X = kurus(1);
            Y = kurus(2);
            if prop.Area(n) == pink_area
                continue;
            elseif (prop.Area(n) / pink_area) > (const_1_tl + ...
                    const_50_kurus) / 2
                text(X-20, Y,'1 tl') 
                total = total+100;
            elseif (prop.Area(n) / pink_area) > (const_50_kurus + ...
                    const_25_kurus) / 2
                total = total+50;
                text(X-20, Y,'50 kr') 
            elseif (prop.Area(n) / pink_area) > (const_25_kurus + ...
                    const_10_kurus) / 2
                text(X-20, Y,'25 kr') 
                total = total+25;
            elseif (prop.Area(n) / pink_area) > (const_10_kurus + ...
                    const_5_kurus) / 2
                text(X-20, Y,'10 kr') 
                total = total+10;
            elseif (prop.Area(n) / pink_area) > (const_5_kurus + 0) / 2
                text(X-20, Y,'5 kr') 
                total = total+5;
            end
        end
        coinCount = num2str(total/100);
        title(['Total money: ', coinCount,' tl']);
        hold off
        return;       
    else
        for n = 1:size(prop,1)
            if prop.Area(n) == pink_area
                continue;
            elseif (prop.Area(n) / pink_area) > (const_1_tl + ...
                    const_50_kurus) / 2 
                total = total+100;
            elseif (prop.Area(n) / pink_area) > (const_50_kurus + ...
                    const_25_kurus) / 2
                total = total+50;
            elseif (prop.Area(n) / pink_area) > (const_25_kurus + ...
                    const_10_kurus) / 2
                total = total+25;
            elseif (prop.Area(n) / pink_area) > (const_10_kurus + ...
                    const_5_kurus) / 2
                total = total+10;
            elseif (prop.Area(n) / pink_area) > (const_5_kurus + 0) / 2
                total = total+5;
            end
        end
        coinCount = num2str(total/100);
        fprintf(['Total money: ' coinCount ' tl\n']);
    end
    
end