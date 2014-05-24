%Author: Huiyao Tang
%Menu Options


%% TASK01
clear; clc;
format short;

%Menu choices for airplane flights:
%1 is Apia and Asau
%2 is Apia and Salelologa
choice = menu('Choose airplane route: ', 'Apia and Asau',...
    'Apia and Salelologa');

%Prompt user for number of passengers and total weight
numPass = input('Enter the number of passengers: ');
totalWt = input('Enter the total weight of all passengers and babbage: ');

%Calculate average weight w
wt = totalWt/numPass;


%Maximum average weight to fly either route
maxAvgWt = 200;

%Average weight ranges Route 1
wA = 60;
wB = 100;

%Corresponding rates for 
rA = 1;
rB = 1.6;
rC = 2.2;


%If average is over 200, no need to calculate cost
if (wt>maxAvgWt)
    disp('Sorry: too high an average weight to fly on Samoa Air.');
    
%Otherwise, calculate cost
else
    %Display route
    disp(['Route ', num2str(choice)]);

    %Part 1: flat fee of $20
    cost = 20;
    
    %Part 2: based on weight of luggage and number of passengers
    %Rate r for average weight
    %Scale factor f
    f = 1;
    if (choice==2)
        f = 1.7;
    end
    
    %Scale rates
    rA = f*rA;
    rB = f*rB;
    rC = f*rC;
    
    if(wt<=wA)
        cost = cost + rA*wt;
    else
        if(wt<=wB)
            cost = cost + rA*wA + rB*(wt-wA);
        else
            cost = cost + rA*wA + rB*(wB-wA) + rC*(wt-wB);
        end
    end
    
    %Multiply averaged weight cost by numer of passengers
    cost = numPass*cost;
    
    if(choice==2)
        numBirds = input('Enter the total number of pet birds: ');
        cost = cost + 10*numBirds;
    end
    
    %Display ticket price
    disp(['Your ticket price is: ', num2str(cost)]);
end







