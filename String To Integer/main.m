%Huiyao (Doris) Tang
%Main Program for num_to_str Function

%% TASK01
clear; clc;

%Test displays of variables of different magnitudes in num_to_str
%and compare displays with those of built-in Matlab function num2str

a = 1e2*pi;
b = -1*a;
c = 1e-3*pi;
d = -1*c;

disp('Testing num_to_str function:');
disp(['For x = 1e2*pi, the resulting string is ', num_to_str(a, 16), '.']);
disp(['For x = -1e2*pi, the resulting string is ', num_to_str(b, 16), '.']);
disp(['For x = 1e-3*pi, the resulting string is ', num_to_str(c, 16), '.']);
disp(['For x = -1e-3*pi, the resulting string is ', num_to_str(d, 16), '.']);

disp(' ');
disp('Compare with built-in num2str function:');
disp(['For x = 1e2*pi, the resulting string is ', num2str(a, 16), '.']);
disp(['For x = -1e2*pi, the resulting string is ', num2str(b, 16), '.']);
disp(['For x = 1e-3*pi, the resulting string is ', num2str(c, 16), '.']);
disp(['For x = -1e-3*pi, the resulting string is ', num2str(d, 16), '.']);