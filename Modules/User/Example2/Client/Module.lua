
local test = false

Module.Test = function(a)
    a = a or nil

    if a then
        test = a
    end
    
    return test
end