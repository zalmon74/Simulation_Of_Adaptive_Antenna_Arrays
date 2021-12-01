% ������� ���������� ������� ��������� ������ �������
% ��. ���������:
  % lym - ����� ����� �������
  % x_coor - �������, ������� �������� X ���������� ���������
  % y_coor - �������, ������� �������� Y ���������� ���������
  % thata, fi - ����, ������� ������������� ����������� �������
% ���. ���������:
  % vec_wave_front - ����������� ������ ��������� ������
function vec_wave_front = CalculationVecWaveFront(lym, x_coor, y_coor, theta, fi)
% ���������� ���������� ���������
[count_el_ver, count_el_hor] = size(x_coor);
count_el = count_el_ver*count_el_hor;
% ���������� ���������� ��������
count_sig = length(lym);
% ������������ �������� �����
k = 2*pi./lym;
% ��������� ������ ������ ��������� ������
vec_wave_front = zeros(count_sig, count_el);
% ���� �������� ��������
for ind_sig = 1:count_sig
  num_el = 1; % ���������� ��� �������� ������ ��������
  % ���� �������� ��������� �� ���������
  for ind_el_ver = 1:count_el_ver
    % ���� �������� ��������� �� �����������
    for ind_el_hor = 1:count_el_hor
      vec_wave_front(ind_sig, num_el) = exp(-j*k(ind_sig)*(x_coor(ind_el_hor, ind_el_ver)*sin(theta(ind_sig))*cos(fi(ind_sig))+y_coor(ind_el_hor, ind_el_ver)*sin(theta(ind_sig))*sin(fi(ind_sig))));
      % �������������� ����� �������� � ��
      num_el = num_el + 1;
    end
  end
end
end