local UIS = game:GetService('UserInputService')
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Market = game:GetService("MarketPlaceService")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local PlayersService = game:GetService('Players')
local LocalPlayer = PlayersService.LocalPlayer
local Http = game:GetService("HttpService")
local RS = game:GetService("RunService")
local Cam = workspace.CurrentCamera
local GUI = game:GetService("GuiService")
local M = LocalPlayer:GetMouse()
local ChatEvents = ReplicatedStorage:FindFirstChild('DefaultChatSystemChatEvents')
local LocalCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local OnMessageFiltered = ChatEvents:WaitForChild("OnMessageDoneFiltering", math.huge)

getfenv().UserInputService_S = UIS
getfenv().DefaultChatEvents_I = ChatEventa
getfenv().OnFilteredMessage = OnMessageFiltered.OnClientEvent
--[[
OnFilteredMessage:Connect(function(data)
  local player  = tostring(data.FromSpeaker) --// Player who's message didn't filter fully.
  local message = tostring(data.Message) --// The message the player said.
end)
]]--
getfenv().Create_C = Instance.new
getfenv().Mouse_I = M
getfenv().GuiService_S = GUI
getfenv().LocalCamera_I = Cam
getfenv().RunService_S = RS
getfenv().HttpService_S = Http
getfenv().MarketPlaceService_S = Market
getfenv().ReplicatedStorage_S = ReplicatedStorage
getfenv().ReplicatedFirst_S = ReplicatedFirst
getfenv().LocalPlayer_I = LocalPlayer
getfenv().LocalCharacter_C = LocalCharacter
getfenv().Players_S = PlayersService
getfenv().MaxPlayers_N = #PlayersService:GetPlayers()

--[[
When required just type

print(LocalPlayer_I.Name) -- Prints your username in Output / Dev Console (F9)
]]--
