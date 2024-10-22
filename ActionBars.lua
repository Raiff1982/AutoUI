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
            addon.SetActionBarSlot(1, "Ability_Warrior_Charge")
            addon.SetActionBarSlot(2, "Ability_Warrior_Rend")
            addon.SetKeyBinding("1", "ACTIONBUTTON1")
            addon.SetKeyBinding("2", "ACTIONBUTTON2")
            addon.SetActionBarSlot(1, "Ability_Warrior_BattleShout")
            addon.SetActionBarSlot(2, "Ability_Warrior_BerserkerRage")
            addon.SetKeyBinding("1", "ACTIONBUTTON1")
            addon.SetKeyBinding("2", "ACTIONBUTTON2")
            addon.SetActionBarSlot(1, "Ability_Warrior_ShieldBash")
            addon.SetActionBarSlot(2, "Ability_Warrior_DefensiveStance")
            addon.SetKeyBinding("1", "ACTIONBUTTON1")
            addon.SetKeyBinding("2", "ACTIONBUTTON2")
        end
            addon.SetActionBarSlot(1, "Spell_Holy_HolyBolt")
            addon.SetActionBarSlot(2, "Spell_Holy_FlashHeal")
            addon.SetKeyBinding("1", "ACTIONBUTTON1")
            addon.SetKeyBinding("2", "ACTIONBUTTON2")
            addon.SetActionBarSlot(1, "Spell_Holy_SealOfProtection")
            addon.SetActionBarSlot(2, "Spell_Holy_SealOfRighteousness")
            addon.SetKeyBinding("1", "ACTIONBUTTON1")
            addon.SetKeyBinding("2", "ACTIONBUTTON2")
            addon.SetActionBarSlot(1, "Spell_Holy_AuraOfLight")
            addon.SetActionBarSlot(2, "Spell_Holy_SealOfCommand")
            addon.SetKeyBinding("1", "ACTIONBUTTON1")
            addon.SetKeyBinding("2", "ACTIONBUTTON2")
        end
            addon.SetActionBarSlot(1, "Ability_Hunter_BeastCall")
            addon.SetActionBarSlot(2, "Ability_Hunter_BeastSoothe")
            addon.SetKeyBinding("1", "ACTIONBUTTON1")
            addon.SetKeyBinding("2", "ACTIONBUTTON2")
            addon.SetActionBarSlot(1, "Ability_Hunter_AimedShot")
            addon.SetActionBarSlot(2, "Ability_Hunter_HuntersMark")
            addon.SetKeyBinding("1", "ACTIONBUTTON1")
            addon.SetKeyBinding("2", "ACTIONBUTTON2")
            addon.SetActionBarSlot(1, "Ability_Hunter_RaptorStrike")
            addon.SetActionBarSlot(2, "Ability_Hunter_SwiftStrike")
            addon.SetKeyBinding("1", "ACTIONBUTTON1")
            addon.SetKeyBinding("2", "ACTIONBUTTON2")
        end
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
            addon.SetKeyBinding("1", "ACTIONBUTTON1")
            addon.SetKeyBinding("2", "ACTIONBUTTON2")
            addon.SetKeyBinding("1", "ACTIONBUTTON1")
            addon.SetKeyBinding("2", "ACTIONBUTTON2")
            addon.SetKeyBinding("1", "ACTIONBUTTON1")
            addon.SetKeyBinding("2", "ACTIONBUTTON2")
        end
    end
end
