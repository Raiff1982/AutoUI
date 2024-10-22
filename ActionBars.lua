local _, addon = ...

-- Utility function to set action bar slot
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
    local actionBarSetup = {
        WARRIOR = {
            Arms = function()
                addon.SetActionBarSlot(1, "Ability_Warrior_Charge")
                addon.SetActionBarSlot(2, "Ability_Warrior_Rend")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Fury = function()
                addon.SetActionBarSlot(1, "Ability_Warrior_BattleShout")
                addon.SetActionBarSlot(2, "Ability_Warrior_BerserkerRage")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Protection = function()
                addon.SetActionBarSlot(1, "Ability_Warrior_ShieldBash")
                addon.SetActionBarSlot(2, "Ability_Warrior_DefensiveStance")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end
        },
        PALADIN = {
            Holy = function()
                addon.SetActionBarSlot(1, "Spell_Holy_HolyBolt")
                addon.SetActionBarSlot(2, "Spell_Holy_FlashHeal")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Protection = function()
                addon.SetActionBarSlot(1, "Spell_Holy_SealOfProtection")
                addon.SetActionBarSlot(2, "Spell_Holy_SealOfRighteousness")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Retribution = function()
                addon.SetActionBarSlot(1, "Spell_Holy_AuraOfLight")
                addon.SetActionBarSlot(2, "Spell_Holy_SealOfCommand")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end
        },
        HUNTER = {
            BeastMastery = function()
                addon.SetActionBarSlot(1, "Ability_Hunter_BeastCall")
                addon.SetActionBarSlot(2, "Ability_Hunter_BeastSoothe")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Marksmanship = function()
                addon.SetActionBarSlot(1, "Ability_Hunter_AimedShot")
                addon.SetActionBarSlot(2, "Ability_Hunter_HuntersMark")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Survival = function()
                addon.SetActionBarSlot(1, "Ability_Hunter_RaptorStrike")
                addon.SetActionBarSlot(2, "Ability_Hunter_SwiftStrike")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end
        }
        -- Add other classes and specs similarly...
    }

    if actionBarSetup[classFile] and actionBarSetup[classFile][specName] then
        actionBarSetup[classFile][specName]()
    end
end
        if createUIFunc and _G[createUIFunc] then
            _G[createUIFunc]()
            addon.SetupActionBarsAndKeybinds(classFile, specName)
        end
    end
end

-- Scale UI elements based on player level
function addon.ScaleUIBasedOnLevel(level)
    if config.settings.scaling then
        for _, element in pairs(addon.uiElements) do
            element:SetScale(1 + (level / 100))
        end
    end
end

-- Utility function to set action bar slot
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

-- Setup UI based on class and spec
function addon.SetupUIForClassAndSpec()
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
function addon.ScaleUIBasedOnLevel(level)
    if config.settings.scaling then
        for _, element in pairs(addon.uiElements) do
            element:SetScale(1 + (level / 100))
        end
    end
end

-- Utility function to set action bar slot
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

-- Setup UI based on class and spec
function addon.SetupUIForClassAndSpec()
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
function addon.ScaleUIBasedOnLevel(level)
    if config.settings.scaling then
        for _, element in pairs(addon.uiElements) do
            element:SetScale(1 + (level / 100))
        end
    end
end

-- Utility function to set action bar slot
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

-- Setup UI based on class and spec
function addon.SetupUIForClassAndSpec()
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
function addon.ScaleUIBasedOnLevel(level)
    if config.settings.scaling then
        for _, element in pairs(addon.uiElements) do
            element:SetScale(1 + (level / 100))
        end
    end
end

-- Utility function to set action bar slot
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

-- Setup UI based on class and spec
function addon.SetupUIForClassAndSpec()
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
function addon.ScaleUIBasedOnLevel(level)
    if config.settings.scaling then
        for _, element in pairs(addon.uiElements) do
            element:SetScale(1 + (level / 100))
        end
    end
end

-- Utility function to set action bar slot
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

-- Setup UI based on class and spec
function addon.SetupUIForClassAndSpec()
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
function addon.ScaleUIBasedOnLevel(level)
    if config.settings.scaling then
        for _, element in pairs(addon.uiElements) do
            element:SetScale(1 + (level / 100))
        end
    end
end

-- Utility function to set action bar slot
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

-- Setup UI based on class and spec
function addon.SetupUIForClassAndSpec()
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
function addon.ScaleUIBasedOnLevel(level)
    if config.settings.scaling then
        for _, element in pairs(addon.uiElements) do
            element:SetScale(1 + (level / 100))
        end
    end
end

-- Utility function to set action bar slot
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

-- Setup UI based on class and spec
function addon.SetupUIForClassAndSpec()
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
function addon.ScaleUIBasedOnLevel(level)
    if config.settings.scaling then
        for _, element in pairs(addon.uiElements) do
            element:SetScale(1 + (level / 100))
        end
    end
end

-- Utility function to set action bar slot
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

