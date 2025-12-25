local G2L = {};

-- StarterGui.ScreenGui
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
G2L["1"]["ResetOnSpawn"] = false;


-- StarterGui.ScreenGui.LoaderAnimationScript
G2L["2"] = Instance.new("LocalScript", G2L["1"]);
G2L["2"]["Name"] = [[LoaderAnimationScript]];


-- StarterGui.ScreenGui.PlayerNameDisplayScript
G2L["3"] = Instance.new("LocalScript", G2L["1"]);
G2L["3"]["Name"] = [[PlayerNameDisplayScript]];


-- StarterGui.ScreenGui.main
G2L["4"] = Instance.new("Frame", G2L["1"]);
G2L["4"]["Visible"] = false;
G2L["4"]["ZIndex"] = 999999999;
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4"]["Size"] = UDim2.new(0, 635, 0, 330);
G2L["4"]["Position"] = UDim2.new(0.24841, 50, 0.20107, 37);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Name"] = [[main]];


-- StarterGui.ScreenGui.main.UICorner
G2L["5"] = Instance.new("UICorner", G2L["4"]);



-- StarterGui.ScreenGui.main.UIDragDetector
G2L["6"] = Instance.new("UIDragDetector", G2L["4"]);



-- StarterGui.ScreenGui.main.UIStroke
G2L["7"] = Instance.new("UIStroke", G2L["4"]);
G2L["7"]["Thickness"] = 2;


-- StarterGui.ScreenGui.main.UIGradient
G2L["8"] = Instance.new("UIGradient", G2L["4"]);
G2L["8"]["Rotation"] = 76;
G2L["8"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 171, 255)),ColorSequenceKeypoint.new(0.100, Color3.fromRGB(126, 126, 126)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(126, 126, 126))};


-- StarterGui.ScreenGui.main.catsense
G2L["9"] = Instance.new("TextLabel", G2L["4"]);
G2L["9"]["TextStrokeTransparency"] = 0.65;
G2L["9"]["BorderSizePixel"] = 0;
G2L["9"]["TextSize"] = 37;
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["9"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["BackgroundTransparency"] = 1;
G2L["9"]["RichText"] = true;
G2L["9"]["Size"] = UDim2.new(0, 184, 0, 32);
G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["Text"] = [[catsense]];
G2L["9"]["Name"] = [[catsense]];
G2L["9"]["Position"] = UDim2.new(0.02972, 0, 0.01818, 0);


-- StarterGui.ScreenGui.main.player
G2L["a"] = Instance.new("Frame", G2L["4"]);
G2L["a"]["ZIndex"] = 999999999;
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a"]["Size"] = UDim2.new(0, 306, 0, 295);
G2L["a"]["Position"] = UDim2.new(0.50284, 0, 0.07576, 0);
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Name"] = [[player]];


-- StarterGui.ScreenGui.main.player.WalkSpeedChangerScript
G2L["b"] = Instance.new("LocalScript", G2L["a"]);
G2L["b"]["Name"] = [[WalkSpeedChangerScript]];


-- StarterGui.ScreenGui.main.player.JumpPowerChangerScript
G2L["c"] = Instance.new("LocalScript", G2L["a"]);
G2L["c"]["Name"] = [[JumpPowerChangerScript]];


-- StarterGui.ScreenGui.main.player.FlyScript
G2L["d"] = Instance.new("LocalScript", G2L["a"]);
G2L["d"]["Name"] = [[FlyScript]];


-- StarterGui.ScreenGui.main.player.FovChangerScript
G2L["e"] = Instance.new("LocalScript", G2L["a"]);
G2L["e"]["Name"] = [[FovChangerScript]];


-- StarterGui.ScreenGui.main.player.UICorner
G2L["f"] = Instance.new("UICorner", G2L["a"]);



-- StarterGui.ScreenGui.main.player.UIStroke
G2L["10"] = Instance.new("UIStroke", G2L["a"]);



-- StarterGui.ScreenGui.main.player.UIGradient
G2L["11"] = Instance.new("UIGradient", G2L["a"]);
G2L["11"]["Rotation"] = 76;
G2L["11"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 171, 255)),ColorSequenceKeypoint.new(0.142, Color3.fromRGB(126, 126, 126)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(126, 126, 126))};


