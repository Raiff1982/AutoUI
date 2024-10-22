local _, addon = ...

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

-- Setup action bars and keybinds using switch-case structure
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
        }
        -- Add other classes and specs similarly...
    }

    if actionBarSetup[classFile] and actionBarSetup[classFile][specName] then
        actionBarSetup[classFile][specName]()
    end
end
