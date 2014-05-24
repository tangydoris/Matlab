%Huiyao (Doris) Tang
%Vectors


%% PROBLEM01

clear; clc;
format long e;


%Store variables necessary to compute summation
n = 8;
a = -500;
b = 500;
Xvec = a + (b+a)*rand(n,1);

%Split Xvec into two vectors for calculation
%One containing the first elements to the second to last element
%The other containing the second element to the last element
Xvec1 = Xvec(1:n-1, :);
Xvec2 = Xvec(2:n, :);

%Create vector of indeces
index = [1:(n-1)];
index = index';

%Calculate each term of the summation with given formula
sum_vec = 100.*(Xvec1.^2-Xvec2).^2 + (index.*Xvec1-1).^2;

%Sum all terms of the summation vector to obtain final summation
disp('The summation is: ');
disp(sum(sum_vec));


%When Xvec was first instantiated, all the elements shown were -500. This
%is due to a rounding error in the program. As we can see from the vector
%that contains each term of the summation, the elements in Xvec were not
%exactly -500. If they were all exactly -500, then all the terms in the
%vector would be the exacctly equivalent. In reality, they differ by an
%extremely small amount.

%The calculated summation is 4.392521002800700e+13




%% PROBLEM02

clear; clc;
format bank;

%Load CPI matrix for data
load CPI;


%Promopt user for year and number of years input
year = input('Input year: ');
num_years = input('Input number of years: ');

%Set the value of the first year on record to obtain row index of input
%years
year0 = CPI(1, 1);

%Find CPI rows for years
row_start = year - year0 + 1;
row_end = row_start + num_years - 1;
DATA = CPI(row_start:row_end, :);

%Get rid of data from months not wanted
DATA = DATA(:, [1, 4, 7, 10, 13, 14]);

%Reverse the order of rows
DATA = flipud(DATA);

disp(['Quarterly and annual average CPI for ', num2str(num_years), ...
    ' years starting from ', num2str(year), ': ']);
disp(DATA);




%% PROBLEM03

clear; clc;
format short;


%Prompt user for vector containing grades and number of credits for each
%course
grade_vec = input('Input vector containing grades for each course: ');
cred_vec = input('Input vector containing corresponding credits: ');

%Create vector for grade conversion
conv_vec = [4, 3.7, 3.3, 3, 2.7, 2.3, 2, 0];

%Calculate accumulative GPA
gpa = sum(conv_vec(grade_vec).*cred_vec) ./ sum(cred_vec);

disp(['Your calculated GPA is ', num2str(gpa)]);