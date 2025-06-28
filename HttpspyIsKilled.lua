if ReplicatedStorage:FindFirstChild("0123") then
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Forbidden mode It's already running. brb", true)
    return
end


local boolean = Instance.new("BoolValue")
boolean.Name = "0123"
boolean.Parent = ReplicatedStorage
local Lighting = game:GetService("Lighting")
local atmosphere = workspace:FindFirstChildOfClass("Atmosphere") or Instance.new("Atmosphere", Lighting)
local function updateLightingAndSound()
Lighting.Technology = Enum.Technology.Future
Lighting.EnvironmentDiffuseScale = 0.35
Lighting.EnvironmentSpecularScale = 0.35
Lighting.OutdoorAmbient = Color3.fromRGB(5, 5, 5)
Lighting.Ambient = Color3.fromRGB(10, 10, 10)
Lighting.GlobalShadows = true
Lighting.ShadowSoftness = 0.7
Lighting.ClockTime = 18.5
Lighting.Brightness = 0.3
Lighting.ColorShift_Bottom = Color3.fromRGB(15, 15, 15)
Lighting.ColorShift_Top = Color3.fromRGB(25, 25, 25)
Lighting.ExposureCompensation = -0.75
Lighting.ShadowColor = Color3.fromRGB(15, 15, 15)
Lighting.GeographicLatitude = 45
atmosphere.Density = 0.75
atmosphere.Color = Color3.fromRGB(20, 20, 20)
atmosphere.Haze = 0.8
local colorCorrection = Lighting:FindFirstChildOfClass("ColorCorrectionEffect") or Instance.new("ColorCorrectionEffect", Lighting)
colorCorrection.Contrast = 0.25
colorCorrection.Saturation = -0.4
local function setYellowLighting(light)
light.Shadows = true
light.Brightness = 0.5
light.Range = 10
light.Color = Color3.fromRGB(255, 255, 0)
end
for _, room in pairs(workspace:GetDescendants()) do
if string.lower(room.Name) == "currentrooms" then
for _, light in pairs(room:GetDescendants()) do
if light:IsA("PointLight") or light:IsA("SpotLight") or light:IsA("SurfaceLight") then
setYellowLighting(light)
end
end
end
end
end
local function modifyAllNeon()
for _, obj in pairs(workspace:GetDescendants()) do
if obj.Name == "Neon" then
obj.Color = Color3.fromRGB(255, 255, 0)
end
end
end
modifyAllNeon()
local listenForRoomChanges = coroutine.wrap(function()
while true do
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
updateLightingAndSound()
modifyAllNeon()
end
end)
listenForRoomChanges()
updateLightingAndSound()
modifyAllNeon()
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Forbidden mode is Running...",true)
wait(1)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Loaded",true)
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Credits By RegularVynixu and Bad Darkness What hell????",true)
local shut = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.IntroText
local intro = shut:Clone()
intro.Parent = game.Players.LocalPlayer.PlayerGui.MainUI
intro.Name = "CreditsPleaseThankYou"
intro.Visible = true
intro.Text = "The Forbidden Hotel"
intro.TextTransparency = 0
local underline = UDim2.new(0.7, 0, 0.015, 6)
game.TweenService:Create(intro.Underline, TweenInfo.new(3), {Size = underline}):Play()
wait(7)
game.TweenService:Create(intro.Underline, TweenInfo.new(1.3), {Size = UDim2.new(0.7, 0, 0.015, 6)}):Play()
wait(1)
game.TweenService:Create(intro.Underline, TweenInfo.new(2), {ImageTransparency = 1}):Play()
game.TweenService:Create(intro, TweenInfo.new(2), {TextTransparency = 1}):Play()
game.TweenService:Create(intro.Underline, TweenInfo.new(7), {Size = UDim2.new(0, 0, 0.015, 6)}):Play()
wait(2.3)
intro.Visible = fals
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("F##k...",true)
local function replaceSeekMusic(GithubSnd,SoundName)
local customAsset=ReplaceAudGit(GithubSnd,SoundName)
for _,obj in ipairs(workspace:GetDescendants())do
if obj:IsA("Model")and obj.Name=="SeekMovingNewClone"then
local seekMusic=obj:FindFirstChild("SeekMusic")
if seekMusic and seekMusic:IsA("Sound")then
seekMusic.SoundId=customAsset
end
end
end
end

coroutine.wrap(function()
while true do
--game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
			
replaceSeekMusic("https://github.com/Brololto/BUUMMM/blob/main/Screen_Recording_20230404-233303_YouTube%20(online-audio-converter.com).mp3?raw=true","Seek_RUN_frag")

wait(0.01)
end
end)()
