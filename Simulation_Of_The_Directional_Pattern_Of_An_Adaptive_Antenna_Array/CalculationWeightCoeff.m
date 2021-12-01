% Функция вычисления оптимального весового коэффициента
% ВХ. АРГУМЕНТЫ:
  % mat_corr - корреляционная матрица
  % vec_wave_front_sig - вектор со значениями волнового фронта сигнала
% ВЫХ. АРГУМЕНТЫ:
  % vec_weig_coef - вектор с оптимальными весовыми коэффициентами
function vec_weig_coef = CalculationWeightCoeff(mat_corr, vec_wave_front_sig)
obr_mat_corr = inv(mat_corr);
vec_wave_front_sig_h = vec_wave_front_sig';
vec_weig_coef = obr_mat_corr*vec_wave_front_sig/(vec_wave_front_sig_h*obr_mat_corr*vec_wave_front_sig);
end