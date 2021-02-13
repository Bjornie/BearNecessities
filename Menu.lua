local BN = BearNecessities
local EM = GetEventManager()
local LAM = LibAddonMenu2

function BN.BuildMenu()
    local panelData = {
        type = 'panel',
        name = 'Bear Necessities',
        displayname = 'Bear Necessities',
        author = '|c00BFFFBjørn|r',
        version = BN.version,
        registerForRefresh = true,
        registerForDefaults = true,
    }

    local optionsTable = {
        {
            type = 'header',
            name = '|cFFFACDGeneral|r',
        },
        {
            type = 'checkbox',
            name = 'Account-Wide Settings',
            getFunc = function() return BearNecessitiesSV.Default[GetDisplayName()]['$AccountWide'].isAccountWide end,
            setFunc = function(value) BearNecessitiesSV.Default[GetDisplayName()]['$AccountWide'].isAccountWide = value end,
            requiresReload = true,
            default = BN.defaults.isAccountWide,
        },
        {
            type = 'button',
            name = 'Unlock UI',
            func = function(control)
                BN.ToggleUI()

                if BN.isMovable then
                    control:SetText('Lock UI')
                else control:SetText('Unlock UI') end
            end,
            width = 'half',
        },
        {
            type = 'button',
            name = 'Reset Positions',
            func = function() BN.ResetUIPositions() end,
            width = 'half',
        },
        {
            type = 'checkbox',
            name = 'Food Reminder',
            getFunc = function() return BN.SV.isFoodReminderEnabled end,
            setFunc = function(value) BN.SV.isFoodReminderEnabled = value end,
            width = 'half',
            default = BN.defaults.isFoodReminderEnabled,
        },
        {
            type = 'slider',
            name = 'Food Reminder Threshold (minutes)',
            getFunc = function() return BN.SV.foodReminderThreshold end,
            setFunc = function(value) BN.SV.foodReminderThreshold = value end,
            min = 1,
            max = 60,
            width = 'half',
            disabled = function() return not BN.SV.isFoodReminderEnabled end,
            default = BN.defaults.foodReminderThreshold,
        },
        {
            type = 'checkbox',
            name = 'Move All Currencies To Bank',
            getFunc = function() return BN.SV.doMoveCurrencies end,
            setFunc = function(value) BN.SV.doMoveCurrencies = value end,
            default = BN.defaults.doMoveCurrencies,
        },
        {
            type = 'checkbox',
            name = 'Minimize Chat In Combat',
            getFunc = function() return BN.SV.doHideChatInCombat end,
            setFunc = function(value) BN.SV.doHideChatInCombat = value end,
            default = BN.defaults.doHideChatInCombat,
        },
        {
            type = 'checkbox',
            name = 'Auto Repair Gear & Auto Recharge Weapons',
            getFunc = function() return BN.SV.doAutoCheckGear end,
            setFunc = function(value) BN.SV.doAutoCheckGear = value end,
            default = BN.defaults.doAutoCheckGear,
        },
        {
            type = 'submenu',
            name = 'Base Game UI',
            controls = {
                {
                    type = 'checkbox',
                    name = 'Hide Boss Compass Health Bar',
                    getFunc = function() return BN.SV.doHideBossCompassHealthBar end,
                    setFunc = function(value) BN.SV.doHideBossCompassHealthBar = value end,
                    default = BN.defaults.doHideBossCompassHealthBar,
                },
                {
                    type = 'checkbox',
                    name = 'Hide Target Health Bar',
                    getFunc = function() return BN.SV.doHideTargetHealthBar end,
                    setFunc = function(value)
                        BN.SV.doHideTargetHealthBar = value
                        if value then UNIT_FRAMES.staticFrames['reticleover']:SetHiddenForReason('BearNecessities', true)
                        else UNIT_FRAMES.staticFrames['reticleover']:SetHiddenForReason('BearNecessities', false) end
                    end,
                    default = BN.defaults.doHideTargetHealthBar,
                },
                {
                    type = 'checkbox',
                    name = 'Hide Experience Bar',
                    getFunc = function() return BN.SV.isExpBarHidden end,
                    setFunc = function(value)
                        BN.SV.isExpBarHidden = value
                        if value then
                            HUD_SCENE:RemoveFragment(PLAYER_PROGRESS_BAR_FRAGMENT)
                            HUD_UI_SCENE:RemoveFragment(PLAYER_PROGRESS_BAR_FRAGMENT)
                            LOOT_SCENE:RemoveFragment(PLAYER_PROGRESS_BAR_FRAGMENT)
                        else
                            HUD_SCENE:AddFragment(PLAYER_PROGRESS_BAR_FRAGMENT)
                            HUD_UI_SCENE:AddFragment(PLAYER_PROGRESS_BAR_FRAGMENT)
                            LOOT_SCENE:AddFragment(PLAYER_PROGRESS_BAR_FRAGMENT)
                        end
                    end,
                    default = BN.defaults.isExpBarHidden,
                },
            },
        },
        {
            type = 'submenu',
            name = 'Simple UI',
            controls = {
                {
                    type = 'checkbox',
                    name = 'Simple Group UI',
                    getFunc = function() return BN.SV.isGroupUIEnabled end,
                    setFunc = function(value) BN.SV.isGroupUIEnabled = value end,
                    default = BN.defaults.isGroupUIEnabled,
                },
                {
                    type = 'checkbox',
                    name = 'Simple Attribute UI',
                    getFunc = function() return BN.SV.isAttributeUIEnabled end,
                    setFunc = function(value)
                        BN.SV.isAttributeUIEnabled = value
                        if value then
                            HUD_SCENE:RemoveFragment(PLAYER_ATTRIBUTE_BARS_FRAGMENT)
                            HUD_UI_SCENE:RemoveFragment(PLAYER_ATTRIBUTE_BARS_FRAGMENT)
                            LOOT_SCENE:RemoveFragment(PLAYER_ATTRIBUTE_BARS_FRAGMENT)
                        else
                            HUD_SCENE:AddFragment(PLAYER_ATTRIBUTE_BARS_FRAGMENT)
                            HUD_UI_SCENE:AddFragment(PLAYER_ATTRIBUTE_BARS_FRAGMENT)
                            LOOT_SCENE:RemoveFragment(PLAYER_ATTRIBUTE_BARS_FRAGMENT)
                        end
                    end,
                    default = BN.defaults.isAttributeUIEnabled,
                },
                {
                    type = 'colorpicker',
                    name = 'Health Colour',
                    getFunc = function() return unpack(BN.SV.healthColour) end,
                    setFunc = function(r, g, b, a)
                        BN.SV.healthColour = {r, g, b, a}
                        BearNecessities_Health_Text:SetColor(r, g, b, a)
                    end,
                    disabled = function() return not BN.SV.isAttributeUIEnabled end,
                    default = BN.defaults.healthColour,
                },
                {
                    type = 'colorpicker',
                    name = 'Magicka Colour',
                    getFunc = function() return unpack(BN.SV.magickaColour) end,
                    setFunc = function(r, g, b, a)
                        BN.SV.magickaColour = {r, g, b, a}
                        BearNecessities_Magicka_Text:SetColor(r, g, b, a)
                    end,
                    disabled = function() return not BN.SV.isAttributeUIEnabled end,
                    default = BN.defaults.magickaColour,
                },
                {
                    type = 'colorpicker',
                    name = 'Stamina Colour',
                    getFunc = function() return unpack(BN.SV.staminaColour) end,
                    setFunc = function(r, g, b, a)
                        BN.SV.staminaColour = {r, g, b, a}
                        BearNecessities_Stamina_Text:SetColor(r, g, b, a)
                    end,
                    disabled = function() return not BN.SV.isAttributeUIEnabled end,
                    default = BN.defaults.staminaColour,
                },
            },
        },
    }

    LAM:RegisterAddonPanel(BN.name .. 'Options', panelData)
    LAM:RegisterOptionControls(BN.name .. 'Options', optionsTable)
end