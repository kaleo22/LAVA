x_0_0 = mean(Tag_0_0.simout.transform.translation.x.Data);
y_0_0 = mean(Tag_0_0.simout.transform.translation.y.Data);
z_0_0 = mean(Tag_0_0.simout.transform.translation.z.Data);

A_Tag_0_mean = [x_0_0; y_0_0; z_0_0]

x_0_rot = mean(Tag_0_0.simout.transform.rotation.x.Data);
y_0_rot = mean(Tag_0_0.simout.transform.rotation.y.Data);
z_0_rot = mean(Tag_0_0.simout.transform.rotation.z.Data);

X_0_rotated = [1, 0 , 0 ; 0, cos(x_0_rot), -sin(x_0_rot) ; 0 , sin(x_0_rot), cos(x_0_rot)] * A_Tag_0_mean;
Y_0_rotated = [cos(y_0_rot), 0, sin(y_0_rot); 0, 1, 0; -sin(y_0_rot), 0, cos(y_0_rot)] * X_0_rotated;
Z_0_rotated = [cos(z_0_rot), -sin(z_0_rot), 0; sin(z_0_rot), cos(z_0_rot), 0; 0, 0, 1] * Y_0_rotated

x_1_1 = mean(Tag_1_1.simout.transform.translation.x.Data);
y_1_1 = mean(Tag_1_1.simout.transform.translation.y.Data);
z_1_1 = mean(Tag_1_1.simout.transform.translation.z.Data);

A_Tag_1_mean = [x_1_1; y_1_1; z_1_1]


x_1_rot = mean(Tag_1_1.simout.transform.rotation.x.Data);
y_1_rot = mean(Tag_1_1.simout.transform.rotation.y.Data);
z_1_rot = mean(Tag_1_1.simout.transform.rotation.z.Data);


X_1_rotated = [1, 0 , 0 ; 0, cos(x_1_rot), -sin(x_1_rot) ; 0 , sin(x_1_rot), cos(x_1_rot)] * A_Tag_1_mean;
Y_1_rotated = [cos(y_1_rot), 0, sin(y_1_rot); 0, 1, 0; -sin(y_1_rot), 0, cos(y_1_rot)] * X_1_rotated;
Z_1_rotated = [cos(z_1_rot), -sin(z_1_rot), 0; sin(z_1_rot), cos(z_1_rot), 0; 0, 0, 1] * Y_1_rotated

Pose_1_1 = Z_1_rotated*0.9652 - Z_0_rotated

x_2_1 = mean(Tag_2x_1y.simout.transform.translation.x.Data);
y_2_1 = mean(Tag_2x_1y.simout.transform.translation.y.Data);
z_2_1 = mean(Tag_2x_1y.simout.transform.translation.z.Data);

A_Tag_2_1_mean = [x_2_1; y_2_1; z_2_1]

x_2_1_rot = mean(Tag_2x_1y.simout.transform.rotation.x.Data);
y_2_1_rot = mean(Tag_2x_1y.simout.transform.rotation.y.Data);
z_2_1_rot = mean(Tag_2x_1y.simout.transform.rotation.z.Data);

X_2_1_rotated = [1, 0 , 0 ; 0, cos(x_2_1_rot), -sin(x_2_1_rot) ; 0 , sin(x_2_1_rot), cos(x_2_1_rot)] * A_Tag_2_1_mean;
Y_2_1_rotated = [cos(y_2_1_rot), 0, sin(y_2_1_rot); 0, 1, 0; -sin(y_2_1_rot), 0, cos(y_2_1_rot)] * X_2_1_rotated;
Z_2_1_rotated = [cos(z_2_1_rot), -sin(z_2_1_rot), 0; sin(z_2_1_rot), cos(z_2_1_rot), 0; 0, 0, 1] * Y_2_1_rotated

Pose_2_1 = Z_2_1_rotated*1.0406 - Z_0_rotated