Module.getSize = function(Array)
    Index = 0
    for i, j in pairs(Array) do
        Index = Index + 1
    end
    return Index
end

Module.arrayContainsValue = function(Array, Value)
    for i, Element in pairs(Array) do
        if Element == Value then
            return true
        end
    end

    return false
end

Module.clearArray = function(Array)
    for i in pairs (Array) do
        Array[i] = nil
    end
end

Module.split = function(_string, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={}
    for str in string.gmatch(_string, "([^".. sep .."]+)") do
            table.insert(t, str)
    end
    return t
end

Module.random = function(Min, Max)
    return math.random(Min, Max)
end

Module.roundDecimal = function(Float, Place)
    local Mult = 10^(Place or 0)
    return math.floor(Float * Mult + 0.5) / Mult
end

Module.hexToRGB = function(hex)
    hex = hex:gsub("#","")
    return tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))
end

Module.firstToUpper = function(string)
    return (string:gsub("^%l", string.upper))
end

Module.toUpperCase = function(STRING)
    return string.upper(STRING)
end

Module.toLowerCase = function(string)
    return string.lower(STRING)
end