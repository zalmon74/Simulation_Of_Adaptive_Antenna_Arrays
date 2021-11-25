% Функция расчета ДН АР во всех точка с учетом весовых коэффициентов
% ВХ. АРГУМЕНТЫ:
  % coord_x - координата x элементов АР
  % coord_y - координата y элеменртов АР
  % theta, fi - векторы углов направления полезного сигнала
  % k - волновое число полезного сигнала
  % vec_weg_coef - вектор с весовыми коэффициентами
% ВЫХ. АРГУМЕНТЫ:
  % mat_dir_diag - итоговая ДН АР

function mat_dir_diag = CalculationArrayDirectionalDiagramAntennaArray(coord_x, coord_y, vec_theta, vec_fi, k, vec_weig_coef)
for ind_fi = 1:length(vec_fi)
  for ind_theta = 1:length(vec_theta)
    mat_dir_diag(ind_fi, ind_theta) = CalculationDirectionalDiagramAntennaArray(coord_x, coord_y, vec_theta(ind_theta),...
                                                                                vec_fi(ind_fi), k, vec_weig_coef);
  end
end

end