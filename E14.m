temp = importdata('T.txt');
l_freeze = importdata('Lfreze.txt');
l_heat = importdata ('Lheat.txt');
temp_reduced = temp(11:61);
freeze_reduced = l_freeze(11:61);
heat_reduced  = l_heat(11:61);
%heat_func = fit(temp, l_heat, 'sin8');
%heat_func1 = fit(temp, l_heat,'fourier8');
heat_fit_fin = fit(temp_reduced, heat_reduced, 'gauss5');
%freeze_func = fit(temp, l_freeze, 'gauss8');
freeze_fit_fin = fit(temp_reduced, freeze_reduced, 'gauss5');
%freeze_eq = diff(diff(freeze_func_fin));
%
%
freeze_f = subs(str2sym(formula(freeze_fit_fin)),coeffnames(freeze_fit_fin),num2cell(coeffvalues(freeze_fit_fin).'));
freeze_d2 =  diff(diff(freeze_f));
freeze_eq = freeze_d2 == 0;
freeze_point_sym = vpasolve(freeze_eq,[140 160]);
freeze_point = double(freeze_point_sym);
freeze_point_fun = freeze_fit_fin(freeze_point);
%
%
heat_f = subs(str2sym(formula(heat_fit_fin)),coeffnames(heat_fit_fin),num2cell(coeffvalues(heat_fit_fin).'));
heat_d2 = diff(diff(heat_f));
heat_eq = heat_d2 == 0;
heat_point_sym = vpasolve(heat_eq,[150, 170]);
heat_point = double(heat_point_sym);
heat_point_fun = heat_fit_fin(heat_point);

freeze_coeffs = coeffvalues(freeze_fit_fin);
heat_coeffs = coeffvalues(heat_fit_fin);
disp(freeze_coeffs)
disp(heat_coeffs)
figure
hold on
scatter(temp, l_freeze,'blue', '.')
scatter(temp, l_heat,'red','.')
fplot(freeze_f,'blue')
%plot(freeze_fit_fin)
%plot(heat_func)
%plot(heat_func1)
fplot(heat_f,'red')
scatter(freeze_point, freeze_point_fun, 'filled', 'hexagram','m')
scatter(heat_point,heat_point_fun, 'filled','hexagram', 'g')
xlabel('$T [^\circ C]$', 'Interpreter','latex')
ylabel('$L [mH]$', 'Interpreter','latex')
xlim([20 190])
ylim([1.25 7])
hold off
legend( '$L_{freeze}$', '$L_{heat}$', '$L_{freeze}(T)$','$L_{heat}(T)$','$T_C$ dla procesu chlodzenia','$T_C$ dla procesu grzenia', Interpreter = 'latex')
