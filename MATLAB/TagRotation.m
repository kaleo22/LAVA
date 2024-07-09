x_0_0 = mean(CamTar_0_0.simout.transform.translation.x.Data);
y_0_0 = mean(CamTar_0_0.simout.transform.translation.y.Data);
z_0_0 = mean(CamTar_0_0.simout.transform.translation.z.Data);

x_0_rot = mean(CamTar_0_0.simout.transform.rotation.x.Data);
y_0_rot = mean(CamTar_0_0.simout.transform.rotation.y.Data);
z_0_rot = mean(CamTar_0_0.simout.transform.rotation.z.Data);
w_0_rot = mean(CamTar_0_0.simout.transform.rotation.w.Data);

A_Tag_0_0_trans = [x_0_0, y_0_0, z_0_0]
A_Tag_0_0_rot = quaternion([w_0_rot], [x_0_rot], [y_0_rot], [z_0_rot])

A_Tag_0_0_Pose = [transpose(A_Tag_0_0_trans); 1]

Tag_0_0_framerot = rotateframe(A_Tag_0_0_rot, A_Tag_0_0_trans)

rmtrx_0_C = rotmat(A_Tag_0_0_rot, 'frame')
eulerd_0 = eulerd(A_Tag_0_0_rot, 'XYZ', 'frame')
rmtrx_C_0 = inv(rmtrx_0_C)

quat_C_0 = quaternion(rmtrx_C_0, 'rotmat', 'frame')
eulerd_C_0 =  eulerd(quat_C_0, 'XYZ', 'frame')

x_1_1 = mean(CamTar_1_1.simout.transform.translation.x.Data);
y_1_1 = mean(CamTar_1_1.simout.transform.translation.y.Data);
z_1_1 = mean(CamTar_1_1.simout.transform.translation.z.Data);

w_1_rot = mean(CamTar_1_1.simout.transform.rotation.w.Data);
x_1_rot = mean(CamTar_1_1.simout.transform.rotation.x.Data);
y_1_rot = mean(CamTar_1_1.simout.transform.rotation.y.Data);
z_1_rot = mean(CamTar_1_1.simout.transform.rotation.z.Data);

A_Tag_1_1_trans = [x_1_1, y_1_1, z_1_1]
A_Tag_1_1_rot = quaternion([w_1_rot], [x_1_rot], [y_1_rot], [z_1_rot])
A_Tag_1_1_Pose = [transpose(A_Tag_1_1_trans); 1]
rmtrx_1_C = rotmat(A_Tag_1_1_rot, 'frame')
eulerd_1 =  eulerd(A_Tag_1_1_rot, 'XYZ', 'frame')

Abstand = norm(A_Tag_1_1_trans-A_Tag_0_0_trans)

T_C_0 = [rmtrx_C_0, transpose(A_Tag_0_0_trans); 0, 0, 0, 1]
T_1_C = [rmtrx_1_C, transpose((-1*A_Tag_1_1_trans)); 0, 0, 0, 1]

Pose_0_0 = T_C_0 * A_Tag_0_0_Pose

Pose_1_1 = T_C_0 * T_1_C * A_Tag_1_1_Pose

x_2_1 = mean(CamTar_2_1.simout.transform.translation.x.Data);
y_2_1 = mean(CamTar_2_1.simout.transform.translation.y.Data);
z_2_1 = mean(CamTar_2_1.simout.transform.translation.z.Data);

w_2_rot = mean(CamTar_2_1.simout.transform.rotation.w.Data);
x_2_rot = mean(CamTar_2_1.simout.transform.rotation.x.Data);
y_2_rot = mean(CamTar_2_1.simout.transform.rotation.y.Data);
z_2_rot = mean(CamTar_2_1.simout.transform.rotation.z.Data);

A_Tag_2_1_trans = [x_2_1, y_2_1, z_2_1]
A_Tag_2_1_rot = quaternion([w_2_rot], [x_2_rot], [y_2_rot], [z_2_rot])
A_Tag_2_1_Pose = [transpose(A_Tag_2_1_trans); 1]
rmtrx_2_C = rotmat(A_Tag_2_1_rot, 'frame')
T_2_C = [rmtrx_2_C, transpose((-1*A_Tag_2_1_trans)); 0, 0, 0, 1]
Pose_2_1 = T_C_0 * T_2_C * A_Tag_2_1_Pose

dr = HelperDrawRotation

figure('Name', ' Rotation Pose (0,0) Cam as Target, inverted', 'NumberTitle','off')
dr.drawEulerRotation(gca, eulerd_C_0)
figure('Name','Rotation Pose (0,0) Cam as Target', 'NumberTitle','off')
dr.drawEulerRotation(gca, eulerd_0)

figure ('Name','Rotation Pose (1,1) Cam as Target', 'NumberTitle','off')
dr.drawEulerRotation(gca, eulerd_1)

figure('Name','Position der Tags im Raum', 'NumberTitle','off')
scatter3(Pose_0_0(1), Pose_0_0(2), Pose_0_0(3), 'filled', 'DisplayName','Transformierte Koordinaten für (0,0)', 'MarkerFaceColor', 'blue')
hold on
scatter3(Pose_1_1(1), Pose_1_1(2), Pose_1_1(3), 'filled', 'DisplayName','Transformierte Koordinaten für (1,1)', 'MarkerFaceColor', 'red')
scatter3(Pose_2_1(1), Pose_2_1(2), Pose_2_1(3), 'filled', 'DisplayName','Transformierte Koordinaten für (2,1)', 'MarkerFaceColor', 'green')
hold off
xlabel('x-Achse', 'FontSize', 12, 'FontWeight', 'bold');   
ylabel('y-Achse', 'FontSize', 12, 'FontWeight', 'bold');   
zlabel('z-Achse', 'FontSize', 12, 'FontWeight', 'bold');
legend
title('Position der Tags im Raum')