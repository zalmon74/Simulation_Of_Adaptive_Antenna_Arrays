% ������� ������� �� �� � ������ ������� �������������
% ��. ���������:
  % coord_x - ���������� x ��������� ��
  % coord_y - ���������� y ���������� ��
  % theta, fi - ���� ����������� ��������� �������
  % k - �������� ����� ��������� �������
  % vec_weg_coef - ������ � �������� ��������������
% ���. ���������:
  % dir_diag - �������� �� �� � �������� �����
function dir_diag = CalculationDirectionalDiagramAntennaArray(coord_x, coord_y, theta, fi, k, vec_weig_coef)

[count_el_ver, count_el_hor] = size(coord_x);
% � ������� ����� ��������� �������� ��������� ������� ��������
loc_coord_x = reshape(coord_x, 1, count_el_ver*count_el_hor);
loc_coord_y = reshape(coord_y, 1, count_el_ver*count_el_hor);
% ��������� �������� �� �� � �������� �����
dir_diag = vec_weig_coef'.*exp(-i*(k*(loc_coord_x*sin(theta)*cos(fi)+loc_coord_y*sin(theta)*sin(fi))));
dir_diag = sum(dir_diag);
end