-- Setup UI based on class and spec
function addon.SetupUIForClassAndSpec()
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
function addon.ScaleUIBasedOnLevel(level)
    if config.settings.scaling then
        for _, element in pairs(addon.uiElements) do
            element:SetScale(1 + (level / 100))
        end
    end
end

-- Utility function to set action bar slot
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

-- Setup UI based on class and spec
function addon.SetupUIForClassAndSpec()
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
function addon.ScaleUIBasedOnLevel(level)
    if config.settings.scaling then
        for _, element in pairs(addon.uiElements) do
            element:SetScale(1 + (level / 100))
        end
    end
end

-- Utility function to set action bar slot
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

-- Setup UI based on class and spec
function addon.SetupUIForClassAndSpec()
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
function addon.ScaleUIBasedOnLevel(level)
    if config.settings.scaling then
        for _, element in pairs(addon.uiElements) do
            element:SetScale(1 + (level / 100))
        end
    end
end

-- Utility function to set action bar slot
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

-- Setup UI based on class and spec
function addon.SetupUIForClassAndSpec()
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
function addon.ScaleUIBasedOnLevel(level)
    if config.settings.scaling then
        for _, element in pairs(addon.uiElements) do
            element:SetScale(1 + (level / 100))
        end
    end
end

-- Utility function to set action bar slot
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

-- Setup UI based on class and spec
function addon.SetupUIForClassAndSpec()
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
function addon.ScaleUIBasedOnLevel(level)
    if config.settings.scaling then
        for _, element in pairs(addon.uiElements) do
            element:SetScale(1 + (level / 100))
        end
    end
end

-- Utility function to set action bar slot
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

-- Setup UI based on class and spec
function addon.SetupUIForClassAndSpec()
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
function addon.ScaleUIBasedOnLevel(level)
    if config.settings.scaling then
        for _, element in pairs(addon.uiElements) do
            element:SetScale(1 + (level / 100))
        end
    end
end

-- Utility function to set action bar slot
function addon.SetActionBarSlot(slot, spell)
    PickupSpell(spell)
    PlaceAction(slot)
    ClearCursor()
end

-- Utility function to set key bindings
function addon.SetKeyBinding(key, action)
    SetBinding(key, action)
end

