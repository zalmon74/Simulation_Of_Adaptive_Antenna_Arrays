% Функция рассчитывает ДН одного элемента решетки
function dir_doag_el = CalculationDirectionalDiagramElement(theta, fi)
% В данном случае используется элемент Гюйгенса
dir_doag_el = (1+cos(theta))/2;
end