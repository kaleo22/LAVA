x_0_0 = mean(TagTar_0_0.simout.transform.translation.x.Data);
y_0_0 = mean(TagTar_0_0.simout.transform.translation.y.Data);
z_0_0 = mean(TagTar_0_0.simout.transform.translation.z.Data);

x_0_rot = mean(TagTar_0_0.simout.transform.rotation.x.Data)
y_0_rot = mean(TagTar_0_0.simout.transform.rotation.y.Data);
z_0_rot = mean(TagTar_0_0.simout.transform.rotation.z.Data);
w_0_rot = mean(TagTar_0_0.simout.transform.rotation.w.Data);

A_Tag_0_0_trans = [x_0_0, y_0_0, z_0_0]
A_Tag_0_0_rot = quaternion([w_0_rot], [x_0_rot], [y_0_rot], [z_0_rot])

A_Tag_0_0_Pose = [transpose(A_Tag_0_0_trans); 1]

Tag_0_0_framerot = rotateframe(A_Tag_0_0_rot, A_Tag_0_0_trans)

rmtrx_0_C = rotmat(A_Tag_0_0_rot, 'frame')
eulerd_0 = eulerd(A_Tag_0_0_rot, 'ZYX', 'frame')
rmtrx_C_0 = inv(rmtrx_0_C)

x_1_1 = mean(TagTar_1_1.simout.transform.translation.x.Data);
y_1_1 = mean(TagTar_1_1.simout.transform.translation.y.Data);
z_1_1 = mean(TagTar_1_1.simout.transform.translation.z.Data);

w_1_rot = mean(TagTar_1_1.simout.transform.rotation.w.Data);
x_1_rot = mean(TagTar_1_1.simout.transform.rotation.x.Data);
y_1_rot = mean(TagTar_1_1.simout.transform.rotation.y.Data);
z_1_rot = mean(TagTar_1_1.simout.transform.rotation.z.Data);

A_Tag_1_1_trans = [x_1_1, y_1_1, z_1_1]
A_Tag_1_1_rot = quaternion([w_1_rot], [x_1_rot], [y_1_rot], [z_1_rot])
A_Tag_1_1_Pose = [transpose(A_Tag_1_1_trans); 1]
rmtrx_1_C = rotmat(A_Tag_1_1_rot, 'frame')
eulerd_1 =  eulerd(A_Tag_1_1_rot, 'ZYX', 'frame')

Abstand = norm(A_Tag_1_1_trans-A_Tag_0_0_trans)

T_C_0 = [rmtrx_C_0, transpose(A_Tag_0_0_trans); 0, 0, 0, 1]
T_1_C = [rmtrx_1_C, transpose(A_Tag_1_1_trans); 0, 0, 0, 1]

Pose_1_1 = T_C_0 * T_1_C * A_Tag_1_1_Pose

dr = HelperDrawRotation
figure('Name','Rotation Pose (0,0) Tag as Target', 'NumberTitle','off')
dr.drawEulerRotation(gca, eulerd_0)

figure ('Name','Rotation Pose (1,1) Tag as Target', 'NumberTitle','off')
dr.drawEulerRotation(gca, eulerd_1)