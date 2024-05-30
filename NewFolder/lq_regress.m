X2 = tag36h11_2.simout.transform.translation.x.Data;
Y2 = tag36h11_2.simout.transform.translation.y.Data;
Z2 = tag36h11_2.simout.transform.translation.z.Data;
X2_2 = tag36h11_2_2.simout.transform.translation.x.Data;
Y2_2 = tag36h11_2_2.simout.transform.translation.y.Data;
Z2_2 = tag36h11_2_2.simout.transform.translation.z.Data;
X4 = tag36h11_4.simout.transform.translation.x.Data;
Y4 = tag36h11_4.simout.transform.translation.y.Data;
Z4 = tag36h11_4.simout.transform.translation.z.Data;
X4_2 = tag36h11_4_2.tag36h11_4_2.transform.translation.x.Data;
Y4_2 = tag36h11_4_2.tag36h11_4_2.transform.translation.y.Data;
Z4_2 = tag36h11_4_2.tag36h11_4_2.transform.translation.z.Data;
% X6 = tag36h11_6.simout.transform.translation.x.Data;
% Y6 = tag36h11_6.simout.transform.translation.y.Data;
% Z6 = tag36h11_6.simout.transform.translation.z.Data;
X6_2 = tag36h11_6_2.simout.transform.translation.x.Data;
Y6_2 = tag36h11_6_2.simout.transform.translation.y.Data;
Z6_2 = tag36h11_6_2.simout.transform.translation.z.Data;
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

% scatter3(X2, Y2, Z2, 'filled')
% hold on
% scatter3(X2_2,Y2_2,Z2_2)
% scatter3(X4, Y4, Z4, "filled")
% scatter3(X4_2, Y4_2, Z4_2)
% scatter3(X6, Y6, Z6, "filled")
% scatter3(X6_2, Y6_2, Z6_2)
% hold off

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
xlabel('x-Achse', 'FontSize', 12, 'FontWeight', 'bold');   % Beschriftet die x-Achse mit größerer Schrift und fett
ylabel('y-Achse', 'FontSize', 12, 'FontWeight', 'bold');   % Beschriftet die y-Achse mit größerer Schrift und fett
zlabel('z-Achse', 'FontSize', 12, 'FontWeight', 'bold');   % Beschriftet die z-Achse mit größerer Schrift und fett (nur für 3D-Plots)
x= lsqr(A4_2_mean,z4)
X6_2_mean = mean(X6_2);
Y6_2_mean = mean(Y6_2);
A6_2_mean = [X6_2_mean; Y6_2_mean] - A2_2;
z6 = [1;3];
x6 = lsqr(A6_2_mean,z6)
x4 = lsqr(A4_mean,z4)

