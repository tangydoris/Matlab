%Huiyao (Doris) Tang

%Function num_to_str works like built-in Matlab function num2str
%Input: numerical variable and number of significant digits
%Output: string representation of that variable with the given number of
%significan digits

function[str] = num_to_str(var, sig_figs)
    %Create numerical vector to store each digit (and sign, if necessary)
    %of variable var
    num_vec = [];
    
    %Store variable in temperary variable
    temp = abs(var);
    
    %Logical variable for variable sign (default to false)
    negative = 0;
    
    %Logical variable for existence of leading zeros (default to false)
    lead_zeros = 0;
    magnitude = ceil(log10(temp));
    %Check for magnitude less than 1 with leading zeros
    if magnitude<0
        %Set logical leading zero variable to true
        lead_zeros = 1;
        num_zeros = abs(magnitude);
    end
    
    
    %Check to see if variable is negative
    if var<0
        %Set logical negative variable to true
        negative = 1;
    end
        
    
    
    %Algorithm for variables with no leading zeros
    if ~lead_zeros
        %If variable magnitude is greater than 1 store each integral digit in
        %numerical vector
        if temp>=1
            num_vec = [];
            magnitude = floor(log10(temp));
            pow_ten = 10^magnitude;

            %Keep dividing the variable integer by a power of ten relative to
            %its magnitude and store each quotient in numerical vector
            while temp>=1
                %First digit of number;
                first_digit = floor(temp/pow_ten);
                temp = mod(temp, pow_ten);
                num_vec = [num_vec first_digit];
                magnitude = magnitude-1;
                pow_ten = 10^magnitude;
            end

            %By the end of the loop, variable has magnitude less than 1
        end


        %Determine number of decimal places in remainder of variable


        %Manipulate variable with magnitude less than 1
        %Current length of numerical vector
        current_len = length(num_vec);
        %Maximum number of integers in numerical vector
        max_len = sig_figs;
        %Number of remaining integers allowed in numerical vector
        remain_len = max_len-current_len;

        %Extract remaining digits from variable
        for i=1:remain_len
           temp = temp*10;
           num_vec = [num_vec floor(temp)];
           temp = temp-floor(temp);
        end
        
        %Add appropriate decimal point (ascii 46)
        %Use value 46-48=-2 for later conversion
        %Determine location of decimal point
        magnitude = floor(log10(abs(var)));
        magnitude = magnitude+1;
        %Insert decimal point into numerical vector
        num_vec = [num_vec(1:magnitude) -2 num_vec(magnitude+1:end)];

        
    %If variable has leading zeros
    else
        num_vec = zeros(1,num_zeros+1);
        pow_ten = 10^num_zeros;
        temp = temp*pow_ten;
        
        %Extract remaining digits from variable
        for i=1:sig_figs
           temp = temp*10;
           num_vec = [num_vec floor(temp)];
           temp = temp-floor(temp);
        end
        
        
        %Add appropriate decimal point (ascii 46)
        %Use value 46-48=-2 for later conversion
        %Determine location of decimal point
        magnitude = ceil(log10(abs(var)));
        magnitude = abs(magnitude+1);
        %Insert decimal point into numerical vector
        num_vec = [num_vec(1:magnitude) -2 num_vec(magnitude+1:end)];
    end
    
    
    %Add appropriate negative sign (ascii 45)
    %If the varible was negative to begin with
    if negative
       %Use value 45-48=-3 for later conversion
       num_vec = [-3 num_vec];
    end
    
    
    %Convert numerical values to ascii
    leng = length(num_vec);
    for i = 1:leng
        num_vec(i) = num_vec(i)+48;
    end
    
    %Convert numerical vector to string
    str = char(num_vec);
    
end






