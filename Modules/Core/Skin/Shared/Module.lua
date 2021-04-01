Module.GetModelSex = function(Model)
    local Hash = GetHashKey(Model) 

    if Hash == GetHashKey("mp_m_freemode_01") then
        return "Male"
    elseif Hash == GetHashKey("mp_f_freemode_01") then
        return "Female"
    end

    return "[Error]"
end