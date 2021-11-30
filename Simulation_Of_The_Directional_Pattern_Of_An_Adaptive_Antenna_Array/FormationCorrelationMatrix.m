% Функция формирования корреляционной матрицы
% ВХ. АРГУМЕНТЫ:
  % vec_wave_front_noise - вектор со значениями волнового фронта помех
  % P_noise - мощность собственных шумов
function mat_corr = FormationCorrelationMatrix(vec_wave_front_noise, P_noise)
vec_wave_front_noise_tr = conj(vec_wave_front_noise)';
mat_corr = vec_wave_front_noise*vec_wave_front_noise_tr;
mat_corr = mat_corr+P_noise;
end