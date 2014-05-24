%Huiyao (Doris) Tang
%Card Game


%% TASK01
clear; clc;
format short;

%Number of cards in the deck (card vector)
num_cards = 4;

if num_cards<=0
    error('Number of trials must be at least 1');
end
    
%Card vecor containing permutation of integrs from 1 to number of cards
cards_vec = randperm(num_cards);

%Number of cards in card vector (changes through simulation)
cards_left = num_cards;

%Logical variable for found match (default to false)
match = 0;

%Count
count = 1;

%Logical variable for won game (default to false)
won = 0;

%Simulation (run once)
while ((count~=(num_cards+1)) & ~won)
    
    %Update accoumulated vector of counts and cards
    
    %Test if first card matches the count
    match = (cards_vec(1)==count);
    
    %If match is found
    if match
        cards_vec = handle_match(cards_vec);
        count = 1;
        
    %If match is not found
    else
        cards_vec = handle_mismatch(cards_vec);
        count = count+1;
    end
    
    %Test if game is won
    cards_left = length(cards_vec);
    won = (cards_left==0);
    
    disp([count cards_vec]);
end

if won
    disp('You win!');
else
    disp('You lose!');
end

    
    
    
    
    