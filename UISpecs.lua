local _, addon = ...

-- Scale UI elements based on player level
function addon.ScaleUIBasedOnLevel(level)
    if config.settings.scaling then
        for _, element in pairs(addon.uiElements) do
            element:SetScale(1 + (level / 100))
        end
    end
end

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
