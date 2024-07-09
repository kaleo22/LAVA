close all

alpha = 0.8102;

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
Pose_1y_Probe = (rmtrx_C_Mitte * transpose(A_Tag_1y_trans) - rmtrx_C_Mitte * transpose(A_Tag_Mitte_trans)) * alpha


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
Pose_1x_Probe = (rmtrx_C_Mitte * transpose(A_Tag_1x_trans) - rmtrx_C_Mitte * transpose(A_Tag_Mitte_trans)) * alpha

links_mx = mean(linksmitte.simout.transform.translation.x.Data);
links_my = mean(linksmitte.simout.transform.translation.y.Data);
links_mz = mean(linksmitte.simout.transform.translation.z.Data);

A_Tag_linksm_trans = [links_mx, links_my, links_mz];

links_ox = mean(linksoben.simout.transform.translation.x.Data);
links_oy = mean(linksoben.simout.transform.translation.y.Data);
links_oz = mean(linksoben.simout.transform.translation.z.Data);

A_Tag_linkso_trans = [links_ox, links_oy, links_oz];

links_ux = mean(linksunten.simout.transform.translation.x.Data);
links_uy = mean(linksunten.simout.transform.translation.y.Data);
links_uz = mean(linksunten.simout.transform.translation.z.Data);

A_Tag_linksu_trans = [links_ux, links_uy, links_uz];

rechts_mx = mean(rechtsmitte.simout.transform.translation.x.Data);
rechts_my = mean(rechtsmitte.simout.transform.translation.y.Data);
rechts_mz = mean(rechtsmitte.simout.transform.translation.z.Data);

A_Tag_rechtsm_trans = [rechts_mx, rechts_my, rechts_mz];

rechts_ox_72 = mean(rechtsoben_mittigver_72.simout.transform.translation.x.Data);
rechts_oy_72 = mean(rechtsoben_mittigver_72.simout.transform.translation.y.Data);
rechts_oz_72 = mean(rechtsoben_mittigver_72.simout.transform.translation.z.Data);

A_Tag_rechtso_trans = [rechts_ox_72, rechts_oy_72, rechts_oz_72];

rechts_ux_30 = mean(rechtsunten_mittigver_30.simout.transform.translation.x.Data);
rechts_uy_30 = mean(rechtsunten_mittigver_30.simout.transform.translation.y.Data);
rechts_uz_30 = mean(rechtsunten_mittigver_30.simout.transform.translation.z.Data);

A_Tag_rechtsu_trans = [rechts_ux_30, rechts_uy_30, rechts_uz_30];

Pose_linkso = (rmtrx_C_Mitte * transpose(A_Tag_linkso_trans) - rmtrx_C_Mitte * transpose(A_Tag_Mitte_trans)) * alpha
Pose_linksm = (rmtrx_C_Mitte * transpose(A_Tag_linksm_trans) - rmtrx_C_Mitte * transpose(A_Tag_Mitte_trans)) * alpha
Pose_linksu = (rmtrx_C_Mitte * transpose(A_Tag_linksu_trans) - rmtrx_C_Mitte * transpose(A_Tag_Mitte_trans)) * alpha
Pose_rechtso = (rmtrx_C_Mitte * transpose(A_Tag_rechtso_trans) - rmtrx_C_Mitte * transpose(A_Tag_Mitte_trans)) * alpha
Pose_rechtsm = (rmtrx_C_Mitte * transpose(A_Tag_rechtsm_trans) - rmtrx_C_Mitte * transpose(A_Tag_Mitte_trans)) * alpha
Pose_rechtsu = (rmtrx_C_Mitte * transpose(A_Tag_rechtsu_trans) - rmtrx_C_Mitte * transpose(A_Tag_Mitte_trans)) * alpha



% dr = HelperDrawRotation;

% figure('Name','versuch Lösung in 2D', 'NumberTitle','off')
% dr.drawEulerRotation(gca, eulerd_1y)

