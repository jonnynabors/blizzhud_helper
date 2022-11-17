BHH = LibStub("AceAddon-3.0"):NewAddon("BlizzHUD_Helper", "AceConsole-3.0", "AceHook-3.0", "AceEvent-3.0")

local playerClass, englishClass = UnitClass("player");

function BHH:OnInitialize()
    LibStub("AceConfig-3.0"):RegisterOptionsTable("BlizzHUD_Helper", self.options, { "bhh" })
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("BlizzHUD_Helper", "BlizzHUD Helper")
    self.db = LibStub("AceDB-3.0"):New("BHH_DB", defaults, false)
    BHH:RegisterChatCommand("bhh", "ProcessSlashCommand")

    local profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
    LibStub("AceConfig-3.0"):RegisterOptionsTable("BHH_Profiles", profiles)
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions("BHH_Profiles", "Profiles", "BlizzHUD Helper")
    self.db.RegisterCallback(self, "OnProfileChanged", "RefreshConfig")
    local frame = CreateFrame('FRAME')
    frame:RegisterEvent('ADDON_LOADED')
    frame:RegisterEvent('PLAYER_ENTERING_WORLD')
    frame:SetScript("OnEvent", function(this, event, ...)
        BHH[event](BHH, ...)
    end)
end

function BHH:ADDON_LOADED()
end

function BHH:PLAYER_ENTERING_WORLD()
    -- possibly resize unit frames here
end

-- Called when a profile is changed
function BHH:RefreshConfig()
    self:ResizeFriendlyNameplates()
    self:LoadPowerBars()
    self:DisplayCharacterNameplate()
end

function BHH:OnEnable()
    self:ResizeFriendlyNameplates()
    self:LoadPowerBars()
    self:DisplayCharacterNameplate()
    self:SecureHook(ClassPowerBar, "Setup", self.LoadPowerBars) -- Required for Paladin, specifically swapping specs
    self:SecureHook(ComboPointPlayerFrame, "Setup", self.LoadPowerBars) -- Required for Rogue, DK
    self:SecureHook(MonkHarmonyBarFrame, "Setup", self.LoadPowerBars) -- Required for WW Monk
    self:SecureHook(WarlockShardMixin, "Setup", self.LoadPowerBars) -- Required for Warlock
    self:SecureHook(ComboPointDruidPlayerFrame, "Setup", self.LoadPowerBars) -- Required for Feral Druid
    self:SecureHook(EssencePlayerFrame, "Setup", self.LoadPowerBars) -- Required for Evoker
end

function BHH:LoadPowerBars()
    if BHH.db.profile.hidePowerBars == false then
        BHH:ShowPowerBars()
    elseif BHH.db.profile.hidePowerBars == true then
        BHH:HidePowerBars()
    end
end

function BHH:ProcessSlashCommand(input)
    if not input or input:trim() == "" then
        InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
        InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
    end

    if (input == "show") then
        self.db.profile.hidePowerBars = false
        self:ShowPowerBars()
    elseif (input == "hide") then
        self.db.profile.hidePowerBars = true
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

function BHH:ResizeFriendlyNameplates()
    if self.db.profile.showSmallerNameplates == true then
        -- make smaller
        C_NamePlate.SetNamePlateFriendlySize(60, 30)
    else
        -- reset to default size
        C_NamePlate.SetNamePlateFriendlySize(100, 100)
    end
end

function BHH:DisplayCharacterNameplate()
    if self.db.profile.hideCharacterNameplate then
        PlayerFrame:Hide()
    else
        PlayerFrame:Show()
    end
end
