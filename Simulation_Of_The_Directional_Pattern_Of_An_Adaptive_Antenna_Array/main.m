%% Настроечные параметры
% Коснтанты
c = 3.0e+8; % Скорость света
% Для АР
count_el_ver = 10; % Кол-во элементов по вертикали
count_el_hor = 10; % Кол-во элементов по горизонтали
step_x_coor = 0.05; % Шаг по координате X для расположения элементов ЦАР
step_y_coor = 0.01; % Шаг по координате Y для расположения элементов ЦАР
% Частота и длина волны сигнала
f_sig = 1.0e+09; 
lym_sig = c/f_sig;
k_sig = 2*pi/lym_sig;
% Частоты и длины волн помеховых сигналов
vec_f_noise = [0.5e+09 1.5e+09];
vec_lym_noise = c./vec_f_noise;
% Направление полезного сигнала
theta_useful_sig = 20*pi/180;
fi_useful_sig = 30*pi/180;
% Направление помеховых сигналов
theta_noise_sig_1 = -60;
theta_noise_sig_2 = 60;
vec_tetha_noise_sig = [theta_noise_sig_1, theta_noise_sig_2]*pi/180;
fi_noise_sig_1 = 30;
fi_noise_sig_2 = 30;
vec_fi_noise_sig = [fi_noise_sig_1, fi_noise_sig_2]*pi/180;
% Мощность помеховый сигналов
P_noise = 1.0e-6;

%% Расчеты
% Формируем двумерную АР
[x_coor_el, y_coor_el] = FormationCoordinatesElements(count_el_hor,...
                                                      count_el_ver,...
                                                      step_x_coor ,...
                                                      step_y_coor);
% Вычисляем элементы вектора волнового фронта полезного сигнала
vec_wave_front_sig = CalculationVecWaveFront(lym_sig, x_coor_el, y_coor_el, theta_useful_sig, fi_useful_sig);
% Вычисляем элементы вектора волнового фронта помеховых сигналов
vec_wave_front_noise = CalculationVecWaveFront(vec_lym_noise, x_coor_el, y_coor_el, vec_tetha_noise_sig, vec_fi_noise_sig);
% Так. как помех несколько определяем их сумму
vec_wave_front_noise = sum(vec_wave_front_noise);
% Формируем из векторов строк, векторы столбцы
vec_wave_front_sig = vec_wave_front_sig';
vec_wave_front_noise = vec_wave_front_noise';
% Формируем корреляционную матрицу
mat_corr_noise = FormationCorrelationMatrix(vec_wave_front_noise, P_noise);
% Рассчитываем оптимальный весовой коэффициент
vec_weig_coef = CalculationWeightCoeff(mat_corr_noise, vec_wave_front_sig);
% Итоговое выражение для ДН АР
vec_theta = (-90:90)*pi/180;
dir_diag = CalculationArrayDirectionalDiagramAntennaArray(x_coor_el, y_coor_el, vec_theta,...
                                                          fi_useful_sig, k_sig, vec_weig_coef);

%% Построение графиков
% Построение АР
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
title 'Сформированная АР'
% Построение результирующей ДН адаптивной АР
figure
plot(vec_theta, abs(dir_diag))
title 'ДН адаптивной АР'
xlabel '\theta'
grid on
                                                      
