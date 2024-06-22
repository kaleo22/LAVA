X2 = tag36h11_2.simout.transform.translation.x.Data /10;
Y2 = tag36h11_2.simout.transform.translation.y.Data /10;
Z2 = tag36h11_2.simout.transform.translation.z.Data /10;
X2_2 = tag36h11_2_2.simout.transform.translation.x.Data /10;
Y2_2 = tag36h11_2_2.simout.transform.translation.y.Data /10;
Z2_2 = tag36h11_2_2.simout.transform.translation.z.Data /10;
X4 = tag36h11_4.simout.transform.translation.x.Data /10;
Y4 = tag36h11_4.simout.transform.translation.y.Data /10;
Z4 = tag36h11_4.simout.transform.translation.z.Data /10;
X4_2 = tag36h11_4_2.tag36h11_4_2.transform.translation.x.Data /10;
Y4_2 = tag36h11_4_2.tag36h11_4_2.transform.translation.y.Data /10;
Z4_2 = tag36h11_4_2.tag36h11_4_2.transform.translation.z.Data /10;
X6 = tag36h11_6.simout.transform.translation.x.Data /10;
Y6 = tag36h11_6.simout.transform.translation.y.Data /10;
Z6 = tag36h11_6.simout.transform.translation.z.Data /10;
X6_2 = tag36h11_6_2.simout.transform.translation.x.Data /10;
Y6_2 = tag36h11_6_2.simout.transform.translation.y.Data /10;
Z6_2 = tag36h11_6_2.simout.transform.translation.z.Data /10;
X_Realsense = realsense.tag4realsense.transform.translation.x.Data;
Y_Realsense = realsense.tag4realsense.transform.translation.y.Data;
Z_Realsense = realsense.tag4realsense.transform.translation.z.Data;

X4_mean = mean(X2);
Y4_mean = mean(Y2);
X2_2_mean = mean(X2_2);
Y2_2_mean = mean(Y2_2);
X4_2_mean= mean(X4_2);
Y4_2_mean = mean(Y4_2);
% A2 = [X2,Y2,Z2];
X4_2_T = transpose(X4_2);
Y4_2_T = transpose(Y4_2);
A2_2 = [X2_2_mean; Y2_2_mean];
b = 0-A2_2;
A4_2 = [X4_2, Y4_2];
% A4_2x = A4_2 - b;
z4 = [1;2];
A4_2_mean = [X4_2_mean; Y4_2_mean] - A2_2;
A4_mean = [X4_mean; Y4_mean] - A2_2;
figure(1)
scatter3(X2, Y2, Z2, 'filled', 'DisplayName','Cam1 Tag2', 'MarkerFaceColor', 'blue')
hold on

scatter3(X4, Y4, Z4, "filled", 'DisplayName','Cam1 Tag4', 'MarkerFaceColor', 'green')

scatter3(X6, Y6, Z6, "filled", 'DisplayName','Cam1 Tag6', 'MarkerFaceColor', 'yellow')

scatter3(0, 0, 0, 'filled', 'DisplayName','Ursprung', 'MarkerFaceColor','r')
hold off
xlabel('x-Achse', 'FontSize', 12, 'FontWeight', 'bold');   
ylabel('y-Achse', 'FontSize', 12, 'FontWeight', 'bold');   
zlabel('z-Achse', 'FontSize', 12, 'FontWeight', 'bold');
legend
title('Position Cam zu Tag')

figure(2)
scatter3(X2_2,Y2_2,Z2_2, 'DisplayName','Tag2 Cam1', 'MarkerFaceColor', 'blue')
hold on
scatter3(X4_2, Y4_2, Z4_2, 'DisplayName','Tag4 Cam1', 'MarkerFaceColor', 'green')
scatter3(X6_2, Y6_2, Z6_2, 'DisplayName','Tag6 Cam1', 'MarkerFaceColor', 'yellow')
scatter3(0,0,0, 'filled', 'DisplayName', ' Ursprung', 'MarkerFaceColor', 'red')
hold off
% plot3(X2, Y2, Z2)
% hold on
% plot3(X2_2, Y2_2, Z2_2)
% plot3(X4, Y4, Z4)
% plot3(X4_2, Y4_2, Z4_2)
% plot3(X6, Y6, Z6)
% plot3(X6_2, Y6_2, Z6_2)
% hold off

% sf = fit(A4_2,z4,'poly2');
% plot3(A4_2, sf)
% scatter3(X4_2,Y4_2,Z4_2)
xlabel('x-Achse', 'FontSize', 12, 'FontWeight', 'bold');   
ylabel('y-Achse', 'FontSize', 12, 'FontWeight', 'bold');   
zlabel('z-Achse', 'FontSize', 12, 'FontWeight', 'bold');
% xlim([0 5])
% ylim([-15 15])
% zlim([0 18])
legend
title('Position Tag zu Cam')
% x= lsqr(A4_2_mean,z4)
% X6_2_mean = mean(X6_2);
% Y6_2_mean = mean(Y6_2);
% A6_2_mean = [X6_2_mean; Y6_2_mean] - A2_2;
% z6 = [1;3];
% x6 = lsqr(A6_2_mean,z6)
% x4 = lsqr(A4_mean,z4)
figure(3)
scatter3(X_Realsense,Y_Realsense, Z_Realsense, 'filled','Displayname', 'Realsense Kamera', 'MarkerFaceColor','blue')
hold on
scatter3(0,0,0, 'filled','DisplayName', 'Ursprung', 'MarkerFaceColor', 'red')
xlabel('x-Achse', 'FontSize', 12, 'FontWeight', 'bold');   
ylabel('y-Achse', 'FontSize', 12, 'FontWeight', 'bold');   
zlabel('z-Achse', 'FontSize', 12, 'FontWeight', 'bold');
legend
title('Realsense Kamera: Tag zu Kamera')