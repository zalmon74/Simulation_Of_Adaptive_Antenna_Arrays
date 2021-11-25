% ������� ���������� ������������ �������� ������������
% ��. ���������:
  % mat_corr - �������������� �������
  % vec_wave_front_sig - ������ �� ���������� ��������� ������ �������
% ���. ���������:
  % vec_weig_coef - ������ � ������������ �������� ��������������
function vec_weig_coef = CalculationWeightCoeff(mat_corr, vec_wave_front_sig)
obr_mat_corr = mat_corr.^(-1);
vec_wave_front_sig_h = conj(vec_wave_front_sig)';
vec_weig_coef = obr_mat_corr*vec_wave_front_sig/(vec_wave_front_sig_h*obr_mat_corr*vec_wave_front_sig);
end