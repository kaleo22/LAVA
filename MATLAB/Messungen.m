close all

Tag_Zentrum_x = mean(Messung1.tag3.transform.translation.x.Data);
Tag_Zentrum_y = mean(Messung1.tag3.transform.translation.y.Data);
Tag_Zentrum_z = mean(Messung1.tag3.transform.translation.z.Data);

M1_Zen_trans = [Tag_Zentrum_x; Tag_Zentrum_y; Tag_Zentrum_z];

Tag_Zentrum_rotx = mean(Messung1.tag3.transform.rotation.x.Data);
Tag_Zentrum_roty = mean(Messung1.tag3.transform.rotation.y.Data);
Tag_Zentrum_rotz = mean(Messung1.tag3.transform.rotation.z.Data);
Tag_Zentrum_rotw = mean(Messung1.tag3.transform.rotation.w.Data);

M1_Zen_rot = quaternion(Tag_Zentrum_rotx, Tag_Zentrum_roty, Tag_Zentrum_rotz, Tag_Zentrum_rotw);

rmtrx_Zen = rotmat(M1_Zen_rot, 'frame')

Pose_M1_Zen = rmtrx_Zen * M1_Zen_trans - rmtrx_Zen * M1_Zen_trans;

Tag_y_84_x = mean(Messung1.tag2.transform.translation.x.Data);
Tag_y_84_y = mean(Messung1.tag2.transform.translation.y.Data);
Tag_y_84_z = mean(Messung1.tag2.transform.translation.z.Data);

M1_Tag2_trans = [Tag_y_84_x; Tag_y_84_y; Tag_y_84_z];

Pose_M1_Tag2 = rmtrx_Zen * M1_Tag2_trans - rmtrx_Zen * M1_Zen_trans

Tag_y_1205_x = mean(Messung1.tag5.transform.translation.x.Data);
Tag_y_1205_y = mean(Messung1.tag5.transform.translation.y.Data);
Tag_y_1205_z = mean(Messung1.tag5.transform.translation.z.Data);

M1_Tag5_trans = [Tag_y_1205_x; Tag_y_1205_y; Tag_y_1205_z];

Pose_M1_Tag5 = rmtrx_Zen * M1_Tag5_trans - rmtrx_Zen * M1_Zen_trans

M2_50_x_x = mean(Messung2.tag3.transform.translation.x.Data);
M2_50_x_y = mean(Messung2.tag3.transform.translation.y.Data);
M2_50_x_z = mean(Messung2.tag3.transform.translation.z.Data);

M2_Tag3_trans = [M2_50_x_x; M2_50_x_y; M2_50_x_z];

Pose_M2_Tag3 = rmtrx_Zen * M2_Tag3_trans - rmtrx_Zen * M1_Zen_trans

M2_y_80_x = mean(Messung2.tag2.transform.translation.x.Data);
M2_y_80_y = mean(Messung2.tag2.transform.translation.y.Data);
M2_y_80_z = mean(Messung2.tag2.transform.translation.z.Data);

M2_Tag2_trans = [M2_y_80_x; M2_y_80_y; M2_y_80_z];

Pose_M2_Tag2 = rmtrx_Zen * M2_Tag2_trans - rmtrx_Zen * M1_Zen_trans

M2_y_105_x = mean(Messung2.tag5.transform.translation.x.Data);
M2_y_105_y = mean(Messung2.tag5.transform.translation.y.Data);
M2_y_105_z = mean(Messung2.tag5.transform.translation.z.Data);

M2_Tag5_trans = [M2_y_105_x; M2_y_105_y; M2_y_105_z];

Pose_M2_Tag5 = rmtrx_Zen * M2_Tag5_trans - rmtrx_Zen * M1_Zen_trans

M3_90_x_x = mean(Messung3.tag3.transform.translation.x.Data);
M3_90_x_y = mean(Messung3.tag3.transform.translation.y.Data);
M3_90_x_z = mean(Messung3.tag3.transform.translation.z.Data);

M3_Tag3_trans = [M3_90_x_x; M3_90_x_y; M3_90_x_z];

Pose_M3_Tag3 = rmtrx_Zen * M3_Tag3_trans - rmtrx_Zen * M1_Zen_trans

M3_y_795_x = mean(Messung3.tag2.transform.translation.x.Data);
M3_y_795_y = mean(Messung3.tag2.transform.translation.y.Data);
M3_y_795_z = mean(Messung3.tag2.transform.translation.z.Data);

M3_Tag2_trans = [M3_y_795_x; M3_y_795_y; M3_y_795_z];