function addon.SetupActionBarsAndKeybinds(classFile, specName)
    local actionBarSetup = {
        WARRIOR = {
            Arms = function()
                addon.SetActionBarSlot(1, "Ability_Warrior_Charge")
                addon.SetActionBarSlot(2, "Ability_Warrior_Rend")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Fury = function()
                addon.SetActionBarSlot(1, "Ability_Warrior_BattleShout")
                addon.SetActionBarSlot(2, "Ability_Warrior_BerserkerRage")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Protection = function()
                addon.SetActionBarSlot(1, "Ability_Warrior_ShieldBash")
                addon.SetActionBarSlot(2, "Ability_Warrior_DefensiveStance")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end
        },
        PALADIN = {
            Holy = function()
                addon.SetActionBarSlot(1, "Spell_Holy_HolyBolt")
                addon.SetActionBarSlot(2, "Spell_Holy_FlashHeal")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Protection = function()
                addon.SetActionBarSlot(1, "Spell_Holy_SealOfProtection")
                addon.SetActionBarSlot(2, "Spell_Holy_SealOfRighteousness")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Retribution = function()
                addon.SetActionBarSlot(1, "Spell_Holy_AuraOfLight")
                addon.SetActionBarSlot(2, "Spell_Holy_SealOfCommand")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end
        },
        HUNTER = {
            BeastMastery = function()
                addon.SetActionBarSlot(1, "Ability_Hunter_BeastCall")
                addon.SetActionBarSlot(2, "Ability_Hunter_BeastSoothe")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Marksmanship = function()
                addon.SetActionBarSlot(1, "Ability_Hunter_AimedShot")
                addon.SetActionBarSlot(2, "Ability_Hunter_HuntersMark")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Survival = function()
                addon.SetActionBarSlot(1, "Ability_Hunter_RaptorStrike")
                addon.SetActionBarSlot(2, "Ability_Hunter_SwiftStrike")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end
        },
        MAGE = {
            Arcane = function()
                addon.SetActionBarSlot(1, "Spell_Holy_MagicalSentry")
                addon.SetActionBarSlot(2, "Spell_Nature_StarFall")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Fire = function()
                addon.SetActionBarSlot(1, "Spell_Fire_FireBolt02")
                addon.SetActionBarSlot(2, "Spell_Fire_FlameBolt")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Frost = function()
                addon.SetActionBarSlot(1, "Spell_Frost_FrostBolt02")
                addon.SetActionBarSlot(2, "Spell_Frost_FrostNova")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end
        },
        PRIEST = {
            Discipline = function()
                addon.SetActionBarSlot(1, "Spell_Holy_WordFortitude")
                addon.SetActionBarSlot(2, "Spell_Holy_PowerWordShield")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Holy = function()
                addon.SetActionBarSlot(1, "Spell_Holy_HolyBolt")
                addon.SetActionBarSlot(2, "Spell_Holy_FlashHeal")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Shadow = function()
                addon.SetActionBarSlot(1, "Spell_Shadow_ShadowWordPain")
                addon.SetActionBarSlot(2, "Spell_Shadow_ShadowBolt")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end
        },
        ROGUE = {
            Assassination = function()
                addon.SetActionBarSlot(1, "Ability_Rogue_Eviscerate")
                addon.SetActionBarSlot(2, "Ability_Rogue_SliceDice")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Outlaw = function()
                addon.SetActionBarSlot(1, "Ability_Rogue_SinisterStrike")
                addon.SetActionBarSlot(2, "Ability_Rogue_Ambush")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Subtlety = function()
                addon.SetActionBarSlot(1, "Ability_Rogue_ShadowDance")
                addon.SetActionBarSlot(2, "Ability_Rogue_Backstab")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end
        },
        SHAMAN = {
            Elemental = function()
                addon.SetActionBarSlot(1, "Spell_Nature_Lightning")
                addon.SetActionBarSlot(2, "Spell_Nature_ChainLightning")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Enhancement = function()
                addon.SetActionBarSlot(1, "Spell_Nature_LightningShield")
                addon.SetActionBarSlot(2, "Spell_Nature_LightningBolt")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Restoration = function()
                addon.SetActionBarSlot(1, "Spell_Nature_MagicImmunity")
                addon.SetActionBarSlot(2, "Spell_Nature_HealingWaveGreater")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end
        },
        WARLOCK = {
            Affliction = function()
                addon.SetActionBarSlot(1, "Spell_Shadow_DeathCoil")
                addon.SetActionBarSlot(2, "Spell_Shadow_Haunting")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Demonology = function()
                addon.SetActionBarSlot(1, "Spell_Shadow_SummonFelguard")
                addon.SetActionBarSlot(2, "Spell_Shadow_Metamorphosis")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Destruction = function()
                addon.SetActionBarSlot(1, "Spell_Fire_Incinerate")
                addon.SetActionBarSlot(2, "Spell_Fire_ChaosBolt")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end
        },
        DRUID = {
            Balance = function()
                addon.SetActionBarSlot(1, "Spell_Nature_StarFall")
                addon.SetActionBarSlot(2, "Spell_Nature_Moonfire")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Feral = function()
                addon.SetActionBarSlot(1, "Ability_Druid_CatForm")
                addon.SetActionBarSlot(2, "Ability_Druid_Rake")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Guardian = function()
                addon.SetActionBarSlot(1, "Ability_Racial_BearForm")
                addon.SetActionBarSlot(2, "Ability_Druid_Maul")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Restoration = function()
                addon.SetActionBarSlot(1, "Spell_Nature_HealingTouch")
                addon.SetActionBarSlot(2, "Spell_Nature_Rejuvenation")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end
        },
        DEATHKNIGHT = {
            Blood = function()
                addon.SetActionBarSlot(1, "Spell_Deathknight_BloodPresence")
                addon.SetActionBarSlot(2, "Spell_Deathknight_DeathStrike")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Frost = function()
                addon.SetActionBarSlot(1, "Spell_Deathknight_FrostPresence")
                addon.SetActionBarSlot(2, "Spell_Deathknight_FrostStrike")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Unholy = function()
                addon.SetActionBarSlot(1, "Spell_Deathknight_UnholyPresence")
                addon.SetActionBarSlot(2, "Spell_Deathknight_ScourgeStrike")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end
        },
        MONK = {
            Brewmaster = function()
                addon.SetActionBarSlot(1, "Spell_Monk_Brewmaster")
                addon.SetActionBarSlot(2, "Spell_Monk_KegSmash")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Mistweaver = function()
                addon.SetActionBarSlot(1, "Spell_Monk_Mistweaver")
                addon.SetActionBarSlot(2, "Spell_Monk_SoothingMist")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Windwalker = function()
                addon.SetActionBarSlot(1, "Spell_Monk_Windwalker")
                addon.SetActionBarSlot(2, "Spell_Monk_TigerPalm")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end
        },
        DEMONHUNTER = {
            Havoc = function()
                addon.SetActionBarSlot(1, "Spell_DemonHunter_Havoc")
                addon.SetActionBarSlot(2, "Spell_DemonHunter_ChaosStrike")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end,
            Vengeance = function()
                addon.SetActionBarSlot(1, "Spell_DemonHunter_Vengeance")
                addon.SetActionBarSlot(2, "Spell_DemonHunter_SoulCleave")
                addon.SetKeyBinding("1", "ACTIONBUTTON1")
                addon.SetKeyBinding("2", "ACTIONBUTTON2")
            end
        }
        }

        local classSetup = actionBarSetup[classFile]
        if classSetup then
        local specSetup = classSetup[specName]
        if specSetup then
            specSetup()
        end
        end
        end
