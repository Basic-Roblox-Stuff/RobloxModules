--[[
Encoder:Encode() ONLY WORKS FOR NUMBERS CURRENTLY
]]--

local encoder = {
    __type__ = function()
        return "Encoder"
    end,
    __index__ = function()
        return "Bro tf were you trying to do :Skull:"
    end
}

encoder._characters = {
    [0] = "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", 
    "a", 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'o', 'p','q','r','s','t','u','v','w','x','y','z',
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'O', 'P','Q','R','S','T','U','V','W','X','Y','Z',
    '/', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '=', '+', '[', '{', ']', '}', '^', '|', "'", '.', '>', '<', ',', '~', '`'
}

local numbers = {['0'] = 0}
for i, char in ipairs(encoder._characters) do numbers[char] = i end --// Setup {numbers}

encoder._base = #encoder._characters + 1

function encoder:Encode(ValueToEncode: number)
    local value = ValueToEncode
    
    assert(type(value) == "number", "Argument 1 [ value ] isn't a number.")
    
    if (value == 0) then return '0' end
    local returned = ""
    
    if (value < 0) then 
        returned = '-' 
        value = -value
    end
    
    while (value > 0) do
        returned = returned .. self._characters[value % self._base]
        value = math.floor(value / self._base)
    end
    
    return returned
end

function encoder:Decode(ValueToDecode: string)
    local value = ValueToDecode
    
    assert(type(value) == "string", "Argument 1 [ value ] isn't a string.")
    local number = 0
    local power = 1
    for char in (string.gmatch(value, '.')) do
        if (char == '-') then
            power = -power
        else
            number += numbers[char] * power
            power *= self._base
        end
    end
    return number
end

return encoder
