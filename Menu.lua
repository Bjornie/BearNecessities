local BN = BearNecessities
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
            type = 'submenu',
            name = 'Information',
            controls = {
                {
                    type = 'description',
                    text = 'This addon has the following chat commands:\n- /house: port inside your primary residence\n- /m: summon merchant assistant\n- /b: summon banker assistant\n- /s: summon smuggler assistant\n- /hg: hide group members (works for necros as well)'
                },
                {
                    type = 'description',
                    text = 'Furthermore this addon does some things that there are no settings for. They are the following:\nBase game settings > Interface > Display Name now also affects group list and leaderboards. So if the setting is set to \'Prefer UserID\' group list and leaderboards menu will show account name instead of character name. Hovering your curser over an acocunt name will show the character name.',
                },
                {
                    type = 'description',
                    text = 'Changes colour of pledges in Dungeon Finder and adds two new buttons in the bottom left of the Dungeon Finder menu: \'Check Quests\' and \'Check Pledges\'. \'Check Quests\' will mark every dungeon (on normal difficulty) that you haven\'t completed the quest for. Reason? Dungeon quests award one skill point, so this is an easy way to farm skill points. \'Check Pledges\' will mark every pledge you currently have.',
                },
                {
                    type = 'description',
                    text = 'If LootLog is installed and enabled, and you have a chat tab named \'Loot Log\' LootLog will only send chat messages in this chat tab instead of all chat tabs.',
                },
            },
        },
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

                if not BN.isUILocked then control:SetText('Lock UI')
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
            getFunc = function() return BN.sv.isFoodReminderEnabled end,
            setFunc = function(value) BN.sv.isFoodReminderEnabled = value end,
            width = 'half',
            default = BN.defaults.isFoodReminderEnabled,
        },
        {
            type = 'slider',
            name = 'Food Reminder Threshold (minutes)',
            getFunc = function() return BN.sv.foodReminderThreshold end,
            setFunc = function(value) BN.sv.foodReminderThreshold = value end,
            min = 1,
            max = 60,
            width = 'half',
            disabled = function() return not BN.sv.isFoodReminderEnabled end,
            default = BN.defaults.foodReminderThreshold,
        },
        {
            type = 'checkbox',
            name = 'Auto Move All Currencies To Bank',
            getFunc = function() return BN.sv.doMoveCurrencies end,
            setFunc = function(value) BN.sv.doMoveCurrencies = value end,
            default = BN.defaults.doMoveCurrencies,
        },
        {
            type = 'checkbox',
            name = 'Minimize Chat In Combat',
            getFunc = function() return BN.sv.doHideChatInCombat end,
            setFunc = function(value) BN.sv.doHideChatInCombat = value end,
            default = BN.defaults.doHideChatInCombat,
        },
        {
            type = 'checkbox',
            name = 'Auto Repair Gear & Auto Recharge Weapons',
            getFunc = function() return BN.sv.doAutoCheckGear end,
            setFunc = function(value) BN.sv.doAutoCheckGear = value end,
            default = BN.defaults.doAutoCheckGear,
        },
        {
            type = 'checkbox',
            name = 'Account-Wide Chat Settings',
            getFunc = function() return BearNecessitiesSV.Default[GetDisplayName()]['$AccountWide'].isChatAccountWide end,
            setFunc = function(value) BearNecessitiesSV.Default[GetDisplayName()]['$AccountWide'].isChatAccountWide = value end,
            warning = 'This setting ignores \'Account-Wide Settings\'! Your current chat settings will be copied and applied to every character you log in to.',
            default = BN.defaults.isChatAccountWide,
        },
        {
            type = 'checkbox',
            name = 'Account-Wide Game Settings',
            getFunc = function() return BearNecessitiesSV.Default[GetDisplayName()]['$AccountWide'].isGameSettingsAccountWide end,
            setFunc = function(value) BearNecessitiesSV.Default[GetDisplayName()]['$AccountWide'].isGameSettingsAccountWide = value end,
            tooltip = 'Makes Base Game Settings Account-Wide',
            warning = 'This setting ignores \'Account-Wide Settings\'! Your current game settings will be copied and applied to every character you log in to.',
            default = BN.defaults.isGameSettingsAccountWide,
        },
        {
            type = 'submenu',
            name = 'Base Game UI',
            controls = {
                {
                    type = 'checkbox',
                    name = 'Hide Boss Compass Health Bar',
                    getFunc = function() return BN.sv.doHideBossCompassHealthBar end,
                    setFunc = function(value) BN.sv.doHideBossCompassHealthBar = value end,
                    default = BN.defaults.doHideBossCompassHealthBar,
                },
                {
                    type = 'checkbox',
                    name = 'Hide Target Health Bar',
                    getFunc = function() return BN.sv.doHideTargetHealthBar end,
                    setFunc = function(value)
                        BN.sv.doHideTargetHealthBar = value
                        if value then UNIT_FRAMES.staticFrames['reticleover']:SetHiddenForReason('BearNecessities', true)
                        else UNIT_FRAMES.staticFrames['reticleover']:SetHiddenForReason('BearNecessities', false) end
                    end,
                    default = BN.defaults.doHideTargetHealthBar,
                },
                {
                    type = 'checkbox',
                    name = 'Hide Experience Bar',
                    getFunc = function() return BN.sv.isExpBarHidden end,
                    setFunc = function(value)
                        BN.sv.isExpBarHidden = value
                        if value then BN.RemoveFragment(PLAYER_PROGRESS_BAR_FRAGMENT)
                        else BN.AddFragment(PLAYER_PROGRESS_BAR_FRAGMENT) end
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
                    getFunc = function() return BN.sv.isGroupUIEnabled end,
                    setFunc = function(value) BN.sv.isGroupUIEnabled = value end,
                    default = BN.defaults.isGroupUIEnabled,
                },
                {
                    type = 'checkbox',
                    name = 'Simple Attribute UI',
                    getFunc = function() return BN.sv.isAttributeUIEnabled end,
                    setFunc = function(value)
                        BN.sv.isAttributeUIEnabled = value
                        if value then BN.RemoveFragment(PLAYER_ATTRIBUTE_BARS_FRAGMENT)
                        else BN.AddFragment(PLAYER_ATTRIBUTE_BARS_FRAGMENT) end
                    end,
                    default = BN.defaults.isAttributeUIEnabled,
                },
                {
                    type = 'colorpicker',
                    name = 'Health Colour',
                    getFunc = function() return unpack(BN.sv.healthColour) end,
                    setFunc = function(r, g, b, a)
                        BN.sv.healthColour = {r, g, b, a}
                        BearNecessities_Health_Value:SetColor(r, g, b, a)
                    end,
                    disabled = function() return not BN.sv.isAttributeUIEnabled end,
                    default = BN.defaults.healthColour,
                },
                {
                    type = 'colorpicker',
                    name = 'Shield Colour',
                    getFunc = function() return unpack(BN.sv.shieldColour) end,
                    setFunc = function(r, g, b, a)
                        BN.sv.shieldColour = {r, g, b, a}
                        BearNecessities_Shield_Value:SetColor(r, g, b, a)
                    end,
                    disabled = function() return not BN.sv.isAttributeUIEnabled end,
                    default = BN.defaults.shieldColour,
                },
                {
                    type = 'colorpicker',
                    name = 'Magicka Colour',
                    getFunc = function() return unpack(BN.sv.magickaColour) end,
                    setFunc = function(r, g, b, a)
                        BN.sv.magickaColour = {r, g, b, a}
                        BearNecessities_Magicka_Value:SetColor(r, g, b, a)
                    end,
                    disabled = function() return not BN.sv.isAttributeUIEnabled end,
                    default = BN.defaults.magickaColour,
                },
                {
                    type = 'colorpicker',
                    name = 'Stamina Colour',
                    getFunc = function() return unpack(BN.sv.staminaColour) end,
                    setFunc = function(r, g, b, a)
                        BN.sv.staminaColour = {r, g, b, a}
                        BearNecessities_Stamina_Value:SetColor(r, g, b, a)
                        BearNecessities_MountStamina_Value:SetColor(r, g, b, a)
                    end,
                    disabled = function() return not BN.sv.isAttributeUIEnabled end,
                    default = BN.defaults.staminaColour,
                },
            },
        },
    }

    LAM:RegisterAddonPanel(BN.name .. 'Options', panelData)
    LAM:RegisterOptionControls(BN.name .. 'Options', optionsTable)
end