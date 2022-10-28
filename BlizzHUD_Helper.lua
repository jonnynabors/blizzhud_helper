local frame = CreateFrame('FRAME')
local name, namespace = ...

--- @class BlizzHUD_Helper
BlizzHUD_Helper = {}

--- @type BlizzHUD_Helper
local BlizzHUD_Helper = BlizzHUD_Helper
namespace.BlizzHUD_Helper = BlizzHUD_Helper

local function OnEvent(_, event, ...)
    if event == 'ADDON_LOADED' then
        if (name == ...) then
            hooksecurefunc(ClassPowerBar, "Setup", Initialize)
            hooksecurefunc(ComboPointPlayerFrame, "Setup", Initialize)
            hooksecurefunc(WarlockShardMixin, "Setup", Initialize)
        end
    end
end

frame:HookScript('OnEvent', OnEvent)
frame:RegisterEvent('ADDON_LOADED')

local playerClass, englishClass = UnitClass("player");

function Initialize()
    print(ShowHidePowerBars)
    if ShowHidePowerBars == 'show' then
    elseif ShowHidePowerBars == 'hide' then
        HidePowerBars()
    end
end

function HidePowerBars()
    if playerClass == 'Paladin' then
        PaladinPowerBarFrame:Hide()
    elseif playerClass == 'Rogue' then
        ComboPointPlayerFrame:Hide()
    elseif playerClass == 'Warlock' then
        WarlockPowerFrame:Hide()
    end
end

function ShowPowerBars()
    if playerClass == 'Paladin' then
        PaladinPowerBarFrame:Show()
    elseif playerClass == 'Rogue' then
        ComboPointPlayerFrame:Show()
    elseif playerClass == 'Warlock' then
        WarlockPowerFrame:Show()
    end
end

SLASH_BLIZZHUD1 = '/bhh';
function SlashCmdList.BLIZZHUD(msg)
    if (msg == "show") then
        ShowHidePowerBars = "show"
        ShowPowerBars()
    elseif (msg == "hide") then
        ShowHidePowerBars = "hide"
        HidePowerBars()
    else
        print("Must be a value of show or hide, e.g. /bhh show or /bhh hide")
    end
end

