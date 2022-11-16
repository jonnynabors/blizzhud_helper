BHH = LibStub("AceAddon-3.0"):NewAddon("BlizzHUD_Helper", "AceConsole-3.0", "AceHook-3.0")
local playerClass, englishClass = UnitClass("player");

function BHH:OnInitialize()
    BHH:RegisterChatCommand("bhh", "ProcessSlashCommand")

    local frame = CreateFrame('FRAME')
    frame:RegisterEvent('ADDON_LOADED')

    frame:SetScript("OnEvent", function(this, event, ...)
        BHH[event](BHH, ...)
    end)
end

function BHH:ADDON_LOADED()
end

function BHH:OnEnable()
    self:SecureHook(ClassPowerBar, "Setup", LoadPowerBars) -- Required for Paladin, specifically swapping specs
    self:SecureHook(ComboPointPlayerFrame, "Setup", LoadPowerBars) -- Required for Rogue, DK
    self:SecureHook(MonkHarmonyBarFrame, "Setup", LoadPowerBars) -- Required for WW Monk
    self:SecureHook(WarlockShardMixin, "Setup", LoadPowerBars) -- Required for Warlock
    self:SecureHook(ComboPointDruidPlayerFrame, "Setup", LoadPowerBars) -- Required for Feral Druid
    self:SecureHook(EssencePlayerFrame, "Setup", LoadPowerBars) -- Required for Evoker
end

function LoadPowerBars()
    if ShowHidePowerBars == 'show' then
        BHH:ShowPowerBars()
    elseif ShowHidePowerBars == 'hide' then
        BHH:HidePowerBars()
    end
end

function BHH:ProcessSlashCommand(input)
    if (input == "show") then
        ShowHidePowerBars = "show"
        self:ShowPowerBars()
    elseif (input == "hide") then
        ShowHidePowerBars = "hide"
        self:HidePowerBars()
    else
    end
end

function BHH:HidePowerBars()
    if playerClass == 'Paladin' then
        PaladinPowerBarFrame:Hide()
    elseif playerClass == 'Rogue' then
        ComboPointPlayerFrame:Hide()
    elseif playerClass == 'Warlock' then
        WarlockPowerFrame:Hide()
    elseif playerClass == 'Druid' then
        ComboPointDruidPlayerFrame:Hide()
    elseif playerClass == 'Monk' then
        MonkHarmonyBarFrame:Hide()
        MonkStaggerBar:Hide() -- not working
    elseif playerClass == 'Death Knight' then
        RuneFrame:Hide()
    elseif playerClass == 'Evoker' then
        EssencePlayerFrame:Hide()
    end
end

function BHH:ShowPowerBars()
    if playerClass == 'Paladin' then
        PaladinPowerBarFrame:Show()
    elseif playerClass == 'Rogue' then
        ComboPointPlayerFrame:Show()
    elseif playerClass == 'Warlock' then
        WarlockPowerFrame:Show()
    elseif playerClass == 'Druid' then
        ComboPointDruidPlayerFrame:Show()
    elseif playerClass == 'Monk' then
        MonkHarmonyBarFrame:Show()
    elseif playerClass == 'Death Knight' then
        RuneFrame:Show()
    elseif playerClass == 'Evoker' then
        EssencePlayerFrame:Show()
    end
end

