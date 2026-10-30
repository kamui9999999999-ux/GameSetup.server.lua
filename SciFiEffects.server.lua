local Lighting = game:GetService("Lighting")

Lighting.ClockTime = 20
Lighting.Brightness = 2
Lighting.Ambient = Color3.fromRGB(40, 45, 90)
Lighting.OutdoorAmbient = Color3.fromRGB(20, 30, 60)

local atmosphere = Lighting:FindFirstChild("SciFiAtmosphere")
if not atmosphere then
    atmosphere = Instance.new("Atmosphere")
    atmosphere.Name = "SciFiAtmosphere"
    atmosphere.Parent = Lighting
end

atmosphere.Density = 0.25
atmosphere.Offset = 0.1
atmosphere.Color = Color3.fromRGB(100, 150, 255)
atmosphere.Decay = Color3.fromRGB(40, 20, 80)
atmosphere.Glare = 0.2
atmosphere.Haze = 1.5

local bloom = Lighting:FindFirstChild("SciFiBloom")
if not bloom then
    bloom = Instance.new("BloomEffect")
    bloom.Name = "SciFiBloom"
    bloom.Parent = Lighting
end

bloom.Intensity = 0.5
bloom.Size = 24
bloom.Threshold = 1

local color = Lighting:FindFirstChild("SciFiColor")
if not color then
    color = Instance.new("ColorCorrectionEffect")
    color.Name = "SciFiColor"
    color.Parent = Lighting
end

color.TintColor = Color3.fromRGB(190, 210, 255)
color.Contrast = 0.15
color.Saturation = 0.1
