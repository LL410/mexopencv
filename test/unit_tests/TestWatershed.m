classdef TestWatershed
    %TestWatershed
    properties (Constant)
        path = fileparts(fileparts(mfilename('fullpath')))
        img = imread([TestGrabCut.path,filesep,'img001.jpg'])
    end
    
    methods (Static)
    	function test_1
            bbox = [100,100,200,320]; % [x,y,w,h]
            marker = zeros(size(TestGrabCut.img,1),size(TestGrabCut.img,2),'int32');
            marker(bbox(2):(bbox(2)+bbox(4)-1),bbox(1):(bbox(1)+bbox(3)-1)) = 1;
            marker = watershed(TestGrabCut.img,marker);
    	end
    	
        function test_error_1
            try
                watershed();
                throw('UnitTest:Fail');
            catch e
                assert(strcmp(e.identifier,'mexopencv:error'));
            end
        end
    end
    
end
