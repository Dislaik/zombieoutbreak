Utils = {}

Utils.GetSize = function(Array)
    Index = 0
    for i, j in pairs(Array) do
        Index = Index + 1
    end
    return Index
end

Utils.ArrayContainsValue = function(Array, Value)
    for i, Element in pairs(Array) do
        if Element == Value then
            return true
        end
    end

    return false
end

Utils.ClearArray = function(Array)
    for i in pairs (Array) do
        Array[i] = nil
    end
end

Utils.Split = function(String, Split)
    local Array = {}

    if Split == nil then
        Split = "%s"
    end

    for i in string.gmatch(String, "([^"..Split.."]+)") do
        table.insert(Array, i)
    end
    
    return Array
end