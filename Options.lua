BHH.options = {
    name = "BlizzHUD_Helper",
    handler = BHH,
    type = 'group',
    args = {
        power_bars = {
            type = 'toggle',
            name = 'Hide Character Power Bars',
            desc = "Toggle to show/hide your character's combo points, holy power, etc.",
            width = "full",
            get = 'GetHidePowerBars',
            set = 'SetHidePowerBars',
        },
        friendly_health_bars = {
            type = 'toggle',
            name = 'Use smaller friendly nameplates',
            desc = "Healthbars on friendly nameplates will appear much smaller",
            width = "full",
            get = 'GetSmallerNameplates',
            set = 'SetSmallerNameplates',
        },
        character_unitframe = {
            type = 'toggle',
            name = 'Hide Character UnitFrame',
            desc = "Hides your character's UnitFrame",
            width = "full",
            get = 'GetHideCharacterUnitFrame',
            set = 'SetHideCharacterUnitFrame',
        }
    },
}

function BHH:GetHidePowerBars(info)
    return self.db.profile.hidePowerBars
end

function BHH:SetHidePowerBars(info, input)
    if (input == true) then
        self.db.profile.hidePowerBars = true
        self:HidePowerBars()
    else
        self.db.profile.hidePowerBars = false
        self:ShowPowerBars()
    end
end

function BHH:GetHideCharacterUnitFrame(info)
    return self.db.profile.hideCharacterNameplate
end

function BHH:SetHideCharacterUnitFrame(info, input)
    self.db.profile.hideCharacterNameplate = input
    self:DisplayCharacterNameplate()
end

function BHH:GetSmallerNameplates(info)
    return self.db.profile.showSmallerNameplates
end

function BHH:SetSmallerNameplates(info, input)
    self.db.profile.showSmallerNameplates = input
    self:ResizeFriendlyNameplates()
end