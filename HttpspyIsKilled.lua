local ReplicatedStorage = game:GetService("ReplicatedStorage")
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
local function CreateCustomEntity(entityConfig, jumpscareConfig)
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local function SetDeathCause(cause, messages, color)
local player = game:GetService("Players").LocalPlayer
game:GetService("ReplicatedStorage").GameStats["Player_"..player.Name].Total.DeathCause.Value = cause
firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, messages, color)
end

local entity = spawner.Create({
Entity = {
Name = entityConfig.Name or "Depth",
Asset = entityConfig.Asset or "rbxassetid://15130436253",
HeightOffset = entityConfig.HeightOffset or 1
},
Lights = {
Flicker = entityConfig.Flicker or {Enabled = true, Duration = 3},
Shatter = entityConfig.Shatter ~= false,
Repair = entityConfig.Repair or false
},
Earthquake = {
Enabled = entityConfig.Earthquake or false
},
CameraShake = {
Enabled = entityConfig.CameraShake ~= false,
Range = entityConfig.ShakeRange or 100,
Values = entityConfig.ShakeValues or {5, 15, 0.1, 1}
},
Movement = {
Speed = entityConfig.Speed or 350,
Delay = entityConfig.MoveDelay or 5,
Reversed = entityConfig.Reversed or false
},
Rebounding = {
Enabled = entityConfig.Rebounding ~= false,
Type = entityConfig.ReboundType or "Ambush",
Min = entityConfig.ReboundMin or 2,
Max = entityConfig.ReboundMax or 4,
Delay = entityConfig.ReboundDelay or 2
},
Damage = {
Enabled = entityConfig.Damage ~= false,
Range = entityConfig.DamageRange or 100,
Amount = entityConfig.DamageAmount or 1
},
Crucifixion = {
Enabled = entityConfig.Crucifixion ~= false,
Range = entityConfig.CrucifixRange or 40,
Resist = entityConfig.CrucifixResist or false,
Break = entityConfig.CrucifixBreak ~= false
},
Death = {
Type = entityConfig.DeathType or "Blue",
Hints = entityConfig.DeathHints or {"You need hide","Depth"},
Cause = entityConfig.DeathCause or "Killed By Depth"
}
})

if jumpscareConfig and jumpscareConfig.Enabled ~= false then
entity:SetCallback("OnDamagePlayer", function(newHealth)
game.Players.LocalPlayer.Character.Humanoid.Health = 0
local TS = game:GetService("TweenService")
local CG = game:GetService("CoreGui")
local MinTeaseSize = jumpscareConfig.MinSize or 150
local MaxTeaseSize = jumpscareConfig.MaxSize or 750
local image1 = "rbxassetid://"..tostring(jumpscareConfig.ImageId1 or 12548027968)
local image2 = "rbxassetid://"..tostring(jumpscareConfig.ImageId2 or 12548027968)
local JumpscareGui = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local Face = Instance.new("ImageLabel")
JumpscareGui.Name = "JumpscareGui"
JumpscareGui.IgnoreGuiInset = true
JumpscareGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Background.Name = "Background"
Background.BackgroundColor3 = Color3.new(0, 0, 0)
Background.BorderSizePixel = 0
Background.Size = UDim2.new(1, 0, 1, 0)
Background.ZIndex = 999
Face.Name = "Face"
Face.AnchorPoint = Vector2.new(0.5, 0.5)
Face.BackgroundTransparency = 1
Face.Position = UDim2.new(0.5, 0, 0.5, 0)
Face.ResampleMode = Enum.ResamplerMode.Pixelated
Face.Size = UDim2.new(0, MinTeaseSize, 0, MinTeaseSize)
Face.Image = image1
Face.Parent = Background
Background.Parent = JumpscareGui
JumpscareGui.Parent = CG
if jumpscareConfig.SoundId1 then
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://"..tostring(jumpscareConfig.SoundId1)
sound.Volume = jumpscareConfig.Sound1Volume or 1
sound.PlayOnRemove = true
sound.Parent = JumpscareGui
sound:Destroy()
end
local rdmTease = math.random(jumpscareConfig.TeaseMin or 4, jumpscareConfig.TeaseMax or 4)
for _ = 1, rdmTease do
task.wait(math.random(100, 200)/100)
local growFactor = (MaxTeaseSize-MinTeaseSize)/rdmTease
Face.Size = UDim2.new(0, Face.AbsoluteSize.X+growFactor, 0, Face.AbsoluteSize.Y+growFactor)
end
task.wait(math.random(100, 200)/100)
if jumpscareConfig.FlashColor then
task.spawn(function()
while JumpscareGui.Parent do
Background.BackgroundColor3 = jumpscareConfig.FlashColor
task.wait(math.random(25, 100)/1000)
Background.BackgroundColor3 = Color3.new(0, 0, 0)
task.wait(math.random(25, 100)/1000)
end
end)
end
if jumpscareConfig.ShakeEnabled ~= false then
task.spawn(function()
local origin = Face.Position
while JumpscareGui.Parent do
Face.Position = origin + UDim2.new(0, math.random(-10, 10), 0, math.random(-10, 10))
Face.Rotation = math.random(-5, 5)
task.wait()
end
end)
end
if jumpscareConfig.SoundId2 then
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://"..tostring(jumpscareConfig.SoundId2)
sound.Volume = jumpscareConfig.Sound2Volume or 5
sound.PlayOnRemove = true
sound.Parent = JumpscareGui
sound:Destroy()
end
Face.Image = image2
Face.Size = UDim2.new(0, 750, 0, 750)
TS:Create(Face, TweenInfo.new(0.75), {
Size = UDim2.new(0, 2000, 0, 2000),
ImageTransparency = 0.5
}):Play()
task.wait(0.75)
JumpscareGui:Destroy()
--game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)
end