figure('Name','Scatterplot für Messwerte der Deckencam', 'NumberTitle','off')
scatter3(Pose_1y_Probe(1), Pose_1y_Probe(2), Pose_1y_Probe(3), 'filled', 'MarkerFaceColor', 'red', 'DisplayName', 'Pose y shifted')
hold on
scatter3(Pose_Mitte_Probe(1), Pose_Mitte_Probe(2), Pose_Mitte_Probe(3),'filled', 'MarkerFaceColor', 'blue', 'DisplayName', 'Pose Mitte Cam')
scatter3(Pose_1x_Probe(1), Pose_1x_Probe(2), Pose_1x_Probe(3), 'filled', 'MarkerFaceColor', 'magenta', 'DisplayName', 'Pose x shifted')


scatter3(Pose_linkso(1), Pose_linkso(2), Pose_linkso(3), 'filled', 'MarkerFaceColor', [0.5, 0, 1], 'DisplayName', 'links oben')
scatter3(Pose_linksm(1), Pose_linksm(2), Pose_linksm(3), 'filled', 'MarkerFaceColor', 'magenta', 'DisplayName', 'links mittig')
scatter3(Pose_linksu(1), Pose_linksu(2), Pose_linksu(3), 'filled', 'MarkerFaceColor', 'magenta', 'DisplayName', 'links unten')
scatter3(Pose_rechtso(1), Pose_rechtso(2), Pose_rechtso(3), 'filled', 'MarkerFaceColor', 'magenta', 'DisplayName', 'rechts oben')
scatter3(Pose_rechtsm(1), Pose_rechtsm(2), Pose_rechtsm(3), 'filled', 'MarkerFaceColor', 'magenta', 'DisplayName', 'rechts mittig')
scatter3(Pose_rechtsu(1), Pose_rechtsu(2), Pose_rechtsu(3), 'filled', 'MarkerFaceColor', 'magenta', 'DisplayName', 'rechts unten')
hold off
xlabel('x-Achse', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('y-Achse', 'FontSize', 12, 'FontWeight', 'bold');
zlabel('z-Achse', 'FontSize', 12, 'FontWeight', 'bold');
legend

figure('Name','Interpolation der Messungen von der Deckencam', 'NumberTitle','off')
x = [Pose_1y_Probe(1); Pose_Mitte_Probe(1); Pose_1x_Probe(1); Pose_linkso(1); Pose_linksm(1); Pose_linksu(1); Pose_rechtso(1); Pose_rechtsm(1); Pose_rechtsu(1)]; 
y = [Pose_1y_Probe(2); Pose_Mitte_Probe(2); Pose_1x_Probe(2); Pose_linkso(2); Pose_linksm(2); Pose_linksu(2); Pose_rechtso(2); Pose_rechtsm(2); Pose_rechtsu(2)];
z = [Pose_1y_Probe(3); Pose_Mitte_Probe(3); Pose_1x_Probe(3); Pose_linkso(3); Pose_linksm(3); Pose_linksu(3); Pose_rechtso(3); Pose_rechtsm(3); Pose_rechtsu(3)];
[xq,yq] = meshgrid(-3:.2:3, -3:.2:3);
zq = griddata(x,y,z,xq,yq);
plot3(x,y,z,"o")
hold on
surf(xq, yq, zq)
xlim([-2.7 2.7])
ylim([-2.7 2.7])
xlabel('x-Achse', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('y-Achse', 'FontSize', 12, 'FontWeight', 'bold');
zlabel('z-Achse', 'FontSize', 12, 'FontWeight', 'bold');


figure('Name','Interpolation der Rohdaten', 'NumberTitle','off')
x_r = [x_Mitte; x_1y; x_1x; links_ox; links_ux; links_mx; rechts_ox_72; rechts_ux_30; rechts_mx];
y_r = [y_Mitte; y_1y; y_1x; links_oy; links_uy; links_my; rechts_oy_72; rechts_uy_30; rechts_my];
z_r = [z_Mitte; z_1y; z_1x; links_oz; links_uz; links_mz; rechts_oz_72; rechts_uz_30; rechts_mz];


x = x(:);
y = y(:);

XY = [x,y]
% x_t = transpose(x);
% y_t = transpose(y);
z_new = [0; 0; 0;0; 0; 0;0; 0; 0];
z_new = z_new(:);
fit([x,y], z_new, 'poly22')
[fit1, gof, fitinfo] = fit([x,y], z_new, 'poly22')
plot(fit1, XY, z_new)







