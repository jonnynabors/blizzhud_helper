BHH = LibStub("AceAddon-3.0"):NewAddon("BlizzHUD_Helper", "AceConsole-3.0", "AceHook-3.0")
local playerClass, englishClass = UnitClass("player");

function BHH:OnInitialize()
    BHH:RegisterChatCommand("bhh", "ProcessSlashCommand")

    local frame = CreateFrame('FRAME')
    frame:RegisterEvent('ADDON_LOADED')

    frame:SetScript("OnEvent", function(this, event, ...)
        BHH[event](BHH, ...)
    end)
    self:Print("Initializing....")
end

function BHH:ADDON_LOADED()
    self:Print("addon loaded")
end

function BHH:OnEnable()
    self:Hook(ClassPowerBar, "Setup", LoadPowerBars, true)
    self:Hook(ComboPointPlayerFrame, "Setup", LoadPowerBars, true)
    self:Hook(ComboPointDruidPlayerFrame, "Setup", LoadPowerBars, true)
    self:Hook(WarlockShardMixin, "Setup", LoadPowerBars, true)
    self:Hook(MonkHarmonyBarFrame, "Setup", LoadPowerBars, true)
    self:Hook(DeathKnightResourceOverlayFrame, "Setup", LoadPowerBars, true)
end

function LoadPowerBars()
    -- noOp
end

function BHH:ProcessSlashCommand(input)
    if (input == "show") then
        ShowHidePowerBars = "show"
    elseif (input == "hide") then
        ShowHidePowerBars = "hide"
        self:HidePalyPower()
    else
    end
    self:Print(ShowHidePowerBars)
end

function BHH:ShowPalyPower()
    PaladinPowerBarFrame:Show()
end

function BHH:HidePalyPower()
    self:Print("hiding...")
    PaladinPowerBarFrame:Hide()
end
--- Old stuff below

--local frame = CreateFrame('FRAME')
--local name, namespace = ...
--
----- @class BlizzHUD_Helper
--BlizzHUD_Helper = {}
--
----- @type BlizzHUD_Helper
--local BlizzHUD_Helper = BlizzHUD_Helper
--namespace.BlizzHUD_Helper = BlizzHUD_Helper
--
--local function OnEvent(_, event, ...)
--    if event == 'ADDON_LOADED' then
--        if (name == ...) then
--            hooksecurefunc(ClassPowerBar, "Setup", Initialize)
--            hooksecurefunc(ComboPointPlayerFrame, "Setup", Initialize)
--            hooksecurefunc(ComboPointDruidPlayerFrame, "Setup", Initialize)
--            hooksecurefunc(WarlockShardMixin, "Setup", Initialize)
--            hooksecurefunc(MonkHarmonyBarFrame, "Setup", Initialize)
--            hooksecurefunc(DeathKnightResourceOverlayFrame, "Setup", Initialize)
--        end
--    end
--end
--
--frame:HookScript('OnEvent', OnEvent)
--frame:RegisterEvent('ADDON_LOADED')
--
--local playerClass, englishClass = UnitClass("player");
--
--function Initialize()
--    if ShowHidePowerBars == 'show' then
--        ShowPowerBars()
--    elseif ShowHidePowerBars == 'hide' then
--        HidePowerBars()
--    end
--end
--
--function HidePowerBars()
--    if playerClass == 'Paladin' then
--        PaladinPowerBarFrame:Hide()
--    elseif playerClass == 'Rogue' then
--        ComboPointPlayerFrame:Hide()
--    elseif playerClass == 'Warlock' then
--        WarlockPowerFrame:Hide()
--    elseif playerClass == 'Druid' then
--        ComboPointDruidPlayerFrame:Hide()
--    elseif playerClass == 'Monk' then
--        MonkHarmonyBarFrame:Hide()
--    elseif playerClass == 'Death Knight' then
--        RuneFrame:Hide()
--    end
--end
--
--function ShowPowerBars()
--    if playerClass == 'Paladin' then
--        PaladinPowerBarFrame:Show()
--    elseif playerClass == 'Rogue' then
--        ComboPointPlayerFrame:Show()
--    elseif playerClass == 'Warlock' then
--        WarlockPowerFrame:Show()
--    elseif playerClass == 'Druid' then
--        ComboPointDruidPlayerFrame:Show()
--    elseif playerClass == 'Monk' then
--        MonkHarmonyBarFrame:Show()
--    elseif playerClass == 'Death Knight' then
--        RuneFrame:Show()
--    end
--end
--
--SLASH_BLIZZHUD1 = '/bhh';
--function SlashCmdList.BLIZZHUD(msg)
--    if (msg == "show") then
--        ShowHidePowerBars = "show"
--        ShowPowerBars()
--    elseif (msg == "hide") then
--        ShowHidePowerBars = "hide"
--        HidePowerBars()
--    else
--        print("Hi")
--        BlizzHUD_Helper_Frame:Show()
--    end
--end
--
--function BlizzHUD_Helper_OnLoad(something)
--    something.BlizzHUD_Helper_Frame:Show()
--    print("Loading...")
--end

