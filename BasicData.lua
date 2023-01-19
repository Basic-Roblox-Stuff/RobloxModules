local UIS = game:GetService('UserInputService')
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Market = game:GetService("MarketPlaceService")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local PlayersService = game:GetService('Players')
local LocalPlayer = PlayersService.LocalPlayer
local LocalCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

getfenv().UserInputService_S = UIS
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
