close all


realPoseM1Tag3 = [0; 0; 0];
realPoseM1Tag2 = [0; -0.84; 0];
realPoseM1Tag5 = [0; 1.05; 0];

realPoseM2Tag3 = [-0.5; 0; 0];
realPoseM2Tag2 = [-0.5; -0.8; 0];
realPoseM2Tag5 = [-0.5; 1.05; 0];

realPoseM3Tag3 = [-0.9; 0; 0];
realPoseM3Tag2 = [-0.9; -0.795; 0];
realPoseM3Tag5 = [-0.9; 1.075; 0];

realPoseM4Tag3 = [-1.5; 0; 0];
realPoseM4Tag2 = [-1.5; -0.8; 0];
realPoseM4Tag5 = [-1.5; 1.1; 0];

realPoseM5Tag3 = [0.595; 0; 0];
realPoseM5Tag2 = [0.595; -0.935; 0];
realPoseM5Tag5 = [0.595; 1.27; 0];

realPoseM6Tag3 = [1.42; 0; 0];
realPoseM6Tag2 = [1.42; -0.9; 0];
realPoseM6Tag5 = [1.42; 0.845; 0];

% mean(Messung1.tag2.transform.translation.x.Data);

numMess = 6;
tags = [2, 3, 5];

% Initialize a structure to store the results
trans = struct();

for i = 1:numMess
    for j = 1:length(tags)
        % Construct the variable names
        xName = sprintf('Messung%d.tag%d.transform.translation.x.Data', i, tags(j));
        yName = sprintf('Messung%d.tag%d.transform.translation.y.Data', i, tags(j));
        zName = sprintf('Messung%d.tag%d.transform.translation.z.Data', i, tags(j));
        
        % Evaluate the variable names to get the actual data
        xData = eval(xName);
        yData = eval(yName);
        zData = eval(zName);
        
        % Calculate the means
        meanX = mean(xData);
        meanY = mean(yData);
        meanZ = mean(zData);
        
        % Store the means in the structure
        transName = sprintf('Messung%d_tag%d', i, tags(j));
        trans.(transName) = [meanX; meanY; meanZ];
    end
end

rot = struct();

for i = 1:numMess

    for j = 1:length(tags)

        xrot = sprintf('Messung%d.tag%d.transform.rotation.x.Data', i, tags(j));
        yrot = sprintf('Messung%d.tag%d.transform.rotation.y.Data', i, tags(j));
        zrot = sprintf('Messung%d.tag%d.transform.rotation.z.Data', i, tags(j));
        wrot = sprintf('Messung%d.tag%d.transform.rotation.w.Data', i, tags(j));

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

Poses = struct;

 figure('Name','Transformed Poses with 0-Tag as Worldcoordinatesytem', 'NumberTitle', 'off')
hold on;
grid on;
xlabel('x-Achse', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('y-Achse', 'FontSize', 12, 'FontWeight', 'bold');
zlabel('z-Achse', 'FontSize', 12, 'FontWeight', 'bold');
title('Scatterplot der Messdaten über das gesamte Kamerabild');

for i = 1:numMess
    for j = 1:length(tags)

        b = rotateframe(rot.M1_tag3, transpose(trans.Messung1_tag3));

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


        h2 = scatter3(currentArray(1), currentArray(2), currentArray(3), 'filled', 'MarkerFaceColor','green');
        text(currentArray(1), currentArray(2), currentArray(3), arrayName, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');

    end
end

legend([h1, h2], {'Transformed Pose', 'Real Pose'}, 'Location', 'best');
hold off







