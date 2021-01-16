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
            type = 'checkbox',
            name = 'Food Reminder',
            getFunc = function() return BN.SV.isFoodEnabled end,
            setFunc = function(value) BN.SV.isFoodEnabled = value end,
            width = 'half',
            default = BN.defaults.isFoodEnabled,
        },
        {
            type = 'slider',
            name = 'Food Reminder Threshold (minutes)',
            getFunc = function() return BN.SV.foodReminderThreshold end,
            setFunc = function(value) BN.SV.foodReminderThreshold = value end,
            min = 1,
            max = 60,
            width = 'half',
            disabled = function() return not BN.SV.isFoodEnabled end,
            default = BN.defaults.foodReminderThreshold,
        },
        {
            type = 'checkbox',
            name = 'Move All Currencies To Bank',
            getFunc = function() return BN.SV.moveCurrencies end,
            setFunc = function(value) BN.SV.moveCurrencies = value end,
            default = BN.defaults.moveCurrencies,
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
                    width = 'half',
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
                    width = 'half',
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
                    width = 'half',
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
                    getFunc = function() return unpack(BN.SV.HealthColour) end,
                    setFunc = function(r, g, b, a)
                        BN.SV.HealthColour = {r, g, b, a}
                        BearNecessities_Health_Text:SetColor(r, g, b, a)
                    end,
                    disabled = function() return not BN.SV.isAttributeUIEnabled end,
                    default = BN.defaults.HealthColour,
                },
                {
                    type = 'colorpicker',
                    name = 'Magicka Colour',
                    getFunc = function() return unpack(BN.SV.MagickaColour) end,
                    setFunc = function(r, g, b, a)
                        BN.SV.MagickaColour = {r, g, b, a}
                        BearNecessities_Magicka_Text:SetColor(r, g, b, a)
                    end,
                    disabled = function() return not BN.SV.isAttributeUIEnabled end,
                    default = BN.defaults.MagickaColour,
                },
                {
                    type = 'colorpicker',
                    name = 'Stamina Colour',
                    getFunc = function() return unpack(BN.SV.StaminaColour) end,
                    setFunc = function(r, g, b, a)
                        BN.SV.StaminaColour = {r, g, b, a}
                        BearNecessities_Stamina_Text:SetColor(r, g, b, a)
                    end,
                    disabled = function() return not BN.SV.isAttributeUIEnabled end,
                    default = BN.defaults.StaminaColour,
                },
            },
        },
    }

    LAM:RegisterAddonPanel(BN.name .. 'Options', panelData)
    LAM:RegisterOptionControls(BN.name .. 'Options', optionsTable)
end