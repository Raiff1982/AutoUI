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
local function LoadConfig()
    local file = io.open("Interface/AddOns/AutoUI/AddonConfig.json", "r")
    if not file then
        print("Failed to open config file.")
        return nil
    end
    local content = file:read("*a")
    file:close()
    return json.decode(content)
end

local config = LoadConfig()
if not config then return end

-- Event handler
local function OnEvent(self, event, ...)
    if event == "PLAYER_LEVEL_UP" then
        local level = ...
        addon.ScaleUIBasedOnLevel(level)
    else
        addon.SetupUIForClassAndSpec()
    end
end

addon.frame:SetScript("OnEvent", OnEvent)
