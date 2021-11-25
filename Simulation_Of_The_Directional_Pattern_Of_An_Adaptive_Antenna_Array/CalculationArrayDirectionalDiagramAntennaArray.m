% ������� ������� �� �� �� ���� ����� � ������ ������� �������������
% ��. ���������:
  % coord_x - ���������� x ��������� ��
  % coord_y - ���������� y ���������� ��
  % theta, fi - ������� ����� ����������� ��������� �������
  % k - �������� ����� ��������� �������
  % vec_weg_coef - ������ � �������� ��������������
% ���. ���������:
  % mat_dir_diag - �������� �� ��

function mat_dir_diag = CalculationArrayDirectionalDiagramAntennaArray(coord_x, coord_y, vec_theta, vec_fi, k, vec_weig_coef)
for ind_fi = 1:length(vec_fi)
  for ind_theta = 1:length(vec_theta)
    mat_dir_diag(ind_fi, ind_theta) = CalculationDirectionalDiagramAntennaArray(coord_x, coord_y, vec_theta(ind_theta),...
                                                                                vec_fi(ind_fi), k, vec_weig_coef);
  end
end

end