Pose_M3_Tag2 = rmtrx_Zen * M3_Tag2_trans - rmtrx_Zen * M1_Zen_trans

M3_y_1075_x = mean(Messung3.tag5.transform.translation.x.Data);
M3_y_1075_y = mean(Messung3.tag5.transform.translation.y.Data);
M3_y_1075_z = mean(Messung3.tag5.transform.translation.z.Data);

M3_Tag5_trans = [M3_y_1075_x;  M3_y_1075_y; M3_y_1075_z]

Pose_M3_Tag5 = rmtrx_Zen * M3_Tag5_trans - rmtrx_Zen * M1_Zen_trans

M4_150_x_x = mean(Messung4.tag3.transform.translation.x.Data);
M4_150_x_y = mean(Messung4.tag3.transform.translation.y.Data);
M4_150_x_z = mean(Messung4.tag3.transform.translation.z.Data);

M4_Tag3_trans = [M4_150_x_x; M4_150_x_y; M4_150_x_z];

Pose_M4_Tag3 = rmtrx_Zen * M4_Tag3_trans - rmtrx_Zen * M1_Zen_trans

M4_y_80_x = mean(Messung4.tag2.transform.translation.x.Data);
M4_y_80_y = mean(Messung4.tag2.transform.translation.y.Data);
M4_y_80_z = mean(Messung4.tag2.transform.translation.z.Data);

M4_Tag2_trans = [M4_y_80_x; M4_y_80_y; M4_y_80_z];

Pose_M4_Tag2 = rmtrx_Zen * M4_Tag2_trans - rmtrx_Zen * M1_Zen_trans

M4_y_110_x = mean(Messung4.tag5.transform.translation.x.Data);
M4_y_110_y = mean(Messung4.tag5.transform.translation.y.Data);
M4_y_110_z = mean(Messung4.tag5.transform.translation.z.Data);

M4_Tag5_trans = [M4_y_110_x; M4_y_110_y; M4_y_110_z];

Pose_M4_Tag5 = rmtrx_Zen * M4_Tag5_trans - rmtrx_Zen * M1_Zen_trans

M5_minus595_x_x = mean(Messung5.tag3.transform.translation.x.Data);
M5_minus595_x_y = mean(Messung5.tag3.transform.translation.y.Data);
M5_minus595_x_z = mean(Messung5.tag3.transform.translation.z.Data);

M5_Tag3_trans = [M5_minus595_x_x; M5_minus595_x_y; M5_minus595_x_z];

Pose_M5_Tag3 = rmtrx_Zen * M5_Tag3_trans - rmtrx_Zen * M1_Zen_trans

M5_y_935_x = mean(Messung5.tag2.transform.translation.x.Data);
M5_y_935_y = mean(Messung5.tag2.transform.translation.y.Data);
M5_y_935_z = mean(Messung5.tag2.transform.translation.z.Data);

M5_Tag2_trans = [M5_y_935_x; M5_y_935_y; M5_y_935_z];

Pose_M5_Tag2 = rmtrx_Zen * M5_Tag2_trans - rmtrx_Zen * M1_Zen_trans

M5_y_127_x = mean(Messung5.tag5.transform.translation.x.Data);
M5_y_127_y = mean(Messung5.tag5.transform.translation.y.Data);
M5_y_127_z = mean(Messung5.tag5.transform.translation.z.Data);

M5_Tag5_trans = [M5_y_127_x; M5_y_127_y; M5_y_127_z];

Pose_M5_Tag5 = rmtrx_Zen * M5_Tag5_trans - rmtrx_Zen * M1_Zen_trans

M6_142_x_x = mean(Messung6.tag3.transform.translation.x.Data);
M6_142_x_y = mean(Messung6.tag3.transform.translation.y.Data);
M6_142_x_z = mean(Messung6.tag3.transform.translation.z.Data);

M6_Tag3_trans = [M6_142_x_x; M6_142_x_y; M6_142_x_z];
 
Pose_M6_Tag3 = rmtrx_Zen * M6_Tag3_trans - rmtrx_Zen * M1_Zen_trans

M6_y_90_x = mean(Messung6.tag2.transform.translation.x.Data);
M6_y_90_y = mean(Messung6.tag2.transform.translation.y.Data);
M6_y_90_z = mean(Messung6.tag2.transform.translation.z.Data);

M6_Tag2_trans = [M6_y_90_x; M6_y_90_y; M6_y_90_z];

Pose_M6_Tag2 = rmtrx_Zen * M6_Tag2_trans - rmtrx_Zen * M1_Zen_trans