return entity
end

local myEntity = CreateCustomEntity(
{
Name = "Depth",
Asset = "rbxassetid://15130436253",
HeightOffset = 1,
Speed = 500,
DamageAmount = 1,
DeathType = "Yellow",
DeathHints = {"You need Hide","Depth"},
DeathCause = "Killed By Depth"
Delay = 0
Flicker = {Enabled = false, Duration = 3},
},
{
Enabled = true,
ImageId1 = 12548027968,
ImageId2 = 12548027968,
SoundId1 = 10483790459,
SoundId2 = 5263560566,
FlashColor = Color3.fromRGB(50, 115, 108),
TeaseMin = 2,
TeaseMax = 2
}
)
local myEntity2 = CreateCustomEntity(
{
Name = "Surge",
Asset = "rbxassetid://15130436253",
HeightOffset = 1,
Speed = 700,
DamageAmount = 1,
DeathType = "Blue",
DeathHints = {"You need hide","He is Fast brb, Surge"},
DeathCause = "Killed By Surge"
Delay = 0
Flicker = {Enabled = false, Duration = 3},
},
{
Enabled = false,
ImageId1 = 12548027968,
ImageId2 = 12548027968,
SoundId1 = 10483790459,
SoundId2 = 5263560566,
FlashColor = Color3.fromRGB(50, 115, 108),
TeaseMin = 2,
TeaseMax = 2
}
)
coroutine.wrap(function()
while true do
wait(205)
local latestRoom = game.ReplicatedStorage.GameData.LatestRoom.Value
local seekExists = false
for _,obj in pairs(game.Workspace:GetChildren()) do
if string.find(obj.Name,"SeekMovingNewClone") then
seekExists = true break end end
if not (latestRoom == 50 or latestRoom == 100 or seekExists) then
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Hide! He is coming!",true)				
myEntity:Run()
break
end
end
end)()
coroutine.wrap(function()
while true do
wait(325)
local latestRoom = game.ReplicatedStorage.GameData.LatestRoom.Value
local seekExists = false
for _,obj in pairs(game.Workspace:GetChildren()) do
if string.find(obj.Name,"SeekMovingNewClone") then
seekExists = true break end end
if not (latestRoom == 50 or latestRoom == 100 or seekExists) then
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("What's that???",true)
local cue2 = Instance.new("Sound")
	cue2.Parent = game.Workspace
	cue2.Name = "Spawn"
	cue2.SoundId = "rbxassetid://3359047385"
	cue2.Volume = 1
	cue2.PlaybackSpeed = 1
	cue2:Play()
wait(1)	
myEntity2:Run()
break
end
end
end)()
