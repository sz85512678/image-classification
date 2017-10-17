function [rate,varargout] = PerformanceReporter(testLabel, testResult, varargin)

%Performance measurement by outputing a lists of statistics

%group index, to enter if want to measure a specific group

%success_rate

%type_1 error, when the face belongs to group 1, but classified as not
%belong to group 1
%type_2 error, when the face don't belong to group 1, but classified as
%belong to group 1. 
s = max(size(testLabel));
rate = sum(testLabel==testResult)/max(size(testLabel));

if length(varargin)>0
    %group number input detected
    group_numbers = double(varargin{1});
    
    type1err_vec = zeros(length(group_numbers),1);
    type2err_vec = zeros(length(group_numbers),1);
    
    for groupIdx = 1:length(group_numbers)
        type1err=0;
        type2err=0;
        group_number = group_numbers(groupIdx);
        
        for i = 1:max(size(testLabel))
            trueLabel = testLabel(i);
            outputLabel = testResult(i);
            if trueLabel == group_number && outputLabel ~=group_number
                type1err=type1err+1;
            end
        
            if trueLabel ~= group_number &&  outputLabel == group_number
                type2err = type2err+1;
            end
        end
    
        total_number_of_face = sum(testLabel==group_number);
        total_number_of_non = s - total_number_of_face;
        type1err_vec(groupIdx) = type1err/total_number_of_face;
        type2err_vec(groupIdx) = type2err/total_number_of_non;
    end
    
    varargout{1} = type1err_vec;
    varargout{2} = type2err_vec;
    
    
    figure('Name','Type I Error for Face Recogonition')
    hold on
    bar(type1err_vec);
    plot(group_numbers, ones(1,length(group_numbers))*1-rate, 'r');
    legend('Type I Error for Faces', 'Overall Error');
    
    figure('Name','Type II Error for Face Recogonition')
    hold on
    bar(type2err_vec);
    plot(group_numbers, ones(1,length(group_numbers))*1-rate, 'r');
    legend('Type II Error for Faces', 'Overall Error');
    
end




end
