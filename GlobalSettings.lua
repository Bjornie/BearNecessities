local BN = BearNecessities
local CW = ZO_ChatWindow

local sv -- local account-wide saved variables
local chatContainer

-- Applies saved chat window settings on EVENT_PLAYER_ACTIVATED
local function SetChatWindowSettings()
    if sv.isChatAccountWide then
        -- Chat window position and dimension variables
        chatContainer.settings.relPoint = sv.chatSettings.relPoint
        chatContainer.settings.point = sv.chatSettings.point
        chatContainer.settings.x = sv.chatSettings.x
        chatContainer.settings.y = sv.chatSettings.y
        chatContainer.settings.height = sv.chatSettings.height
        chatContainer.settings.width = sv.chatSettings.width

        CW:ClearAnchors()
        CW:SetAnchor(chatContainer.settings.point, GuiRoot, chatContainer.settings.relPoint, chatContainer.settings.x, chatContainer.settings.y)
        CW:SetDimensions(chatContainer.settings.width, chatContainer.settings.height)

        CHAT_SYSTEM:SetFontSize(sv.chatSettings.fontSize)
        SetChatFontSize(sv.chatSettings.fontSize)

        for tabIndex in ipairs(sv.chatSettings.tabs) do
            -- If character has less chat tabs than number of chat tabs saved, create new chat tab
            if #chatContainer.windows < tabIndex then
                chatContainer:AddWindow(sv.chatSettings.tabs[tabIndex].name)
            end

            chatContainer:SetTabName(tabIndex, sv.chatSettings.tabs[tabIndex].name)
            chatContainer:SetLocked(tabIndex, sv.chatSettings.tabs[tabIndex].isLocked) -- No idea what this does but is called when creating new chat tab in game, so we do it as well
            chatContainer:SetInteractivity(tabIndex, sv.chatSettings.tabs[tabIndex].isInteractable)
            chatContainer:SetTimestampsEnabled(tabIndex, sv.chatSettings.tabs[tabIndex].areTimestampsEnabled)

            -- Chat filters (whispers, group-, guild chat, etc.)
            for category = 1, GetNumChatCategories() do
                SetChatContainerTabCategoryEnabled(chatContainer.id, tabIndex, category, sv.chatSettings.tabs[tabIndex].categories[category])
            end
        end

        if #chatContainer.windows > #sv.chatSettings.tabs then
            for i = #sv.chatSettings.tabs + 1, #chatContainer.windows do chatContainer:RemoveWindow(i) end
        end
    end
end

-- WiP
local function SetGameSettings()
    if sv.isGameSettingsAccountWide then
        for panelIndex, panel in pairs(sv.gameSettings) do
            for systemIndex, system in pairs(sv.gameSettings[panelIndex]) do
                for settingIndex, setting in pairs(sv.gameSettings[panelIndex][systemIndex]) do
                    SetSetting(systemIndex, settingIndex, setting)
                end
            end
        end
    end
end

-- Called on EVENT_PLAYER_ACTIVATED
local function SetSettings(initial)
    chatContainer = CHAT_SYSTEM.primaryContainer

    if initial then
        SetChatWindowSettings()
        SetGameSettings()
    end
end

-- Saves chat window settings on Reloadui, Logout, and Quit
local function GetChatWindowSettings()
    if sv.isChatAccountWide then
        -- Chat window position, dimension variables, and font size
        sv.chatSettings.point = chatContainer.settings.point
        sv.chatSettings.relPoint = chatContainer.settings.relPoint
        sv.chatSettings.x = chatContainer.settings.x
        sv.chatSettings.y = chatContainer.settings.y
        sv.chatSettings.height = chatContainer.settings.height
        sv.chatSettings.width = chatContainer.settings.width
        sv.chatSettings.fontSize = GetChatFontSize()

        sv.chatSettings.tabs = {}
        for tabIndex in ipairs(chatContainer.windows) do
            sv.chatSettings.tabs[tabIndex] = {}

            sv.chatSettings.tabs[tabIndex].name = chatContainer:GetTabName(tabIndex)
            sv.chatSettings.tabs[tabIndex].isLocked = chatContainer:IsLocked(tabIndex)
            sv.chatSettings.tabs[tabIndex].isInteractable = chatContainer:IsInteractive(tabIndex)
            sv.chatSettings.tabs[tabIndex].isCombatLog = chatContainer:IsCombatLog(tabIndex)
            sv.chatSettings.tabs[tabIndex].areTimestampsEnabled = chatContainer:AreTimestampsEnabled(tabIndex)

            -- Chat filters (whispers, group-, guild chat, etc.)
            sv.chatSettings.tabs[tabIndex].categories = {}
            for category = 1, GetNumChatCategories() do
                sv.chatSettings.tabs[tabIndex].categories[category] = IsChatContainerTabCategoryEnabled(chatContainer.id, tabIndex, category)
            end
        end
    end
end

-- WiP
local function GetGameSettings()
    if sv.isGameSettingsAccountWide then
        for panelIndex, panel in pairs(ZO_SharedOptions_SettingsData) do
            if panelIndex ~= 10 then
                sv.gameSettings[panelIndex] = {}

                for systemIndex, system in pairs(panel) do
                    sv.gameSettings[panelIndex][systemIndex] = {}

                    for settingIndex, setting in pairs(system) do
                        if setting.controlType ~= OPTIONS_INVOKE_CALLBACK and setting.system and setting.settingId then
                            if setting.controlType == OPTIONS_COLOR then
                            sv.gameSettings[panelIndex][systemIndex][settingIndex] = GetSetting(systemIndex, settingIndex):sub(3, 8)
                            else
                                sv.gameSettings[panelIndex][systemIndex][settingIndex] = GetSetting(systemIndex, settingIndex)
                            end
                            -- sv.gameSettings[panelIndex][systemIndex][settingIndex] = {{setting.system, setting.settingId}}

                            -- if setting.controlType == OPTIONS_COLOR then
                            --     sv.gameSettings[panelIndex][systemIndex][settingIndex][2] = GetSetting(setting.system, setting.settingId):sub(3, 8)
                            -- else
                            --     sv.gameSettings[panelIndex][systemIndex][settingIndex][2] = GetSetting(setting.system, setting.settingId)
                            -- end
                        end
                    end
                end
            end
        end
    end
end

-- Called before reloading ui or logging off
local function GetSettings()
    GetChatWindowSettings()
    GetGameSettings()
end

function BN.GlobalSettingsInitialise()
    sv = BearNecessitiesSV.Default[GetDisplayName()]['$AccountWide']

    BN.CallbackManager:RegisterCallback('PlayerActivated', SetSettings)

    -- Not exactly a clean way/time to get settings but working with settings is a pain and this is easy
    -- NOTE: If error occurs in GetSettings user is unable to call any of the below functions successfully. Must find an alternative method
    ZO_PreHook('ReloadUI', GetSettings)
    ZO_PreHook('Logout', GetSettings)
    ZO_PreHook('Quit', GetSettings)
end