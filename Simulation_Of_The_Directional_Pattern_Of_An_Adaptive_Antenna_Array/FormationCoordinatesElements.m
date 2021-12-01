% Функция формирования координат элементов двумерной антенной решетки
% ВХ. АРГУМЕНТЫ:
  % count_el_hor - количество эл. по горизонтали
  % count_el_ver - количество эл. по вертикали
  % step_x_coor  - шаг по координате X для эл. АР в м.
  % step_y_coor  - шаг по координате Y для эл. АР в м.
% ВЫХ. АРГУМЕНТЫ:
  % x_coor_el - матрица с рассчитанной X координатой для всех элементов
  % y_coor_el - матрица с рассчитанной Y координатой для всех элементов
function [x_coor_el, y_coor_el] = FormationCoordinatesElements(count_el_hor,...
                                                               count_el_ver,...
                                                               step_x_coor ,...
                                                               step_y_coor)
% Формируем пустые матрицы для хранения координат элементов
x_coor_el = zeros(count_el_ver, count_el_hor);
y_coor_el = zeros(count_el_ver, count_el_hor);
% Текущие координаты
cur_x_coor = -step_x_coor*count_el_hor/2;
% Заполняем матрицы для координат
for ind_x = 1:count_el_hor
  cur_y_coor = -step_y_coor*count_el_ver/2;
  for ind_y = 1:count_el_ver
    cur_y_coor = cur_y_coor + step_y_coor;
    x_coor_el(ind_x, ind_y) = cur_x_coor;
    y_coor_el(ind_x, ind_y) = cur_y_coor;
  end
  cur_x_coor = cur_x_coor + step_x_coor;
end
                                                             
end