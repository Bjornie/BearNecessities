local BN = BearNecessities

function BN.BuildMenu()
    local PanelData = {
        type = "panel",
        name = "Bear Necessities",
        displayname = "Bear Necessities",
        author = "|c00BFFFBjørn|r",
        version = BN.version,
        registerForRefresh = true,
    }

    local OptionsTable = {
        {
            type = "header",
            name = "|cFFFACDGeneral|r",
        },
        {
            type = "checkbox",
            name = "Account-Wide Settings",
            getFunc = function() return BearNecessitiesSV.Default[GetDisplayName()]["$AccountWide"].isAccountWide end,
            setFunc = function(value) BearNecessitiesSV.Default[GetDisplayName()]["$AccountWide"].isAccountWide = value end,
            requiresReload = true,
        },
        -- Food Reminder
        {
            type = "checkbox",
            name = "Food Reminder",
            getFunc = function() return BN.SV.isFoodEnabled end,
            setFunc = function(value)
                BN.SV.isFoodEnabled = value

                if value then EVENT_MANAGER:RegisterForUpdate(BN.name .. "FoodReminder", BN.SV.foodReminderInterval * 1000, BN.FoodReminder)
                else EVENT_MANAGER:UnregisterForUpdate(BN.name .. "FoodReminder") end
            end,
        },
        {
            type = "slider",
            name = "Food Reminder Interval (seconds)",
            width = "half",
            min = 1,
            max = 60,
            step = 1,
            default = 30,
            getFunc = function() return BN.SV.foodReminderInterval end,
            setFunc = function(value)
                BN.SV.foodReminderInterval = value
                EVENT_MANAGER:UnregisterForUpdate(BN.name .. "FoodReminder")
                EVENT_MANAGER:RegisterForUpdate(BN.name .. "FoodReminder", value * 1000, BN.FoodReminder)
            end,
        },
        {
            type = "slider",
            name = "Food Reminder Threshold (minutes)",
            width = "half",
            min = 1,
            max = 60,
            step = 1,
            default = 10,
            getFunc = function() return BN.SV.foodReminderThreshold end,
            setFunc = function(value) BN.SV.foodReminderThreshold = value end,
        },
        {
            type = "checkbox",
            name = "Hide Boss Compass Health Bar",
            getFunc = function() return BN.SV.doHideBossCompassHealthBar end,
            setFunc = function(value) BN.SV.doHideBossCompassHealthBar = value end,
        }
    }

    LibAddonMenu2:RegisterAddonPanel(BN.name .. 'Options', PanelData)
    LibAddonMenu2:RegisterOptionControls(BN.name .. 'Options', OptionsTable)
end