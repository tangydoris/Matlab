%Author: Huiyao Tang
%Probability Trials


%% TASK01
clear; clc;
format long;

%Number of trials
n = 1000000;

%Set bounding values for x- and y-axis
xMax = 1;
yMax = 1;

%Generate two matrices of x- and y-coordinates between 0 and 1 (center of
%smaller square)
xCor = rand(n, 1);
yCor = rand(n, 1);

%Generate matrices of difference between maximum coordinate and generated
%one
xOther = xMax - xCor;
yOther = yMax - yCor;

%Find minimum length of square across two axes
sideOne = min(xOther, xCor);
sideTwo = min(yOther, yCor);

%Find smaller of two sides
minSide = min(sideOne, sideTwo);
%Computer average length of sides
sumMinSides = sum(minSide);
avgSide = sumMinSides/n;
disp(['Average side length of the smaller square is ', num2str(avgSide, 9),...
    ' units.']);

%Find area of smaller square
area = minSide .* minSide;
%Compute average area
sumAreas = sum(area);
avgArea = sumAreas/n;
disp(['Average area is ', num2str(avgArea, 9), ' square units.']);


%Computed average side length is always around 0.166... units.
%Computed average area is always around 0.041... square units.



%% TASK02
clear; clc;
format short;

%Prompt user for number of dice thrown
m = input('Total number of dice: ');
%Number of simulations
n = 1000000;
disp(' ');
disp(['Rolling ', num2str(m), ' die with ', num2str(n), ' simulations']);

%Set range of random numbers
low = 0;
high = 6;

%Generate vec of random doubles between range
vec = low+(high-low)*rand(n, m);
%Round each number up so result is outcome of dice throw
vec = ceil(vec);

%Test if number is odd
isOdd = (mod(vec, 2) == 1);
%Test if there is only one odd
numOdd = sum(isOdd, 2);
oneOdd = (numOdd == 1);
probOdd = nnz(oneOdd)/n;
disp(['Probability of exactly one odd: ', num2str(probOdd, 7)]);

%Test if number is 6
isSix = (vec == 6);
numSix = sum(isSix, 2);
probSix = nnz(numSix)/n;
disp(['Probability of at least one six: ', num2str(probSix, 7)]);

%Final outcome of both tests
prob = probSix + probOdd;
disp(['Probability of either happening: ', num2str(prob, 7)]);


%With varying the number of die thrown, the probably of either event 
%hapenning varies from 65% to 80%
% # of dice:  probability of both events happening
% 1: ~67%
% 2: ~81%
% 3: ~80%
% 4: ~77%
% 5: ~75%
% 6: ~76%
% 7: ~78%
% 8: ~80%
% 9: ~82%
% 10: ~85%

%As the number of die thrown increases, the probably of rolling exactly one
%odd number decreases. At the same time, the probability of rolling at
%least onel six increases. The probability of both events happening depends
%mainly on the probability of rolling at least one six because it makes up
%for the majority of the final probability.
