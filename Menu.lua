local BN = BearNecessities
local EM = GetEventManager()
local LAM = LibAddonMenu2

function BN.BuildMenu()
    local PanelData = {
        type = 'panel',
        name = 'Bear Necessities',
        displayname = 'Bear Necessities',
        author = '|c00BFFFBjørn|r',
        version = BN.version,
        registerForRefresh = true,
        registerForDefaults = true,
    }

    local OptionsTable = {
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
            default = BN.Default.isAccountWide,
        },
        {
            type = 'checkbox',
            name = 'Food Reminder',
            getFunc = function() return BN.SV.isFoodEnabled end,
            setFunc = function(value)
                BN.SV.isFoodEnabled = value

                if value then EM:RegisterForUpdate(BN.name .. 'FoodReminder', BN.SV.foodReminderInterval * 1000, BN.FoodReminder)
                else EM:UnregisterForUpdate(BN.name .. 'FoodReminder') end
            end,
            default = BN.Default.isFoodEnabled,
        },
        {
            type = 'slider',
            name = 'Food Reminder Interval (seconds)',
            getFunc = function() return BN.SV.foodReminderInterval end,
            setFunc = function(value)
                BN.SV.foodReminderInterval = value
                EM:UnregisterForUpdate(BN.name .. 'FoodReminder')
                EM:RegisterForUpdate(BN.name .. 'FoodReminder', value * 1000, BN.FoodReminder)
            end,
            min = 1,
            max = 60,
            width = 'half',
            disabled = function() return not BN.SV.isFoodEnabled end,
            default = BN.Default.foodReminderInterval,
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
            default = BN.Default.foodReminderThreshold,
        },
        {
            type = 'checkbox',
            name = 'Hide Boss Compass Health Bar',
            getFunc = function() return BN.SV.doHideBossCompassHealthBar end,
            setFunc = function(value) BN.SV.doHideBossCompassHealthBar = value end,
            default = BN.Default.doHideBossCompassHealthBar,
        },
        {
            type = 'checkbox',
            name = 'Hide Target Health Bar',
            getFunc = function() return BN.SV.doHideTargetHealthBar end,
            setFunc = function(value) BN.SV.doHideTargetHealthBar = value end,
            default = BN.Default.doHideTargetHealthBar,
        },
        {
            type = 'checkbox',
            name = 'Move All Currencies To Bank',
            getFunc = function() return BN.SV.moveCurrencies end,
            setFunc = function(value) BN.SV.moveCurrencies = value end,
            default = BN.Default.moveCurrencies,
        },
        {
            type = 'checkbox',
            name = 'Simple Group UI',
            getFunc = function() return BN.SV.isGroupUIEnabled end,
            setFunc = function(value) BN.SV.isGroupUIEnabled = value end,
            default = BN.Default.isGroupUIEnabled,
        }
    }

    LAM:RegisterAddonPanel(BN.name .. 'Options', PanelData)
    LAM:RegisterOptionControls(BN.name .. 'Options', OptionsTable)
end