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

Pose_Mitte = T_C_Mitte * A_Tag_Mitte_Pose

% dr = HelperDrawRotation;

% figure('Name','versuch Lösung in 2D', 'NumberTitle','off')
% dr.drawEulerRotation(gca, eulerd_Mitte)

x_Mitte_Plot = Cam2Tar_Mitte.simout.transform.translation.x.Data;
y_Mitte_Plot = Cam2Tar_Mitte.simout.transform.translation.y.Data;
z_Mitte_Plot = Cam2Tar_Mitte.simout.transform.translation.z.Data;

figure('Name','Scatterplot für Messwerte der Deckencam', 'NumberTitle','off')
scatter3(Pose_Mitte(1), Pose_Mitte(2), Pose_Mitte(3))
xlabel('x-Achse', 'FontSize', 12, 'FontWeight', 'bold');   % Beschriftet die x-Achse mit größerer Schrift und fett
ylabel('y-Achse', 'FontSize', 12, 'FontWeight', 'bold');   % Beschriftet die y-Achse mit größerer Schrift und fett
zlabel('z-Achse', 'FontSize', 12, 'FontWeight', 'bold');   % Beschriftet die z-Achse mit größerer Schrift und fett (nur für 3D-Plots)
legend