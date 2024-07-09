close all

% Deckencam
% realPoseM1Tag3 = [0; 0; 0];
% realPoseM1Tag2 = [0; -0.84; 0];
% realPoseM1Tag5 = [0; 1.05; 0];
% 
% realPoseM2Tag3 = [-0.5; 0; 0];
% realPoseM2Tag2 = [-0.5; -0.8; 0];
% realPoseM2Tag5 = [-0.5; 1.05; 0];
% 
% realPoseM3Tag3 = [-0.9; 0; 0];
% realPoseM3Tag2 = [-0.9; -0.795; 0];
% realPoseM3Tag5 = [-0.9; 1.075; 0];
% 
% realPoseM4Tag3 = [-1.5; 0; 0];
% realPoseM4Tag2 = [-1.5; -0.8; 0];
% realPoseM4Tag5 = [-1.5; 1.1; 0];
% 
% realPoseM5Tag3 = [0.595; 0; 0];
% realPoseM5Tag2 = [0.595; -0.935; 0];
% realPoseM5Tag5 = [0.595; 1.27; 0];
% 
% realPoseM6Tag3 = [1.42; 0; 0];
% realPoseM6Tag2 = [1.42; -0.9; 0];
% realPoseM6Tag5 = [1.42; 0.845; 0];

% Cam1
realPoseM1Tag0 = [0; 0; 0];
realPoseM1Tag1 = [1; 1; 0];
realPoseM1Tag2 = [2; 1; 0];

realPoseM2Tag0 = [0; 1; 0];
realPoseM2Tag1 = [1; 2; 0];
realPoseM2Tag2 = [2; 2; 0];

realPoseM3Tag0 = [3; 1; 0];
realPoseM3Tag1 = [3; 0; 0];
realPoseM3Tag2 = [3; 2; 0];


numMess = 3;
tags = [0, 1, 2];


trans = struct();

for i = 1:numMess
    for j = 1:length(tags)
        
        xName = sprintf('Messungen.Messung%d.tag%d.transform.translation.x.Data', i, tags(j));
        yName = sprintf('Messungen.Messung%d.tag%d.transform.translation.y.Data', i, tags(j));
        zName = sprintf('Messungen.Messung%d.tag%d.transform.translation.z.Data', i, tags(j));
        
        
        xData = eval(xName);
        yData = eval(yName);
        zData = eval(zName);
        
        
        meanX = mean(xData);
        meanY = mean(yData);
        meanZ = mean(zData);
        
        
        transName = sprintf('Messung%d_tag%d', i, tags(j));
        trans.(transName) = [meanX; meanY; meanZ];
    end
end


rot = struct();

for i = 1:numMess

    for j = 1:length(tags)

        xrot = sprintf('Messungen.Messung%d.tag%d.transform.rotation.x.Data', i, tags(j));
        yrot = sprintf('Messungen.Messung%d.tag%d.transform.rotation.y.Data', i, tags(j));
        zrot = sprintf('Messungen.Messung%d.tag%d.transform.rotation.z.Data', i, tags(j));
        wrot = sprintf('Messungen.Messung%d.tag%d.transform.rotation.w.Data', i, tags(j));

        rotx = eval(xrot);
        roty = eval(yrot);
        rotz = eval(zrot);
        rotw = eval(wrot);

        meanxrot = mean(rotx);
        meanyrot = mean(roty);
        meanzrot = mean(rotz);
        meanwrot = mean(rotw);

        rotName = sprintf('M%d_tag%d', i, tags(j));

        rot.(rotName) = quaternion(meanwrot, meanxrot, meanyrot, meanzrot);

    end
end

Poses = struct();
alpha = struct();
mu = struct();

