% Функция вычисления вектора волнового фронта сигнала
% ВХ. АРГУМЕНТЫ:
% lym - длина волны сигнала
% x_coor - матрица, которая содержит X координату элементов
% y_coor - матрица, которая содержит Y координату элементов
% thata, fi - углы, которые характеризуют направление сигнала
% ВЫХ. АРГУМЕНТЫ:
% vec_wave_front - расчитанный вектор волнового фронта
function vec_wave_front = CalculationVecWaveFront(lym, x_coor, y_coor, theta, fi)
% Определяем количество элементов
[count_el_ver, count_el_hor] = size(x_coor);
count_el = count_el_ver*count_el_hor;
% Определяем количество сигналов
count_sig = length(lym);
% Рассчитываем волновое число
k = 2*pi./lym;
% Рассчитываем ДН одного элемента решетки
dir_diag_el = CalculationDirectionalDiagramElement(theta, fi);
% Формируем пустой вектор волнового фронта
vec_wave_front = zeros(count_sig, count_el);
% Цикл перебора сигналов
for ind_sig = 1:count_sig
  num_el = 1; % Переменная для подсчета номера элемента
  % Цикл перебора элементов по вертикали
  for ind_el_ver = 1:count_el_ver
    % Цикл перебора элементов по горизонтали
    for ind_el_hor = 1:count_el_hor
      vec_wave_front(ind_sig, num_el) = exp(-j*k(ind_sig)*(x_coor(ind_el_ver, ind_el_ver)*sin(theta(ind_sig))*cos(fi(ind_sig))+y_coor(ind_el_ver, ind_el_ver)*sin(theta(ind_sig))*sin(fi(ind_sig))))*dir_diag_el(ind_sig);
      % Инкрементируем номер элемента в АР
      num_el = num_el + 1;
    end
  end
end
end