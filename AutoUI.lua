local _, addon = ...

-- Create the frame and register events
addon.frame = CreateFrame("Frame")
addon.frame:RegisterEvent("PLAYER_ENTERING_WORLD")
addon.frame:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
addon.frame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
addon.frame:RegisterEvent("PLAYER_LEVEL_UP")

-- Load the JSON library
local json = require('json')

-- Load the config
function LoadConfig()
    local file = io.open("Interface/AddOns/AutoUI/AddonConfig.json", "r")
    local content = file:read("*a")
    file:close()
    return json.decode(content)
end

local config = LoadConfig()

-- Event handler
addon.frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LEVEL_UP" then
        local level = ...
        ScaleUIBasedOnLevel(level)
    else
        SetupUIForClassAndSpec()
    end
end)

-- Setup UI based on class and spec
function SetupUIForClassAndSpec()
    local className, classFile = UnitClass("player")
    local specID = GetSpecializationInfo(GetSpecialization())

    -- Clear previous UI elements if any
    if addon.uiElements then
        for _, element in pairs(addon.uiElements) do
            element:Hide()
            element:SetParent(nil)
        end
    end
    addon.uiElements = {}

    -- Setup UI based on config
    local classConfig = config.classes[classFile]
    if classConfig then
        local specName = select(2, GetSpecializationInfo(GetSpecialization()))
        local createUIFunc = classConfig[specName]
        if createUIFunc and _G[createUIFunc] then
            _G[createUIFunc]()
            addon.SetupActionBarsAndKeybinds(classFile, specName)
        end
    end
end

-- Scale UI elements based on player level
function ScaleUIBasedOnLevel(level)
    if config.settings.scaling then
        for _, element in pairs(addon.uiElements) do
            element:SetScale(1 + (level / 100))
        end
    end
end