-- StarterGui.ScreenGui.main.player.catsense
G2L["12"] = Instance.new("TextLabel", G2L["a"]);
G2L["12"]["TextStrokeTransparency"] = 0.65;
G2L["12"]["BorderSizePixel"] = 0;
G2L["12"]["TextSize"] = 25;
G2L["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["12"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["12"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["12"]["BackgroundTransparency"] = 1;
G2L["12"]["RichText"] = true;
G2L["12"]["Size"] = UDim2.new(0, 80, 0, 22);
G2L["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["12"]["Text"] = [[self]];
G2L["12"]["Name"] = [[catsense]];
G2L["12"]["Position"] = UDim2.new(0.04134, 0, 0.02121, 0);


-- StarterGui.ScreenGui.main.player.walktext
G2L["13"] = Instance.new("TextBox", G2L["a"]);
G2L["13"]["Name"] = [[walktext]];
G2L["13"]["TextSize"] = 14;
G2L["13"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["13"]["BackgroundColor3"] = Color3.fromRGB(113, 113, 113);
G2L["13"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["13"]["Size"] = UDim2.new(0, 45, 0, 35);
G2L["13"]["Position"] = UDim2.new(0.17974, 0, 0.17966, 0);
G2L["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["13"]["Text"] = [[]];


-- StarterGui.ScreenGui.main.player.minuswalk
G2L["14"] = Instance.new("TextButton", G2L["a"]);
G2L["14"]["TextSize"] = 40;
G2L["14"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["TextYAlignment"] = Enum.TextYAlignment.Bottom;
G2L["14"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 5);
G2L["14"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["14"]["Size"] = UDim2.new(0, 35, 0, 35);
G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["Text"] = [[-]];
G2L["14"]["Name"] = [[minuswalk]];
G2L["14"]["Position"] = UDim2.new(0.04248, 0, 0.17966, 0);


-- StarterGui.ScreenGui.main.player.pluswalk
G2L["15"] = Instance.new("TextButton", G2L["a"]);
G2L["15"]["TextSize"] = 40;
G2L["15"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["15"]["TextYAlignment"] = Enum.TextYAlignment.Bottom;
G2L["15"]["BackgroundColor3"] = Color3.fromRGB(255, 171, 255);
G2L["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["15"]["Size"] = UDim2.new(0, 35, 0, 35);
G2L["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["15"]["Text"] = [[+]];
G2L["15"]["Name"] = [[pluswalk]];
G2L["15"]["Position"] = UDim2.new(0.34967, 0, 0.17966, 0);


-- StarterGui.ScreenGui.main.player.jumptext
G2L["16"] = Instance.new("TextBox", G2L["a"]);
G2L["16"]["Name"] = [[jumptext]];
G2L["16"]["TextSize"] = 14;
G2L["16"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(113, 113, 113);
G2L["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["16"]["Size"] = UDim2.new(0, 45, 0, 35);
G2L["16"]["Position"] = UDim2.new(0.17974, 0, 0.32881, 0);
G2L["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["16"]["Text"] = [[]];


-- StarterGui.ScreenGui.main.player.plusjump
G2L["17"] = Instance.new("TextButton", G2L["a"]);
G2L["17"]["TextSize"] = 40;
G2L["17"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["17"]["TextYAlignment"] = Enum.TextYAlignment.Bottom;
G2L["17"]["BackgroundColor3"] = Color3.fromRGB(255, 171, 255);
G2L["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["17"]["Size"] = UDim2.new(0, 35, 0, 35);
G2L["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["17"]["Text"] = [[+]];
G2L["17"]["Name"] = [[plusjump]];
G2L["17"]["Position"] = UDim2.new(0.34967, 0, 0.32881, 0);


-- StarterGui.ScreenGui.main.player.minusjump
G2L["18"] = Instance.new("TextButton", G2L["a"]);
G2L["18"]["TextSize"] = 40;
G2L["18"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["18"]["TextYAlignment"] = Enum.TextYAlignment.Bottom;
G2L["18"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 5);
G2L["18"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["18"]["Size"] = UDim2.new(0, 35, 0, 35);
G2L["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["18"]["Text"] = [[-]];
G2L["18"]["Name"] = [[minusjump]];
G2L["18"]["Position"] = UDim2.new(0.04248, 0, 0.32881, 0);


-- StarterGui.ScreenGui.main.player.walk
G2L["19"] = Instance.new("TextLabel", G2L["a"]);
G2L["19"]["TextStrokeTransparency"] = 0.65;
G2L["19"]["BorderSizePixel"] = 0;
G2L["19"]["TextSize"] = 28;
G2L["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["19"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["19"]["BackgroundTransparency"] = 1;
G2L["19"]["RichText"] = true;
G2L["19"]["Size"] = UDim2.new(0, 145, 0, 28);
G2L["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["19"]["Text"] = [[walkspeed]];
G2L["19"]["Name"] = [[walk]];
G2L["19"]["Position"] = UDim2.new(0.50212, 0, 0.1907, 0);


-- StarterGui.ScreenGui.main.player.jump
G2L["1a"] = Instance.new("TextLabel", G2L["a"]);
G2L["1a"]["TextStrokeTransparency"] = 0.65;
G2L["1a"]["BorderSizePixel"] = 0;
G2L["1a"]["TextSize"] = 29;
G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["1a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1a"]["BackgroundTransparency"] = 1;
G2L["1a"]["RichText"] = true;
G2L["1a"]["Size"] = UDim2.new(0, 145, 0, 28);
G2L["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1a"]["Text"] = [[jumpspeed]];
G2L["1a"]["Name"] = [[jump]];
G2L["1a"]["Position"] = UDim2.new(0.50212, 0, 0.33986, 0);


-- StarterGui.ScreenGui.main.player.fly
G2L["1b"] = Instance.new("TextButton", G2L["a"]);
G2L["1b"]["TextSize"] = 14;
G2L["1b"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 5);
G2L["1b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1b"]["Size"] = UDim2.new(0, 35, 0, 35);
G2L["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1b"]["Text"] = [[]];
G2L["1b"]["Name"] = [[fly]];
G2L["1b"]["Position"] = UDim2.new(0.04248, 0, 0.63729, 0);


-- StarterGui.ScreenGui.main.player.airstuck
G2L["1c"] = Instance.new("TextLabel", G2L["a"]);
G2L["1c"]["TextStrokeTransparency"] = 0.65;
G2L["1c"]["BorderSizePixel"] = 0;
G2L["1c"]["TextSize"] = 29;
G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1c"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["1c"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["BackgroundTransparency"] = 1;
G2L["1c"]["RichText"] = true;
G2L["1c"]["Size"] = UDim2.new(0, 145, 0, 28);
G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["Text"] = [[airstuck]];
G2L["1c"]["Name"] = [[airstuck]];
G2L["1c"]["Position"] = UDim2.new(0.21127, 0, 0.64833, 0);


-- StarterGui.ScreenGui.main.player.minusfov
G2L["1d"] = Instance.new("TextButton", G2L["a"]);
G2L["1d"]["TextSize"] = 40;
G2L["1d"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1d"]["TextYAlignment"] = Enum.TextYAlignment.Bottom;
G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 5);
G2L["1d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["1d"]["Size"] = UDim2.new(0, 35, 0, 35);
G2L["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1d"]["Text"] = [[-]];
G2L["1d"]["Name"] = [[minusfov]];
G2L["1d"]["Position"] = UDim2.new(0.04248, 0, 0.48034, 0);


-- StarterGui.ScreenGui.main.player.fovtext
G2L["1e"] = Instance.new("TextBox", G2L["a"]);
G2L["1e"]["Name"] = [[fovtext]];
G2L["1e"]["TextSize"] = 14;
G2L["1e"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1e"]["BackgroundColor3"] = Color3.fromRGB(113, 113, 113);
G2L["1e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1e"]["Size"] = UDim2.new(0, 45, 0, 35);
G2L["1e"]["Position"] = UDim2.new(0.17974, 0, 0.48229, 0);
G2L["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1e"]["Text"] = [[]];


-- StarterGui.ScreenGui.main.player.plusfov
G2L["1f"] = Instance.new("TextButton", G2L["a"]);
G2L["1f"]["TextSize"] = 40;
G2L["1f"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1f"]["TextYAlignment"] = Enum.TextYAlignment.Bottom;
G2L["1f"]["BackgroundColor3"] = Color3.fromRGB(255, 171, 255);
G2L["1f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["1f"]["Size"] = UDim2.new(0, 35, 0, 35);
G2L["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1f"]["Text"] = [[+]];
G2L["1f"]["Name"] = [[plusfov]];
G2L["1f"]["Position"] = UDim2.new(0.34967, 0, 0.48229, 0);


-- StarterGui.ScreenGui.main.player.win
G2L["20"] = Instance.new("TextLabel", G2L["a"]);
G2L["20"]["TextStrokeTransparency"] = 0.65;
G2L["20"]["BorderSizePixel"] = 0;
G2L["20"]["TextSize"] = 28;
G2L["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["20"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["20"]["BackgroundTransparency"] = 1;
G2L["20"]["RichText"] = true;
G2L["20"]["Size"] = UDim2.new(0, 65, 0, 28);
G2L["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["20"]["Text"] = [[fov]];
G2L["20"]["Name"] = [[win]];
G2L["20"]["Position"] = UDim2.new(0.64265, 0, 0.49816, 0);


-- StarterGui.ScreenGui.main.other
G2L["21"] = Instance.new("Frame", G2L["4"]);
G2L["21"]["ZIndex"] = 999999999;
G2L["21"]["BorderSizePixel"] = 0;
G2L["21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["21"]["Size"] = UDim2.new(0, 306, 0, 207);
G2L["21"]["Position"] = UDim2.new(0.00993, 0, 0.34242, 0);
G2L["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["21"]["Name"] = [[other]];


-- StarterGui.ScreenGui.main.other.TeleportScript
G2L["22"] = Instance.new("LocalScript", G2L["21"]);
G2L["22"]["Name"] = [[TeleportScript]];


-- StarterGui.ScreenGui.main.other.UICorner
G2L["23"] = Instance.new("UICorner", G2L["21"]);



-- StarterGui.ScreenGui.main.other.UIStroke
G2L["24"] = Instance.new("UIStroke", G2L["21"]);



-- StarterGui.ScreenGui.main.other.UIGradient
G2L["25"] = Instance.new("UIGradient", G2L["21"]);
G2L["25"]["Rotation"] = 76;
G2L["25"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 171, 255)),ColorSequenceKeypoint.new(0.142, Color3.fromRGB(126, 126, 126)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(126, 126, 126))};


-- StarterGui.ScreenGui.main.other.catsense
G2L["26"] = Instance.new("TextLabel", G2L["21"]);
G2L["26"]["TextStrokeTransparency"] = 0.65;
G2L["26"]["BorderSizePixel"] = 0;
G2L["26"]["TextSize"] = 25;
G2L["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["26"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["26"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["26"]["BackgroundTransparency"] = 1;
G2L["26"]["RichText"] = true;
G2L["26"]["Size"] = UDim2.new(0, 80, 0, 22);
G2L["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["26"]["Text"] = [[other]];
G2L["26"]["Name"] = [[catsense]];
G2L["26"]["Position"] = UDim2.new(0.04134, 0, 0.02121, 0);


-- StarterGui.ScreenGui.main.other.win
G2L["27"] = Instance.new("TextLabel", G2L["21"]);
G2L["27"]["TextStrokeTransparency"] = 0.65;
G2L["27"]["BorderSizePixel"] = 0;
G2L["27"]["TextSize"] = 28;
G2L["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["27"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["27"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["27"]["BackgroundTransparency"] = 1;
G2L["27"]["RichText"] = true;
G2L["27"]["Size"] = UDim2.new(0, 228, 0, 28);
G2L["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["27"]["Text"] = [[win/30s timer]];
G2L["27"]["Name"] = [[win]];
G2L["27"]["Position"] = UDim2.new(0.22761, 0, 0.21969, 0);


-- StarterGui.ScreenGui.main.other.teleport
G2L["28"] = Instance.new("TextButton", G2L["21"]);
G2L["28"]["TextSize"] = 14;
G2L["28"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["28"]["BackgroundColor3"] = Color3.fromRGB(255, 171, 255);
G2L["28"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["28"]["Size"] = UDim2.new(0, 35, 0, 35);
G2L["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["28"]["Text"] = [[]];
G2L["28"]["Name"] = [[teleport]];
G2L["28"]["Position"] = UDim2.new(0.03922, 0, 0.19386, 0);


-- StarterGui.ScreenGui.main.other.esp
G2L["29"] = Instance.new("TextButton", G2L["21"]);
G2L["29"]["TextSize"] = 14;
G2L["29"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["29"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 5);
G2L["29"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["29"]["Size"] = UDim2.new(0, 35, 0, 35);
G2L["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["29"]["Text"] = [[]];
G2L["29"]["Name"] = [[esp]];
G2L["29"]["Position"] = UDim2.new(0.03922, 0, 0.41125, 0);


-- StarterGui.ScreenGui.main.other.esp
G2L["2a"] = Instance.new("TextLabel", G2L["21"]);
G2L["2a"]["TextStrokeTransparency"] = 0.65;
G2L["2a"]["BorderSizePixel"] = 0;
G2L["2a"]["TextSize"] = 28;
G2L["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2a"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["2a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2a"]["BackgroundTransparency"] = 1;
G2L["2a"]["RichText"] = true;
G2L["2a"]["Size"] = UDim2.new(0, 66, 0, 28);
G2L["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2a"]["Text"] = [[esp]];
G2L["2a"]["Name"] = [[esp]];
G2L["2a"]["Position"] = UDim2.new(0.25376, 0, 0.42742, 0);


-- StarterGui.ScreenGui.main.other.ESPScript
G2L["2b"] = Instance.new("LocalScript", G2L["21"]);
G2L["2b"]["Name"] = [[ESPScript]];


-- StarterGui.ScreenGui.main.catsense
G2L["2c"] = Instance.new("TextLabel", G2L["4"]);
G2L["2c"]["TextStrokeTransparency"] = 0.65;
G2L["2c"]["BorderSizePixel"] = 0;
G2L["2c"]["TextSize"] = 15;
G2L["2c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2c"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["2c"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2c"]["BackgroundTransparency"] = 1;
G2L["2c"]["RichText"] = true;
G2L["2c"]["Size"] = UDim2.new(0, 204, 0, 25);
G2L["2c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2c"]["Text"] = [[dont get crushed by 67]];
G2L["2c"]["Name"] = [[catsense]];
G2L["2c"]["Position"] = UDim2.new(0.02343, 0, 0.11515, 0);


-- StarterGui.ScreenGui.loader
G2L["2d"] = Instance.new("Frame", G2L["1"]);
G2L["2d"]["Visible"] = false;
G2L["2d"]["ZIndex"] = 999999999;
G2L["2d"]["BorderSizePixel"] = 0;
G2L["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2d"]["Size"] = UDim2.new(0, 283, 0, 192);
G2L["2d"]["Position"] = UDim2.new(0.36794, 50, 0.30269, 37);
G2L["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2d"]["Name"] = [[loader]];


-- StarterGui.ScreenGui.loader.UICorner
G2L["2e"] = Instance.new("UICorner", G2L["2d"]);



-- StarterGui.ScreenGui.loader.UIStroke
G2L["2f"] = Instance.new("UIStroke", G2L["2d"]);
G2L["2f"]["Thickness"] = 2;


-- StarterGui.ScreenGui.loader.UIGradient
G2L["30"] = Instance.new("UIGradient", G2L["2d"]);
G2L["30"]["Rotation"] = 76;
G2L["30"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 171, 255)),ColorSequenceKeypoint.new(0.370, Color3.fromRGB(126, 126, 126)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(126, 126, 126))};


-- StarterGui.ScreenGui.loader.catsense
G2L["31"] = Instance.new("TextLabel", G2L["2d"]);
G2L["31"]["TextStrokeTransparency"] = 0.65;
G2L["31"]["BorderSizePixel"] = 0;
G2L["31"]["TextSize"] = 30;
G2L["31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["31"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["31"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["31"]["BackgroundTransparency"] = 1;
G2L["31"]["RichText"] = true;
G2L["31"]["Size"] = UDim2.new(0, 139, 0, 32);
G2L["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["31"]["Text"] = [[catsense]];
G2L["31"]["Name"] = [[catsense]];
G2L["31"]["Position"] = UDim2.new(0.07369, 0, 0.03183, 0);


-- StarterGui.ScreenGui.loader.loading
G2L["32"] = Instance.new("TextLabel", G2L["2d"]);
G2L["32"]["TextStrokeTransparency"] = 0.65;
G2L["32"]["BorderSizePixel"] = 0;
G2L["32"]["TextSize"] = 50;
G2L["32"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["32"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["32"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["32"]["BackgroundTransparency"] = 1;
G2L["32"]["RichText"] = true;
G2L["32"]["Size"] = UDim2.new(0, 212, 0, 77);
G2L["32"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["32"]["Text"] = [[Loading]];
G2L["32"]["Name"] = [[loading]];
G2L["32"]["Position"] = UDim2.new(0.12316, 0, 0.55634, 0);


-- StarterGui.ScreenGui.loader.support
G2L["33"] = Instance.new("TextLabel", G2L["2d"]);
G2L["33"]["TextStrokeTransparency"] = 0.65;
G2L["33"]["BorderSizePixel"] = 0;
G2L["33"]["TextSize"] = 17;
G2L["33"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["33"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["33"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["33"]["BackgroundTransparency"] = 1;
G2L["33"]["RichText"] = true;
G2L["33"]["Size"] = UDim2.new(0, 153, 0, 32);
G2L["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["33"]["Text"] = [[mobile support]];
G2L["33"]["Name"] = [[support]];
G2L["33"]["Position"] = UDim2.new(0.07369, 0, 0.16578, 0);


-- StarterGui.ScreenGui.loader.nick
G2L["34"] = Instance.new("TextLabel", G2L["2d"]);
G2L["34"]["TextStrokeTransparency"] = 0.65;
G2L["34"]["BorderSizePixel"] = 0;
G2L["34"]["TextSize"] = 21;
G2L["34"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["34"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["34"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["34"]["BackgroundTransparency"] = 1;
G2L["34"]["RichText"] = true;
G2L["34"]["Size"] = UDim2.new(0, 168, 0, 25);
G2L["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["34"]["Text"] = [[nick]];
G2L["34"]["Name"] = [[nick]];
G2L["34"]["Position"] = UDim2.new(0.2041, 0, 0.48777, 0);


-- StarterGui.ScreenGui.UIAspectRatioConstraint
G2L["35"] = Instance.new("UIAspectRatioConstraint", G2L["1"]);
G2L["35"]["AspectRatio"] = 1.6015;


-- StarterGui.ScreenGui.LoaderAnimationScript
local function C_2()
local script = G2L["2"];
	-- Loader Animation Script
	local TweenService = game:GetService("TweenService")
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	
	-- GUI Elements
	local screenGui = script.Parent
	local loaderFrame = screenGui.loader
	local mainFrame = screenGui.main
	
	-- Animation settings
	local ANIMATION_DURATION = 0.8 -- Duration of the pull-up/pull-down animation
	local LOADER_DISPLAY_TIME = 3 -- Time to show loader
	
	-- Initial setup
	loaderFrame.Visible = true
	mainFrame.Visible = false
	
	-- Set initial position for loader (off-screen at bottom)
	local initialPosition = loaderFrame.Position
	local offScreenPosition = UDim2.new(initialPosition.X.Scale, initialPosition.X.Offset, 1.2, 0) -- Start below screen
	loaderFrame.Position = offScreenPosition
	
	-- Create tween information
	local tweenInfo = TweenInfo.new(
	    ANIMATION_DURATION,
	    Enum.EasingStyle.Quint,
	    Enum.EasingDirection.Out,
	    0,
	    false,
	    0
	)
	
	-- Create the pull-up animation for loader
	local pullUpTween = TweenService:Create(
	    loaderFrame,
	    tweenInfo,
	    { Position = initialPosition } -- Move to original position
	)
	
	-- Create the pull-down animation for loader
	local pullDownTween = TweenService:Create(
	    loaderFrame,
	    tweenInfo,
	    { Position = offScreenPosition } -- Move back below screen
	)
	
	-- Set initial position for main frame (off-screen at bottom)
	local mainInitialPosition = mainFrame.Position
	local mainOffScreenPosition = UDim2.new(mainInitialPosition.X.Scale, mainInitialPosition.X.Offset, 1.2, 0) -- Start below screen
	mainFrame.Position = mainOffScreenPosition
	
	-- Create the pull-up animation for main frame
	local mainPullUpTween = TweenService:Create(
	    mainFrame,
	    tweenInfo,
	    { Position = mainInitialPosition } -- Move to original position
	)
	
	-- Function to start the loading sequence
	local function startLoadingSequence()
	    print("Starting loader animation sequence")
	    
	    -- Play the pull-up animation for loader
	    pullUpTween:Play()
	    
	    -- Wait for animation to complete + display time
	    task.wait(ANIMATION_DURATION + LOADER_DISPLAY_TIME)
	    
	    -- Play the pull-down animation for loader
	    pullDownTween:Play()
	    
	    -- Wait for pull-down animation to complete
	    task.wait(ANIMATION_DURATION)
	    
	    -- Hide loader
	    loaderFrame.Visible = false
	    print("Loader hidden")
	    
	    -- Show main frame
	    mainFrame.Visible = true
	    
	    -- Play the pull-up animation for main frame
	    mainPullUpTween:Play()
	    print("Main frame shown with pull-up animation")
	end
	
	-- Wait for player to be fully loaded
	local function waitForPlayerLoad()
	    -- Wait for character to load
	    if not LocalPlayer.Character then
	        LocalPlayer.CharacterAdded:Wait()
	    end
	    
	    -- Additional wait to ensure everything is ready
	    task.wait(0.5)
	    
	    -- Start the loading sequence
	    startLoadingSequence()
	end
	
	-- Start the sequence when script runs
	waitForPlayerLoad()
	
	print("Loader Animation Script initialized")
end;
task.spawn(C_2);
-- StarterGui.ScreenGui.PlayerNameDisplayScript
local function C_3()
local script = G2L["3"];
	-- Player Name Display Script
	local Players = game:GetService("Players")
	
	-- GUI Elements
	local screenGui = script.Parent
	local nickLabel = screenGui.loader.nick
	
	-- Player info
	local LocalPlayer = Players.LocalPlayer
	
	-- Function to update the nickname display
	local function updateNickname()
	    if LocalPlayer and nickLabel then
	        nickLabel.Text = LocalPlayer.DisplayName
	        print("Updated nickname to: " .. LocalPlayer.DisplayName)
	    end
	end
	
	-- Initialize when player is ready
	local function initialize()
	    -- Wait for player to be fully loaded
	    if not LocalPlayer then
	        Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	    end
	    
	    -- Update the nickname
	    updateNickname()
	    
	    -- Listen for display name changes (in case player changes it)
	    LocalPlayer:GetPropertyChangedSignal("DisplayName"):Connect(updateNickname)
	    
	    print("Player Name Display Script initialized")
	end
	
	-- Start initialization
	initialize()
end;
task.spawn(C_3);
-- StarterGui.ScreenGui.main.player.WalkSpeedChangerScript
local function C_b()
local script = G2L["b"];
	-- Walk Speed Changer Script
	local Players = game:GetService("Players")
	
	local player = Players.LocalPlayer
	
	-- Function to get current humanoid safely
	local function getCurrentHumanoid()
	    local char = player.Character
	    if char then
	        return char:FindFirstChildOfClass("Humanoid")
	    end
	    return nil
	end
	
	-- Find the GUI elements
	local screenGui = player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
	local playerFrame = screenGui:WaitForChild("main"):WaitForChild("player")
	local walkText = playerFrame:WaitForChild("walktext")
	local minusButton = playerFrame:WaitForChild("minuswalk")
	local plusButton = playerFrame:WaitForChild("pluswalk")
	
	-- Variables
	local currentSpeed = 16 -- Default walk speed
	local minSpeed = 16
	local maxSpeed = 750
	
	-- Function to save walk speed to player data
	local function saveWalkSpeed()
	    player:SetAttribute("SavedWalkSpeed", currentSpeed)
	end
	
	-- Function to load walk speed from player data
	local function loadWalkSpeed()
	    local savedSpeed = player:GetAttribute("SavedWalkSpeed")
	    if savedSpeed and savedSpeed >= minSpeed and savedSpeed <= maxSpeed then
	        currentSpeed = savedSpeed
	        print("Loaded saved WalkSpeed: " .. currentSpeed)
	    else
	        currentSpeed = 16 -- Default value
	        print("Using default WalkSpeed: " .. currentSpeed)
	    end
	end
	
	-- Function to update walk speed and display
	local function updateWalkSpeed(newSpeed)
	    -- Clamp the speed
	    newSpeed = math.clamp(newSpeed, minSpeed, maxSpeed)
	    currentSpeed = newSpeed
	    
	    -- Update the text display
	    walkText.Text = tostring(currentSpeed)
	    
	    -- Update the actual walk speed
	    local humanoid = getCurrentHumanoid()
	    if humanoid then
	        humanoid.WalkSpeed = currentSpeed
	    end
	    
	    -- Save the walk speed after updating
	    saveWalkSpeed()
	end
	
	-- Initialize with saved walk speed
	loadWalkSpeed()
	updateWalkSpeed(currentSpeed)
	
	-- Minus button click event
	minusButton.MouseButton1Click:Connect(function()
	    updateWalkSpeed(currentSpeed - 16)
	end)
	
	-- Plus button click event
	plusButton.MouseButton1Click:Connect(function()
	    updateWalkSpeed(currentSpeed + 16)
	end)
	
	-- Handle character respawn (maintain walk speed)
	player.CharacterAdded:Connect(function(newCharacter)
	    -- Wait for character to fully load
	    newCharacter:WaitForChild("Humanoid")
	    task.wait(0.1)
	    -- Load the saved walk speed and apply it
	    loadWalkSpeed()
	    updateWalkSpeed(currentSpeed)
	    print("WalkSpeed maintained after respawn: " .. currentSpeed)
	end)
	
	-- Also handle when humanoid is added to existing character
	if player.Character then
	    player.Character.ChildAdded:Connect(function(child)
	        if child:IsA("Humanoid") then
	            -- Update with current saved value when humanoid is added
	            loadWalkSpeed()
	            updateWalkSpeed(currentSpeed)
	        end
	    end)
	end
	
	print("WalkSpeed Changer initialized with persistent speed: " .. currentSpeed)
end;
task.spawn(C_b);
-- StarterGui.ScreenGui.main.player.JumpPowerChangerScript
local function C_c()
local script = G2L["c"];
	-- Jump Power Changer Script
	local Players = game:GetService("Players")
	local UserInputService = game:GetService("UserInputService")
	
	local player = Players.LocalPlayer
	
	-- Function to get current humanoid safely
	local function getCurrentHumanoid()
	    local char = player.Character
	    if char then
	        return char:FindFirstChildOfClass("Humanoid")
	    end
	    return nil
	end
	
	-- Find the GUI elements
	local screenGui = player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
	local playerFrame = screenGui:WaitForChild("main"):WaitForChild("player")
	local jumpText = playerFrame:WaitForChild("jumptext")
	local minusButton = playerFrame:WaitForChild("minusjump")
	local plusButton = playerFrame:WaitForChild("plusjump")
	
	-- Variables
	local currentJump = 50 -- Default jump power
	local minJump = 8
	local maxJump = 500
	
	-- Function to save jump power to player data
	local function saveJumpPower()
	    player:SetAttribute("SavedJumpPower", currentJump)
	end
	
	-- Function to load jump power from player data
	local function loadJumpPower()
	    local savedJump = player:GetAttribute("SavedJumpPower")
	    if savedJump and savedJump >= minJump and savedJump <= maxJump then
	        currentJump = savedJump
	        print("Loaded saved JumpPower: " .. currentJump)
	    else
	        currentJump = 50 -- Default value
	        print("Using default JumpPower: " .. currentJump)
	    end
	end
	
	-- Function to update jump power and display
	local function updateJumpPower(newJump)
	    -- Clamp the jump power
	    newJump = math.clamp(newJump, minJump, maxJump)
	    currentJump = newJump
	    
	    -- Update the text display
	    jumpText.Text = tostring(currentJump)
	    
	    -- Update the actual jump power immediately
	    local humanoid = getCurrentHumanoid()
	    if humanoid then
	        humanoid.JumpPower = currentJump
	        humanoid.UseJumpPower = true -- Make sure jump power is enabled
	        print("Set JumpPower to: " .. currentJump .. ", UseJumpPower: " .. tostring(humanoid.UseJumpPower))
	    else
	        print("No humanoid found when trying to set jump power")
	    end
	    
	    -- Save the jump power after updating
	    saveJumpPower()
	end
	
	-- Function to ensure jump power is applied
	local function ensureJumpPower()
	    local humanoid = getCurrentHumanoid()
	    if humanoid then
	        if humanoid.JumpPower ~= currentJump then
	            humanoid.JumpPower = currentJump
	            humanoid.UseJumpPower = true
	            print("Corrected JumpPower to: " .. currentJump)
	        end
	    end
	end
	
	-- Initialize with saved jump power
	loadJumpPower()
	updateJumpPower(currentJump)
	
	-- Minus button click event (decrease by 8)
	minusButton.MouseButton1Click:Connect(function()
	    updateJumpPower(currentJump - 8)
	end)
	
	-- Plus button click event (increase by 16)
	plusButton.MouseButton1Click:Connect(function()
	    updateJumpPower(currentJump + 16)
	end)
	
	-- Handle character respawn (maintain jump power)
	player.CharacterAdded:Connect(function(newCharacter)
	    -- Wait for character to fully load
	    newCharacter:WaitForChild("Humanoid")
	    task.wait(0.5)
	    -- Load the saved jump power and apply it
	    loadJumpPower()
	    updateJumpPower(currentJump)
	    print("JumpPower maintained after respawn: " .. currentJump)
	end)
	
	-- Check jump power periodically
	local lastCheck = 0
	game:GetService("RunService").Heartbeat:Connect(function()
	    lastCheck = lastCheck + 1
	    if lastCheck >= 30 then -- Check every 30 frames (about 0.5 seconds)
	        ensureJumpPower()
	        lastCheck = 0
	    end
	end)
	
	-- Also check when spacebar is pressed (for debugging)
	UserInputService.InputBegan:Connect(function(input, gameProcessed)
	    if input.KeyCode == Enum.KeyCode.Space and not gameProcessed then
	        local humanoid = getCurrentHumanoid()
	        if humanoid then
	            print("Jump pressed! Current JumpPower: " .. humanoid.JumpPower .. ", UseJumpPower: " .. tostring(humanoid.UseJumpPower))
	        end
	    end
	end)
	
	print("JumpPower Changer initialized with persistent jump power: " .. currentJump)
end;
task.spawn(C_c);
-- StarterGui.ScreenGui.main.player.FlyScript
local function C_d()
local script = G2L["d"];
	-- Fly Toggle Script (Improved Version)
	local Players = game:GetService("Players")
	local UserInputService = game:GetService("UserInputService")
	local RunService = game:GetService("RunService")
	
	local player = Players.LocalPlayer
	local flyButton = script.Parent.fly
	
	-- Fly variables
	local isFlying = false
	local flySpeed = 60
	local camera = workspace.CurrentCamera
	local bodyVelocity = nil
	local bodyGyro = nil
	local connection = nil
	local lastToggleTime = 0
	local TOGGLE_COOLDOWN = 0.5
	
	-- Function to get current humanoid safely
	local function getCurrentHumanoid()
	    local char = player.Character
	    if char then
	        return char:FindFirstChildOfClass("Humanoid")
	    end
	    return nil
	end
	
	-- Function to clean up fly components
	local function cleanupFlyComponents()
	    if bodyVelocity then
	        bodyVelocity:Destroy()
	        bodyVelocity = nil
	    end
	    
	    if bodyGyro then
	        bodyGyro:Destroy()
	        bodyGyro = nil
	    end
	    
	    if connection then
	        connection:Disconnect()
	        connection = nil
	    end
	end
	
	-- Function to enable flying
	local function enableFly()
	    -- Prevent rapid toggling
	    local currentTime = tick()
	    if currentTime - lastToggleTime < TOGGLE_COOLDOWN then
	        return
	    end
	    lastToggleTime = currentTime
	    
	    local character = player.Character
	    if not character then 
	        warn("No character found")
	        return 
	    end
	    
	    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	    if not humanoidRootPart then 
	        warn("No HumanoidRootPart found")
	        return 
	    end
	    
	    local humanoid = getCurrentHumanoid()
	    if not humanoid then 
	        warn("No Humanoid found")
	        return 
	    end
	    
	    -- Clean up any existing components first
	    cleanupFlyComponents()
	    
	    -- Disable gravity and normal movement
	    humanoid.PlatformStand = true
	    humanoid:ChangeState(Enum.HumanoidStateType.Physics)
	    
	    -- Create BodyVelocity for flying
	    bodyVelocity = Instance.new("BodyVelocity")
	    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000) -- Reduced from math.huge for stability
	    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
	    bodyVelocity.P = 1250
	    bodyVelocity.Parent = humanoidRootPart
	    
	    -- Create BodyGyro for stability
	    bodyGyro = Instance.new("BodyGyro")
	    bodyGyro.MaxTorque = Vector3.new(4000, 4000, 4000) -- Reduced from math.huge for stability
	    bodyGyro.P = 1250
	    bodyGyro.D = 50
	    bodyGyro.CFrame = camera.CFrame
	    bodyGyro.Parent = humanoidRootPart
	    
	    isFlying = true
	    flyButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Orange when active
	    print("Flying enabled")
	end
	
	-- Function to disable flying
	local function disableFly()
	    -- Prevent rapid toggling
	    local currentTime = tick()
	    if currentTime - lastToggleTime < TOGGLE_COOLDOWN then
	        return
	    end
	    lastToggleTime = currentTime
	    
	    local character = player.Character
	    if not character then return end
	    
	    local humanoid = getCurrentHumanoid()
	    if humanoid then
	        -- Re-enable normal movement
	        humanoid.PlatformStand = false
	        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
	    end
	    
	    -- Clean up fly components
	    cleanupFlyComponents()
	    
	    isFlying = false
	    flyButton.BackgroundColor3 = Color3.new(1, 0, 0.0156863) -- Green when inactive
	    print("Flying disabled")
	end
	
	-- Function to handle flying movement
	local function handleFlyMovement()
	    if not isFlying then return end
	    
	    local character = player.Character
	    if not character then 
	        disableFly()
	        return 
	    end
	    
	    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	    if not humanoidRootPart then 
	        disableFly()
	        return 
	    end
	    
	    -- Calculate movement direction
	    local moveDirection = Vector3.new(0, 0, 0)
	    
	    -- Get keyboard input with better handling
	    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
	        moveDirection = moveDirection + camera.CFrame.LookVector
	    end
	    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
	        moveDirection = moveDirection - camera.CFrame.LookVector
	    end
	    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
	        moveDirection = moveDirection - camera.CFrame.RightVector
	    end
	    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
	        moveDirection = moveDirection + camera.CFrame.RightVector
	    end
	    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
	        moveDirection = moveDirection + Vector3.new(0, 1, 0)
	    end
	    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
	        moveDirection = moveDirection - Vector3.new(0, 1, 0)
	    end
	    
	    -- Apply movement with better physics
	    if bodyVelocity and moveDirection.Magnitude > 0 then
	        local normalizedDirection = moveDirection.Unit
	        bodyVelocity.Velocity = normalizedDirection * flySpeed
	    elseif bodyVelocity then
	        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
	    end
	    
	    -- Update gyro to face camera direction
	    if bodyGyro then
	        bodyGyro.CFrame = camera.CFrame
	    end
	end
	
	-- Fly button click event with debouncing
	flyButton.MouseButton1Click:Connect(function()
	    if isFlying then
	        disableFly()
	    else
	        enableFly()
	    end
	end)
	
	-- Handle character respawn (disable flying)
	player.CharacterAdded:Connect(function(newCharacter)
	    if isFlying then
	        disableFly()
	    end
	    
	    -- Set up death detection for new character
	    local humanoid = getCurrentHumanoid()
	    if humanoid then
	        humanoid.Died:Connect(function()
	            if isFlying then
	                disableFly()
	            end
	        end)
	    end
	end)
	
	-- Set up death detection for existing character
	if player.Character then
	    local humanoid = getCurrentHumanoid()
	    if humanoid then
	        humanoid.Died:Connect(function()
	            if isFlying then
	                disableFly()
	            end
	        end)
	    end
	end
	
	-- Start flying movement loop using RenderStepped for smoother movement
	connection = RunService.RenderStepped:Connect(handleFlyMovement)
end;
task.spawn(C_d);
-- StarterGui.ScreenGui.main.player.FovChangerScript
local function C_e()
local script = G2L["e"];
	-- FOV Changer Script
	local Players = game:GetService("Players")
	local Workspace = game:GetService("Workspace")
	
	local player = Players.LocalPlayer
	local fovtext = script.Parent.fovtext
	local minusfov = script.Parent.minusfov
	local plusfov = script.Parent.plusfov
	
	-- FOV variables
	local currentFOV = 70
	local MIN_FOV = 70
	local MAX_FOV = 120
	local FOV_STEP = 2
	
	-- Function to update FOV display and camera
	local function updateFOV()
	    -- Update display text
	    fovtext.Text = tostring(currentFOV)
	    
	    -- Apply FOV to camera
	    local camera = Workspace.CurrentCamera
	    if camera then
	        camera.FieldOfView = currentFOV
	    end
	    
	    -- Update button states
	    minusfov.Active = currentFOV > MIN_FOV
	    minusfov.Selectable = currentFOV > MIN_FOV
	    minusfov.BackgroundColor3 = currentFOV > MIN_FOV and Color3.new(1, 0, 0.0156863) or Color3.new(1, 0, 0.0156863)
	    
	    plusfov.Active = currentFOV < MAX_FOV
	    plusfov.Selectable = currentFOV < MAX_FOV
		plusfov.BackgroundColor3 = currentFOV < MAX_FOV and Color3.new(1, 0.666667, 1) or Color3.new(1, 0.666667, 1)
	end
	
	-- Function to decrease FOV
	local function decreaseFOV()
	    if currentFOV > MIN_FOV then
	        currentFOV = math.max(MIN_FOV, currentFOV - FOV_STEP)
	        updateFOV()
	        print("FOV decreased to: " .. currentFOV)
	    end
	end
	
	-- Function to increase FOV
	local function increaseFOV()
	    if currentFOV < MAX_FOV then
	        currentFOV = math.min(MAX_FOV, currentFOV + FOV_STEP)
	        updateFOV()
	        print("FOV increased to: " .. currentFOV)
	    end
	end
	
	-- Function to handle text input in fovtext
	local function onFOVTextChanged()
	    local input = fovtext.Text
	    local number = tonumber(input)
	    
	    if number then
	        -- Clamp to valid range
	        currentFOV = math.max(MIN_FOV, math.min(MAX_FOV, number))
	        updateFOV()
	        print("FOV set to: " .. currentFOV)
	    else
	        -- Reset to current FOV if invalid input
	        fovtext.Text = tostring(currentFOV)
	    end
	end
	
	-- Connect button events
	minusfov.MouseButton1Click:Connect(decreaseFOV)
	plusfov.MouseButton1Click:Connect(increaseFOV)
	fovtext.FocusLost:Connect(onFOVTextChanged)
	
	-- Handle camera changes (in case camera resets)
	Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	    task.wait(0.1) -- Small delay to ensure camera is ready
	    updateFOV()
	end)
	
	-- Initialize FOV on script start
	task.wait(0.1) -- Small delay to ensure camera is ready
	updateFOV()
	
	-- Handle character respawn (reset FOV if needed)
	player.CharacterAdded:Connect(function(newCharacter)
	    task.wait(0.1) -- Small delay to ensure camera is ready
	    updateFOV()
	    print("FOV reset after respawn: " .. currentFOV)
	end)
	
	print("FOV Changer initialized with FOV: " .. currentFOV)
end;
task.spawn(C_e);
-- StarterGui.ScreenGui.main.other.TeleportScript
local function C_22()
local script = G2L["22"];
	-- Teleport Script with Cooldown and Text Display
	local Players = game:GetService("Players")
	local TweenService = game:GetService("TweenService")
	
	local player = Players.LocalPlayer
	local teleportButton = script.Parent.teleport
	
	-- Teleport variables
	local isOnCooldown = false
	local COOLDOWN_TIME = 30
	local TELEPORT_TARGET = workspace:WaitForChild("Worlds"):WaitForChild("Starter"):WaitForChild("Nodes"):WaitForChild("Win")
	local cooldownEndTime = 0
	local updateConnection = nil
	
	-- Function to update button text and appearance
	local function updateButtonState()
	    if isOnCooldown then
	        local timeLeft = math.max(0, cooldownEndTime - tick())
	        if timeLeft > 0 then
	            teleportButton.Text = math.ceil(timeLeft)
	            teleportButton.BackgroundColor3 = Color3.new(1, 0, 0.0156863) -- Gray when on cooldown
	            teleportButton.Active = false
	            teleportButton.Selectable = false
	        else
	            -- Cooldown finished
	            isOnCooldown = false
	            teleportButton.Text = "click"
				teleportButton.BackgroundColor3 = Color3.new(1, 0.666667, 1) -- Red when ready
	            teleportButton.Active = true
	            teleportButton.Selectable = true
	            
	            -- Stop updating
	            if updateConnection then
	                updateConnection:Disconnect()
	                updateConnection = nil
	            end
	            
	            print("Teleport ready again")
	        end
	    else
	        teleportButton.Text = "click"
			teleportButton.BackgroundColor3 = Color3.new(1, 0.666667, 1) -- Red when ready
	        teleportButton.Active = true
	        teleportButton.Selectable = true
	    end
	end
	
	-- Function to get character root part safely
	local function getCharacterRootPart()
	    local character = player.Character
	    if character then
	        return character:FindFirstChild("HumanoidRootPart")
	    end
	    return nil
	end
	
	-- Function to teleport player
	local function teleportPlayer()
	    if isOnCooldown then
	        return
	    end
	    
	    local rootPart = getCharacterRootPart()
	    if not rootPart then
	        warn("No HumanoidRootPart found")
	        return
	    end
	    
	    if not TELEPORT_TARGET then
	        warn("Teleport target not found: workspace.Worlds.Starter.Nodes.Win")
	        return
	    end
	    
	    -- Get target position
	    local targetPosition = TELEPORT_TARGET.Position
	    
	    -- Create smooth teleport effect
	    local teleportInfo = TweenInfo.new(
	        0.5, -- Duration
	        Enum.EasingStyle.Quad, -- Easing style
	        Enum.EasingDirection.Out -- Easing direction
	    )
	    
	    local teleportTween = TweenService:Create(
	        rootPart,
	        teleportInfo,
	        {CFrame = CFrame.new(targetPosition)}
	    )
	    
	    -- Play teleport effect
	    teleportTween:Play()
	    
	    -- Start cooldown
	    isOnCooldown = true
	    cooldownEndTime = tick() + COOLDOWN_TIME
	    
	    print("Teleported to Win block")
	    
	    -- Start updating button text
	    if updateConnection then
	        updateConnection:Disconnect()
	    end
	    
	    updateConnection = game:GetService("RunService").Heartbeat:Connect(updateButtonState)
	    updateButtonState() -- Update immediately
	end
	
	-- Teleport button click event
	teleportButton.MouseButton1Click:Connect(teleportPlayer)
	
	-- Handle character respawn (reset cooldown if needed)
	player.CharacterAdded:Connect(function(newCharacter)
	    if isOnCooldown then
	        -- Keep cooldown active even after respawn
	        print("Teleport still on cooldown after respawn")
	    end
	end)
	
	-- Verify teleport target exists and set initial state
	if not TELEPORT_TARGET then
	    warn("Warning: Teleport target 'workspace.Worlds.Starter.Nodes.Win' not found!")
	    teleportButton.Text = "error"
	    teleportButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3) -- Dark gray if target missing
	    teleportButton.Active = false
	    teleportButton.Selectable = false
	else
	    print("Teleport target found: " .. TELEPORT_TARGET:GetFullName())
	    -- Set initial button state
	    updateButtonState()
	end
end;
task.spawn(C_22);
-- StarterGui.ScreenGui.main.other.ESPScript
local function C_2b()
local script = G2L["2b"];
	-- ESP (Wallhack) Script
	local Players = game:GetService("Players")
	local Workspace = game:GetService("Workspace")
	local RunService = game:GetService("RunService")
	local LocalPlayer = Players.LocalPlayer
	
	-- GUI Elements
	local espButton = script.Parent.esp
	
	-- ESP State
	local espEnabled = true
	local playerHighlights = {} -- Store highlight objects for each player
	
	-- ESP Settings
	local ESP_COLOR = Color3.new(1, 0.666667, 1) -- Pink color
	local ESP_TRANSPARENCY = 0.3 -- Semi-transparent
	local ESP_FILL_TRANSPARENCY = 0.7 -- More transparent fill
	
	-- Function to create highlight for a player
	local function createHighlight(player)
	    if player == LocalPlayer then return end -- Don't highlight self
	    
	    local character = player.Character
	    if not character then return end
	    
	    -- Remove existing highlight if any
	    if playerHighlights[player] then
	        playerHighlights[player]:Destroy()
	    end
	    
	    -- Create new highlight
	    local highlight = Instance.new("Highlight")
	    highlight.Name = "ESP_Highlight"
	    highlight.FillColor = ESP_COLOR
	    highlight.OutlineColor = ESP_COLOR
	    highlight.FillTransparency = ESP_FILL_TRANSPARENCY
	    highlight.OutlineTransparency = ESP_TRANSPARENCY
	    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop -- Visible through walls
	    highlight.Parent = character
	    
	    playerHighlights[player] = highlight
	    print("Created ESP highlight for: " .. player.Name)
	end
	
	-- Function to remove highlight for a player
	local function removeHighlight(player)
	    if playerHighlights[player] then
	        playerHighlights[player]:Destroy()
	        playerHighlights[player] = nil
	        print("Removed ESP highlight for: " .. player.Name)
	    end
	end
	
	-- Function to enable ESP
	local function enableESP()
	    espEnabled = true
	    espButton.BackgroundColor3 = Color3.new(1, 0.666667, 1) -- Pink when enabled
	    
	    -- Create highlights for all existing players
	    for _, player in Players:GetPlayers() do
	        createHighlight(player)
	    end
	    
	    print("ESP Enabled")
	end
	
	-- Function to disable ESP
	local function disableESP()
	    espEnabled = false
	    espButton.BackgroundColor3 = Color3.new(1, 0, 0.0156863) -- Gray when disabled
	    
	    -- Remove all highlights
	    for player, highlight in pairs(playerHighlights) do
	        if highlight then
	            highlight:Destroy()
	        end
	    end
	    playerHighlights = {}
	    
	    print("ESP Disabled")
	end
	
	-- Function to toggle ESP
	local function toggleESP()
	    if espEnabled then
	        disableESP()
	    else
	        enableESP()
	    end
	end
	
	-- Handle player added
	Players.PlayerAdded:Connect(function(player)
	    if espEnabled then
	        -- Wait a bit for character to load
	        task.wait(1)
	        createHighlight(player)
	    end
	end)
	
	-- Handle player removing
	Players.PlayerRemoving:Connect(function(player)
	    removeHighlight(player)
	end)
	
	-- Handle character added/respawned
	local function onCharacterAdded(player, character)
	    if espEnabled then
	        -- Remove old highlight and create new one
	        removeHighlight(player)
	        task.wait(0.5) -- Wait for character to fully load
	        createHighlight(player)
	    end
	end
	
	-- Connect character added events for existing players
	for _, player in Players:GetPlayers() do
	    if player ~= LocalPlayer then
	        player.CharacterAdded:Connect(function(character)
	            onCharacterAdded(player, character)
	        end)
	    end
	end
	
	-- Also handle new players joining
	Players.PlayerAdded:Connect(function(player)
	    if player ~= LocalPlayer then
	        player.CharacterAdded:Connect(function(character)
	            onCharacterAdded(player, character)
	        end)
	    end
	end)
	
	-- ESP button click event
	espButton.MouseButton1Click:Connect(toggleESP)
	
	-- Periodic check to ensure ESP is working (in case characters get reset)
	RunService.Heartbeat:Connect(function()
	    if espEnabled then
	        for _, player in Players:GetPlayers() do
	            if player ~= LocalPlayer and player.Character then
	                -- Check if highlight exists and is properly parented
	                local highlight = playerHighlights[player]
	                if not highlight or not highlight.Parent or highlight.Parent ~= player.Character then
	                    -- Recreate highlight if needed
	                    createHighlight(player)
	                end
	            end
	        end
	    end
	end)
	
	print("ESP Script initialized - Click ESP button to toggle")
end;
task.spawn(C_2b);

return G2L["1"], require;
