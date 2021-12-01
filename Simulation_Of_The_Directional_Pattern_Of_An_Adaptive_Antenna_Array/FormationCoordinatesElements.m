% ������� ������������ ��������� ��������� ��������� �������� �������
% ��. ���������:
  % count_el_hor - ���������� ��. �� �����������
  % count_el_ver - ���������� ��. �� ���������
  % step_x_coor  - ��� �� ���������� X ��� ��. �� � �.
  % step_y_coor  - ��� �� ���������� Y ��� ��. �� � �.
% ���. ���������:
  % x_coor_el - ������� � ������������ X ����������� ��� ���� ���������
  % y_coor_el - ������� � ������������ Y ����������� ��� ���� ���������
function [x_coor_el, y_coor_el] = FormationCoordinatesElements(count_el_hor,...
                                                               count_el_ver,...
                                                               step_x_coor ,...
                                                               step_y_coor)
% ��������� ������ ������� ��� �������� ��������� ���������
x_coor_el = zeros(count_el_ver, count_el_hor);
y_coor_el = zeros(count_el_ver, count_el_hor);
% ������� ����������
cur_x_coor = -step_x_coor*count_el_hor/2;
% ��������� ������� ��� ���������
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