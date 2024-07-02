close all

x_Mitte = mean(Cam2Tar_Mitte.simout.transform.translation.x.Data);
y_Mitte = mean(Cam2Tar_Mitte.simout.transform.translation.y.Data);
z_Mitte = mean(Cam2Tar_Mitte.simout.transform.translation.z.Data);

x_rotation_Mitte = mean(Cam2Tar_Mitte.simout.transform.rotation.x.Data);
y_rotation_Mitte = mean(Cam2Tar_Mitte.simout.transform.rotation.y.Data);
z_rotation_Mitte = mean(Cam2Tar_Mitte.simout.transform.rotation.z.Data);
w_rotation_Mitte = mean(Cam2Tar_Mitte.simout.transform.rotation.w.Data);

A_Tag_Mitte_trans = [x_Mitte, y_Mitte, z_Mitte]

A_Tag_Mitte_Rot = quaternion(x_rotation_Mitte, y_rotation_Mitte, z_rotation_Mitte, w_rotation_Mitte)

A_Tag_Mitte_Trans = [A_Tag_Mitte_trans, 1]
A_Tag_Mitte_Pose = transpose(A_Tag_Mitte_Trans);

rmtrx_C_Mitte = rotmat(A_Tag_Mitte_Rot, 'frame')

eulerd_Mitte = eulerd(A_Tag_Mitte_Rot, 'XYZ', 'frame')

T_C_Mitte = [rmtrx_C_Mitte, transpose((-1*A_Tag_Mitte_trans)); 0, 0, 0, 1]

Pose_Mitte_Probe = rmtrx_C_Mitte * transpose(A_Tag_Mitte_trans) - rmtrx_C_Mitte * transpose(A_Tag_Mitte_trans)
Pose_Mitte = T_C_Mitte * A_Tag_Mitte_Pose

x_1y = mean(CamTarCam2_1y.simout.transform.translation.x.Data);
y_1y = mean(CamTarCam2_1y.simout.transform.translation.y.Data);
z_1y = mean(CamTarCam2_1y.simout.transform.translation.z.Data);

x_rotation_1y = mean(CamTarCam2_1y.simout.transform.rotation.x.Data);
y_rotation_1y = mean(CamTarCam2_1y.simout.transform.rotation.y.Data);
z_rotation_1y = mean(CamTarCam2_1y.simout.transform.rotation.z.Data);
w_rotation_1y = mean(CamTarCam2_1y.simout.transform.rotation.w.Data);

A_Tag_1y_trans = [x_1y, y_1y, z_1y]

A_Tag_1y_Rot = quaternion(x_rotation_1y, y_rotation_1y, z_rotation_1y, w_rotation_1y)

A_Tag_1y_Trans = [A_Tag_1y_trans, 1]
A_Tag_1y_Pose = transpose(A_Tag_1y_Trans);

rmtrx_C_1y = rotmat(A_Tag_1y_Rot, 'frame');

eulerd_1y = eulerd(A_Tag_1y_Rot, 'XYZ', 'frame')

T_C_1y = [rmtrx_C_1y, transpose(A_Tag_1y_trans); 0, 0, 0, 1]

Pose_1y = T_C_Mitte * A_Tag_1y_Pose
Pose_1y_Probe = rmtrx_C_Mitte * transpose(A_Tag_1y_trans) - rmtrx_C_Mitte * transpose(A_Tag_Mitte_trans)
Pose_1y_Probe = Pose_1y_Probe * 0.8102

x_1x = mean(CamTarCam2_1x.simout.transform.translation.x.Data);
y_1x = mean(CamTarCam2_1x.simout.transform.translation.y.Data);
z_1x = mean(CamTarCam2_1x.simout.transform.translation.z.Data);

x_rotation_1x = mean(CamTarCam2_1x.simout.transform.rotation.x.Data);
y_rotation_1x = mean(CamTarCam2_1x.simout.transform.rotation.y.Data);
z_rotation_1x = mean(CamTarCam2_1x.simout.transform.rotation.z.Data);
w_rotation_1x = mean(CamTarCam2_1x.simout.transform.rotation.w.Data);

A_Tag_1x_trans = [x_1x, y_1x, z_1x]

A_Tag_1x_Rot = quaternion(x_rotation_1x, y_rotation_1x, z_rotation_1x, w_rotation_1x)

A_Tag_1x_Trans = [A_Tag_1x_trans, 1]
A_Tag_1x_Pose = transpose(A_Tag_1x_Trans);

rmtrx_C_1x = rotmat(A_Tag_1x_Rot, 'frame');

eulerd_1x = eulerd(A_Tag_1x_Rot, 'XYZ', 'frame')

T_C_1x = [rmtrx_C_1x, transpose(A_Tag_1x_trans); 0, 0, 0, 1]

Pose_1x = T_C_Mitte * A_Tag_1x_Pose
Pose_1x_Probe = rmtrx_C_Mitte * transpose(A_Tag_1x_trans) - rmtrx_C_Mitte * transpose(A_Tag_Mitte_trans)
Pose_1x_Probe = Pose_1x_Probe * 0.8102

% dr = HelperDrawRotation;

% figure('Name','versuch Lösung in 2D', 'NumberTitle','off')
% dr.drawEulerRotation(gca, eulerd_1y)

figure('Name','Scatterplot für Messwerte der Deckencam', 'NumberTitle','off')
scatter3(Pose_1y_Probe(1), Pose_1y_Probe(2), Pose_1y_Probe(3), 'filled', 'MarkerFaceColor', 'red', 'DisplayName', 'Pose y shifted')
hold on
scatter3(Pose_Mitte_Probe(1), Pose_Mitte_Probe(2), Pose_Mitte_Probe(3),'filled', 'MarkerFaceColor', 'blue', 'DisplayName', 'Pose Mitte Cam')
scatter3(Pose_1x_Probe(1), Pose_1x_Probe(2), Pose_1x_Probe(3), 'filled', 'MarkerFaceColor', 'magenta', 'DisplayName', 'Pose x shifted')
xlabel('x-Achse', 'FontSize', 12, 'FontWeight', 'bold');   % Beschriftet die x-Achse mit größerer Schrift und fett
ylabel('y-Achse', 'FontSize', 12, 'FontWeight', 'bold');   % Beschriftet die y-Achse mit größerer Schrift und fett
zlabel('z-Achse', 'FontSize', 12, 'FontWeight', 'bold');   % Beschriftet die z-Achse mit größerer Schrift und fett (nur für 3D-Plots)
legend