figure('Name','Transformed Poses with 0-Tag as Worldcoordinatesytem', 'NumberTitle', 'off')
hold on;
grid on;
xlabel('x-Achse', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('y-Achse', 'FontSize', 12, 'FontWeight', 'bold');
zlabel('z-Achse', 'FontSize', 12, 'FontWeight', 'bold');
title('Scatterplot der Messdaten über das gesamte Kamerabild');


for i = 1:numMess
    for j = 1:length(tags)

        b = rotateframe(rot.M1_tag0, transpose(trans.Messung1_tag0));

        tag = sprintf('trans.Messung%d_tag%d', i, tags(j));

        rota = sprintf('rot.M%d_tag%d', i, tags(j));

        currentrota = eval(rota);

        currentTag = eval(tag);

        currentPose = rotateframe(currentrota, transpose(currentTag)) - b;

        PoseName = sprintf('PoseM%dtag%d', i, tags(j));

        Poses.(PoseName) = currentPose;

        PlotPose = transpose(currentPose);

        h1 = scatter3(PlotPose(1), PlotPose(2), PlotPose(3), 'filled','MarkerFaceColor', 'red');
        text(PlotPose(1), PlotPose(2), PlotPose(3), PoseName, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
        
        arrayName = sprintf('realPoseM%dTag%d', i, tags(j));

        currentArray = eval(arrayName); 
        
        AlphaName = sprintf('alpha_M%dTag%d', i, tags(j));
        
        muName = sprintf('mu_M%dTag%d', i, tags(j));

        transpPose = transpose(currentPose);

        currentalphaX = currentArray(1, 1) / transpPose(1, 1);
        currentalphaY = currentArray(2, 1) / transpPose(2, 1);

        currentMu = currentArray - transpPose;

        currentY_tilde = abs(currentMu);

        if (i == 1) && (j == 1)
            lastY = currentY_tilde;
        else
            nextY = lastY + currentY_tilde;
            lastY = nextY;
        end

        alpha.(AlphaName).x = currentalphaX;
        alpha.(AlphaName).y = currentalphaY;

        mu.(muName) = currentMu;

        if i > 1
            nextmu = lastmu + currentMu;
            lastmu = nextmu;
        else
            lastmu = currentMu;
        end

        if (i == 3) && (j == 3)
            mean_mu = nextmu / 18;
        end

        h2 = scatter3(currentArray(1), currentArray(2), currentArray(3), 'filled', 'MarkerFaceColor','green');
        text(currentArray(1), currentArray(2), currentArray(3), arrayName, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');

    end
end

legend([h1, h2], {'Transformed Pose', 'Real Pose'}, 'Location', 'best');
hold off


figure('Name','New Transformed Poses with 0-Tag as Worldcoordinatesytem and alpha', 'NumberTitle', 'off')
hold on;
grid on;
xlabel('x-Achse', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('y-Achse', 'FontSize', 12, 'FontWeight', 'bold');
zlabel('z-Achse', 'FontSize', 12, 'FontWeight', 'bold');
title('New Transformed Poses with 0-Tag as Worldcoordinatesytem and alpha');

newpose = struct();
for i = 1:numMess
    for j = 1:length(tags)

       if (i == 1) && (j == 1)
           NewPose = Poses.PoseM1tag0;
           NewPoseName = sprintf('M1tag0');
           ArrayName =  sprintf('realPoseM1Tag0');
           CurrentArray = eval(ArrayName);
       else
        
            ArrayName = sprintf('realPoseM%dTag%d', i, tags(j));
    
            CurrentArray = eval(ArrayName);
    
            PosName = sprintf('Poses.PoseM%dtag%d', i, tags(j));
            
            CurrentPos = eval(PosName);
    
            AlphaName = sprintf('alpha.alpha_M%dTag%d', i, tags(j));
    
            Alpha = eval(AlphaName);
    
            A = [Alpha.x, Alpha.y];
    
            NewPoseName = sprintf('M%dtag%d', i, tags(j));
    
            NewPose(1,1) = CurrentPos(1,1) * A(1,1);
            NewPose(2,1) = CurrentPos(1,2) * A(1,2);
            NewPose(3,1) = CurrentPos(1,3);
       end
    
        newpose.(NewPoseName) = NewPose;
       
        
        h3 = scatter3(NewPose(1), NewPose(2), NewPose(3), 'filled','MarkerFaceColor', 'red');
        text(NewPose(1), NewPose(2), NewPose(3), NewPoseName, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');

        h4 = scatter3(CurrentArray(1), CurrentArray(2), CurrentArray(3), 'filled', 'MarkerFaceColor','green');
        text(CurrentArray(1), CurrentArray(2), CurrentArray(3), ArrayName, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');

    end
end

legend([h3, h4], {'New Transformed Pose', 'Real Pose'}, 'Location', 'best');
hold off


for i = 1:numMess
    for j = 1:length(tags)

        muName = sprintf('mu.mu_M%dTag%d', i, tags(j));

        currentMu = eval(muName);

        part = (currentMu - mean_mu).^2 * (1/9);

        if (i == 1) && (j == 1)
            lastpart = part;
        else
            nextpart = lastpart + part;
            lastpart = nextpart;
        end
    end
end

final_dev = sqrt(lastpart);
MAE = lastY / 9;

% figure('Name','Plot Standardverteilung', 'NumberTitle','off')
% hold on
% 
% 
% k = 1;
% for i = 1:6
%     for j = 1:length(tags)
% 
%         if (i == 1) && (j == 1)
%             k = 1;
%         else
%             nextk = k + 1;
%             k = nextk;
%         end
% 
%         Posename = sprintf('Poses.PoseM%dtag%d', i, tags(j));
%         Currentpose = eval(Posename);
% 
% 
% 
% 
% 
%         scatter(k, Currentpose(1, 1), 'MarkerFaceColor','red')
%         title('Standardverteilung der X-Werte')
% 
% 
% 
% 
%         scatter(k, Currentpose(1, 2), 'MarkerFaceColor','green')
%         title('Standardverteilung der Y-Werte')
% 
% 
% 
%         scatter(k, Currentpose(1, 3), 'MarkerFaceColor','blue')
%         title('Standardverteilung der Z-Werte')
% 
% 
%     end
% end

% hold off


        
