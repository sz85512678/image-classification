function [rate,varargout] = Reporter(testLabel, testResult,varargin)

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
    group_number = double(varargin{1});
    type1err=0;
    type2err=0;
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
    varargout{1} = type1err/total_number_of_face;
    varargout{2} = type2err/total_number_of_non;

    
end




end
