-- {Services} --
local UserInputService = game:GetService("UserInputService")
 
local keyboard = {
    __type__ = function()
      return "Keybind"
    end,
    __toString__ = function()
      local str = ""
      if (keyboard['binds']) then
        for Name, Func in ipairs(keyboard.binds) do
          str = str .. 'Bind Name: ' .. Name .. ' - Function Address: ' .. Func
        end
      end
      
      return str
    end
}
keyboard.binds = {}
 
-- {Functions} --
function keyboard:BindKeyCombo(name: string, callback, keyComb, ...)
    assert(type(callback) == "function", "Argument 2 [ callback ] must be a function.")
    assert(type(name) == "string", "Argument 1 [ name ] must be a string.")
    assert(type(keyComb) == "table", "Argument 3 [ keyComb ] must be an array {}.")
    local args = table.pack(...)
    local keys = keyComb
    
    self.binds[name] = UserInputService.InputBegan:Connect(function(input, g)
        if (g) then return end
        
        if (input.KeyCode and input.KeyCode == keys[#keys]) then
            
            for _, key in pairs(keys) do
                if (not UserInputService:IsKeyDown(key)) then
                    return
                end
            end
            
            callback(table.unpack(args))
        end
    end)
end
 
function keyboard:UnbindKeyCombo(name: string)
    assert(type(name) == "string", "Argument 1 [ name ] must be a string.")
    if (self.binds[name]) then
        self.binds[name]:Disconnect()
    end
end

--[[

EXAMPLE:
Keyboard:BindKeyCombo('Kill', function(arg1)
  print(arg1) --// Print's "Print Me!"
  game:GetService("Players").LocalPlayer.Character:BreakJoints() --// Kills LocalPlayer
end, {Enum.KeyCode.C, Enum.KeyCode.L}, "Print Me!")


Keyboard:UnbindKeyCombo("Kill") --// Stops the "Kill" keybind from working.

]]--
 
return keyboard
