% Функция расчета ДН АР с учетом весовых коэффициентов
% ВХ. АРГУМЕНТЫ:
  % coord_x - координата x элементов АР
  % coord_y - координата y элеменртов АР
  % theta, fi - углы направления полезного сигнала
  % k - волновое число полезного сигнала
  % vec_weg_coef - вектор с весовыми коэффициентами
% ВЫХ. АРГУМЕНТЫ:
  % dir_diag - итоговая ДН АР в заданной точке
function dir_diag = CalculationDirectionalDiagramAntennaArray(coord_x, coord_y, theta, fi, k, vec_weig_coef)

[count_el_ver, count_el_hor] = size(coord_x);
% В векторе будет храниться значение координат каждого элемента
loc_coord_x = reshape(coord_x, 1, count_el_ver*count_el_hor);
loc_coord_y = reshape(coord_y, 1, count_el_ver*count_el_hor);
% Вычисляем итоговую ДН АР в заданной точке
dir_diag = vec_weig_coef'.*exp(-i*(k*(loc_coord_x*sin(theta)*cos(fi)+loc_coord_y*sin(theta)*sin(fi))));
dir_diag = sum(dir_diag);
end