M6_y_845_x = mean(Messung6.tag5.transform.translation.x.Data);
M6_y_845_y = mean(Messung6.tag5.transform.translation.y.Data);
M6_y_845_z = mean(Messung6.tag5.transform.translation.z.Data);

M6_Tag5_trans = [M6_y_845_x; M6_y_845_y; M6_y_845_z];

Pose_M6_Tag5 = rmtrx_Zen * M6_Tag5_trans - rmtrx_Zen * M1_Zen_trans

%reale Messwerte

real_Pose_M1_Tag3 = [0; 0; 0];
real_Pose_M1_Tag2 = [0; -0.84; 0];
real_Pose_M1_Tag5 = [0; 1.05; 0];

real_Pose_M2_Tag3 = [-0.5; 0; 0];
real_Pose_M2_Tag2 = [-0.5; -0.8; 0];
real_Pose_M2_Tag5 = [-0.5; 1.05; 0];

real_Pose_M3_Tag3 = [-0.9; 0; 0];
real_Pose_M3_Tag2 = [-0.9; -0.795; 0];
real_Pose_M3_Tag5 = [-0.9; 1.075; 0];

real_Pose_M4_Tag3 = [-1.5; 0; 0];
real_Pose_M4_Tag2 = [-1.5; -0.8; 0];
real_Pose_M4_Tag5 = [-1.5; 1.1; 0];

real_Pose_M5_Tag3 = [0.595; 0; 0];
real_Pose_M5_Tag2 = [0.595; -0.935; 0];
real_Pose_M5_Tag5 = [0.595; 1.27; 0];

real_Pose_M6_Tag3 = [1.42; 0; 0];
real_Pose_M6_Tag2 = [1.42; -0.9; 0];
real_Pose_M6_Tag5 = [1.42; 0.845; 0];



numPoses = 6;
numTags = [2, 3, 5];


figure('Name','Scatterplot der Messdaten über das gesamte Kamerabild', 'NumberTitle','off');
hold on;
grid on;
xlabel('x-Achse', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('y-Achse', 'FontSize', 12, 'FontWeight', 'bold');
zlabel('z-Achse', 'FontSize', 12, 'FontWeight', 'bold');
title('Scatterplot der Messdaten über das gesamte Kamerabild');

 


for i = 1:numPoses
    for j = 1:length(numTags)
        tag = numTags(j);
        
        
        varName = sprintf('Pose_M%d_Tag%d', i, tag);
        
        
        if exist(varName, 'var')
            
            pose = eval(varName);
            x_values = pose(1, :);
            y_values = pose(2, :);
            z_values = pose(3, :);
            
            
            scatter3(x_values, y_values, z_values, 'r', 'filled');
        end
    end
end

for i = 1:numPoses
    
    for j = 1:length(numTags)
        
        arrayName = sprintf('real_Pose_M%d_Tag%d', i, numTags(j));
       
        currentArray = eval(arrayName); 
        
        
        scatter3(currentArray(1), currentArray(2), currentArray(3), 'filled', 'MarkerFaceColor','green');
    end
end

scatter3(Pose_M1_Zen(1, :), Pose_M1_Zen(2, :), Pose_M1_Zen(3, :), 'filled', 'MarkerFaceColor','b');

d = Pose_M6_Tag2 - Pose_M4_Tag2;
r = linspace(0,1, 10);
x = Pose_M4_Tag2(1) + r * d(1);
y = Pose_M4_Tag2(2) + r * d(2);
z = Pose_M4_Tag2(3) + r * d(3);
plot3(x, y, z, 'Color', 'magenta')

d2 = Pose_M6_Tag2 - Pose_M6_Tag5;

x2 = Pose_M6_Tag5(1) + r * d2(1);
y2 = Pose_M6_Tag5(2) + r * d2(2);
z2 = Pose_M6_Tag5(3) + r * d2(3);
plot3(x2, y2, z2, 'Color', 'magenta')

d3 = Pose_M4_Tag2 - Pose_M4_Tag5;

x3 = Pose_M4_Tag5(1) + r * d3(1);
y3 = Pose_M4_Tag5(2) + r * d3(2);
z3 = Pose_M4_Tag5(3) + r * d3(3);
plot3(x3, y3, z3, 'Color', 'magenta')

d4 = Pose_M6_Tag5 - Pose_M4_Tag5;

x4 = Pose_M4_Tag5(1) + r * d4(1);
y4 = Pose_M4_Tag5(2) + r * d4(2);
z4 = Pose_M4_Tag5(3) + r * d4(3);
plot3(x4, y4, z4, 'Color', 'magenta')

hold off;



