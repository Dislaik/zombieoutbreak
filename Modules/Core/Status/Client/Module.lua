
local loaded = false

function Module:loaded(bool)
    bool = bool or nil

    if bool then
        loaded = bool
    end

    return loaded
end