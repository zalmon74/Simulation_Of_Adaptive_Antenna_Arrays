%% ����������� ���������
% ���������
c = 3.0e+8; % �������� �����
% ��� ��
count_el_ver = 10; % ���-�� ��������� �� ���������
count_el_hor = 10; % ���-�� ��������� �� �����������
step_x_coor = 0.05; % ��� �� ���������� X ��� ������������ ��������� ���
step_y_coor = 0.01; % ��� �� ���������� Y ��� ������������ ��������� ���
% ������� � ����� ����� �������
f_sig = 1.0e+09; 
lym_sig = c/f_sig;
k_sig = 2*pi/lym_sig;
% ������� � ����� ���� ��������� ��������
vec_f_noise = [0.5e+09 1.5e+09];
vec_lym_noise = c./vec_f_noise;
% ����������� ��������� �������
theta_useful_sig = 20*pi/180;
fi_useful_sig = 30*pi/180;
% ����������� ��������� ��������
theta_noise_sig_1 = -60;
theta_noise_sig_2 = 60;
vec_tetha_noise_sig = [theta_noise_sig_1, theta_noise_sig_2]*pi/180;
fi_noise_sig_1 = 30;
fi_noise_sig_2 = 30;
vec_fi_noise_sig = [fi_noise_sig_1, fi_noise_sig_2]*pi/180;
% �������� ��������� ��������
P_noise = 1.0e-6;
% ������ � ������ ��� ������� ���������� ��������� ��� 
vec_theta = (-90:90)*pi/180;

%% �������
% ��������� ��������� ��
[x_coor_el, y_coor_el] = FormationCoordinatesElements(count_el_hor,...
                                                      count_el_ver,...
                                                      step_x_coor ,...
                                                      step_y_coor);
                                                  
% ��������� �������� ������� ��������� ������ ��������� �������
vec_wave_front_sig = CalculationVecWaveFront(lym_sig, x_coor_el, y_coor_el, theta_useful_sig, fi_useful_sig);
% ��������� �������� ������� ��������� ������ ��������� ��������
vec_wave_front_noise = CalculationVecWaveFront(vec_lym_noise, x_coor_el, y_coor_el, vec_tetha_noise_sig, vec_fi_noise_sig);
% ���. ��� ����� ��������� ���������� �� �����
vec_wave_front_noise = sum(vec_wave_front_noise);
% ��������� �� �������� �����, ������� �������
vec_wave_front_sig = vec_wave_front_sig';
vec_wave_front_noise = vec_wave_front_noise';
% ��������� �������������� �������
mat_corr_noise = FormationCorrelationMatrix(vec_wave_front_noise, P_noise);
% ������������ ����������� ������� �����������
vec_weig_coef = CalculationWeightCoeff(mat_corr_noise, vec_wave_front_sig);
% ������������ �������� ��������� ��� �� ��
dir_diag = CalculationArrayDirectionalDiagramAntennaArray(x_coor_el, y_coor_el, vec_theta,...
                                                          fi_useful_sig, k_sig, vec_weig_coef);
% ������������ �������� ���
for i = 1:length(vec_theta)
    dir_diag_s(i) = sum(CalculationVecWaveFront(lym_sig, x_coor_el, y_coor_el, vec_theta(i), fi_useful_sig));
end
%% ���������� ��������
% ���������� ��
figure
hold on
for ind_x = 1:count_el_hor
  for ind_y = 1:count_el_ver
    plot(x_coor_el(ind_x, ind_y), y_coor_el(ind_x, ind_y), 'ro')
  end
end
axis([0-step_x_coor step_x_coor*(count_el_hor+1) 0-step_y_coor,...
     step_y_coor*(count_el_ver+1)])
hold off
title '�������������� ��'
% ���������� �������������� �� ���������� ��
figure
hold 
plot(vec_theta*180/pi, abs(dir_diag_s/max(dir_diag_s)))
plot(vec_theta*180/pi, abs(dir_diag), '--')
hold off
title '�� ���������� ��'
xlabel '\theta'
grid on
legend '�������� ���' '��� ���������� ��' 
                                                      
