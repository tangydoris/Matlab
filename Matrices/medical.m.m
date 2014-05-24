%Author: Huiyao Tang
%Medical Data


%% TASK01 using MedicalData

clear; clc;
format short g;

%Load medical data into matrix variable DATA
load MedicalData1

%Obtain number of rows in DATA (this is the number of patients)
DATA_size = size(DATA);
num_rows = DATA_size(1);

%Insert column for cholesterol to HDL ratio for each patient
chol_ratio = DATA(:, 5) ./ DATA(:, 7);
DATA = [DATA, chol_ratio];


%Set up matrix for normal values for each condition
%Put zeros before first column to use as placeholder for patient number
%Put zeros for LDL and HDL (columns 6, 7) because they don't need to be
%tested
normal_mat = [0, 140, 90, 126, 240, 0, 0, 5];
normal_mat = repmat(normal_mat, num_rows , 1);


%Obtain logical matrix of whether patient satisfies each condition
qualify_mat = DATA > normal_mat;

%Check to see if patient has both high cholesterol AND ratio
%If columns 5, 8 are both TRUE, then the patient satisfies the condition
qualify_mat(:, 5) = qualify_mat(:, 5) & qualify_mat(:, 8);
%Change last column (the old ratio column) to all 0 so it does not
%count as a qualifying condition
zero_vec = zeros(num_rows, 1);
qualify_mat(:, 8) = zero_vec;


%Check to see which patient (row number) satisfies two or more of
%conditions
%Create column vector of sum of each row
sum_vec = sum(qualify_mat, 2);
%Take away 3 from sum (1 for the patient number placeholder, 2 for LDL HDL
%levels)
sum_vec = sum_vec - 3;

%Patient qualifies if his sum is >= 2
qualify_vec = sum_vec > 1;


%Obtain list of patient numbers to be selected
patient_nums = DATA(:, 1);
qualify_patients = patient_nums(qualify_vec);


%Display results
disp('These patients meet the target: ');
disp(qualify_patients);
disp(' ');



%Obtain all data of qualifying patients
qualify_data = DATA(qualify_vec, :);

%Find row of patient with highest LDL
LDL_lev = max(qualify_data(:, 6));
LDL_row = find(ismember(qualify_data(:, 6), LDL_lev), 1);

%Obtain patient number with highest LDL level
patientA = qualify_data(LDL_row, 1);

disp('==============================================================================');
disp(['Of all the targeted patients, patient ', num2str(patientA), ...
    ' has the highest LDL of ', num2str(LDL_lev), ' mg/dL.']);
disp('==============================================================================');
disp(' ');



%Find patients with cholesterol problem
%A TRUE in 5th column of qualify_mat tells means a patient has cholesterol
%problem
chol_vec = qualify_mat(:, 5);
chol_mat = DATA(chol_vec, [1, 6, 7, 5]);



disp('Cholesterol levels of all patients having cholesterol problem: ');
disp(' ');
disp('          #   LDL (mg/dL)   HDL (mg/dL)   Tot Chol (mg/dL)');
disp('          ====================================================');
disp(chol_mat);
disp(' ');





%% TASK02 using MedicalData2

clear; clc;
format short g;

%Load medical data into matrix variable DATA
load MedicalData2

%Obtain number of rows in DATA (this is the number of patients)
DATA_size = size(DATA);
num_rows = DATA_size(1);

%Insert column for cholesterol to HDL ratio for each patient
chol_ratio = DATA(:, 5) ./ DATA(:, 7);
DATA = [DATA, chol_ratio];


%Set up matrix for normal values for each condition
%Put zeros before first column to use as placeholder for patient number
%Put zeros for LDL and HDL (columns 6, 7) because they don't need to be
%tested
normal_mat = [0, 140, 90, 126, 240, 0, 0, 5];
normal_mat = repmat(normal_mat, num_rows , 1);


%Obtain logical matrix of whether patient satisfies each condition
qualify_mat = DATA > normal_mat;

%Check to see if patient has both high cholesterol AND ratio
%If columns 5, 8 are both TRUE, then the patient satisfies the condition
qualify_mat(:, 5) = qualify_mat(:, 5) & qualify_mat(:, 8);
%Change last column (the old ratio column) to all 0 so it does not
%count as a qualifying condition
zero_vec = zeros(num_rows, 1);
qualify_mat(:, 8) = zero_vec;


%Check to see which patient (row number) satisfies two or more of
%conditions
%Create column vector of sum of each row
sum_vec = sum(qualify_mat, 2);
%Take away 3 from sum (1 for the patient number placeholder, 2 for LDL HDL
%levels)
sum_vec = sum_vec - 3;

%Patient qualifies if his sum is >= 2
qualify_vec = sum_vec > 1;


%Obtain list of patient numbers to be selected
patient_nums = DATA(:, 1);
qualify_patients = patient_nums(qualify_vec);


%Display results
disp('These patients meet the target: ');
disp(qualify_patients);
disp(' ');



%Obtain all data of qualifying patients
qualify_data = DATA(qualify_vec, :);

%Find row of patient with highest LDL
LDL_lev = max(qualify_data(:, 6));
LDL_row = find(ismember(qualify_data(:, 6), LDL_lev), 1);

%Obtain patient number with highest LDL level
patientA = qualify_data(LDL_row, 1);

disp('==============================================================================');
disp(['Of all the targeted patients, patient ', num2str(patientA), ...
    ' has the highest LDL of ', num2str(LDL_lev), ' mg/dL.']);
disp('==============================================================================');
disp(' ');



%Find patients with cholesterol problem
%A TRUE in 5th column of qualify_mat tells means a patient has cholesterol
%problem
chol_vec = qualify_mat(:, 5);
chol_mat = DATA(chol_vec, [1, 6, 7, 5]);



disp('Cholesterol levels of all patients having cholesterol problem: ');
disp(' ');
disp('          #   LDL (mg/dL)   HDL (mg/dL)   Tot Chol (mg/dL)');
disp('          ====================================================');
disp(chol_mat);
disp(' ');