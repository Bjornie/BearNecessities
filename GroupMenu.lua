local BN = BearNecessities
local WM = GetWindowManager()

-- Text colour for pledges, disabled pledges (not group lead, etc.), and mouseover respectively
local pledgeColours = {
    pledge = {0, 0.75, 1, 1},
    disabled = {0, 0.15, 0.2, 1},
    highlighted = {0, 0.91, 1, 1},
}

-- ID's for dungeon quests
local questIds = {
    3993, -- Fungal 1
    4054, -- Spindle 1
    4107, -- Banished 1
    4145, -- Darkshade 1
    4202, -- Arx
    4246, -- Wayrest 1
    4303, -- Fungal 2
    4336, -- Elden 1
    4346, -- Direfrost
    4379, -- Crypt of Hearts 1
    4432, -- Volenfell
    4469, -- Blessed Crucible
    4538, -- Tempest
    4555, -- Spindle 2
    4589, -- Blackheart Haven
    4597, -- Banished 2
    4641, -- Darkshade 2
    4675, -- Elden 2
    4733, -- Selene
    4778, -- Ash 1
    4813, -- Wayrest 2
    4822, -- Vaults of Madness
    5113, -- Crypt of Hearts 2
    5120, -- Ash 2
    5136, -- ICP
    5342, -- WGT
    5403, -- Ruins of Mazzatun
    5702, -- Cradle of Shadows
    5889, -- Bloodroot
    5891, -- Falkreath
    6065, -- Scalecaller
    6064, -- Fang Lair
    6186, -- MHK
    6188, -- MoS
    6249, -- Frostvault
    6251, -- DoM
    6349, -- Moongrave
    6351, -- LoM
    6414, -- Icereach
    6416, -- Unhallowed
    6505, -- Stone Garden
    6507, -- Castle Thorn
    6576, -- Black Drake Villa
    6578, -- The Cauldron
}

local pledges = {}
local quests = {}
local completedQuests = {}

-- Localised functions are faster
local strformat = string.format
local tblinsert = table.insert

local canDoVetdlcDungeons = GetUnitEffectiveChampionPoints('player') >= 300 and true or false
local treeEntry = DUNGEON_FINDER_KEYBOARD.navigationTree.templateInfo.ZO_ActivityFinderTemplateNavigationEntry_Keyboard

-- Called when Check Pledges button is pressed, marking all pledges in player's quest journal
local function CheckPledges()
    for index, value in ipairs(pledges) do
        ZO_CheckButton_OnClicked(value.control.check)
        ZO_ACTIVITY_FINDER_ROOT_MANAGER:ToggleLocationSelected(value.control.node.data)
    end
end

-- Button to mark all pledges in player's quest journal
local function BuildPledgeButton()
    WM:CreateControlFromVirtual('BearNecessities_CheckPledges', ZO_DungeonFinder_Keyboard, 'ZO_DefaultButton')
    BearNecessities_CheckPledges:SetWidth(200)
    BearNecessities_CheckPledges:SetText('Check Pledges')
    BearNecessities_CheckPledges:SetAnchor(BOTTOM, ZO_SearchingForGroupLeaveQueueButton, TOP, 0, -10)
    BearNecessities_CheckPledges:SetClickSound('Click')
    BearNecessities_CheckPledges:SetHandler('OnClicked', CheckPledges)
end

-- Called when Check Quests button is pressed, marking all normal dungeons in which the quest hasn't been completed
local function CheckQuests()
    for index, control in ipairs(quests) do
        ZO_CheckButton_OnClicked(control.check)
        ZO_ACTIVITY_FINDER_ROOT_MANAGER:ToggleLocationSelected(control.node.data)
    end
end

-- Button to mark all dungeons in which the quest hasn't been completed
local function BuildQuestButton()
    WM:CreateControlFromVirtual('BearNecessities_CheckQuests', ZO_DungeonFinder_Keyboard, 'ZO_DefaultButton')
    BearNecessities_CheckQuests:SetWidth(200)
    BearNecessities_CheckQuests:SetText('Check Quests')
    BearNecessities_CheckQuests:SetAnchor(BOTTOM, BearNecessities_CheckPledges, TOP, 0, -10)
    BearNecessities_CheckQuests:SetClickSound('Click')
    BearNecessities_CheckQuests:SetHandler('OnClicked', CheckQuests)

    ZO_SearchingForGroupActualTime:ClearAnchors()
    ZO_SearchingForGroupActualTime:SetAnchor(BOTTOM, BearNecessities_CheckQuests, TOP)
end

-- Modified text colour function changing colour of pledges in Dungeon Finder
local function GetTextColour(self)
    if not self.enabled then
        if self.owner.pledge then return unpack(pledgeColours.disabled)
        else return GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_DISABLED) end
    elseif self.selected then return GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_SELECTED)
	elseif self.mouseover then
        if self.owner.pledge then return unpack(pledgeColours.highlighted)
        else return GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_HIGHLIGHT) end
    else
        if self.owner.pledge then return unpack(pledgeColours.pledge)
        else return self.normalColor:UnpackRGBA() end
    end
end

-- Setup GetTextColour function to be used instead of default function
local function SetObjectPoolCustomFactoryBehavior()
    local function CustomBehavior(control, objectKey)
        control.text.owner = control
        control.text.GetTextColor = GetTextColour
    end

    treeEntry.objectPool:SetCustomFactoryBehavior(CustomBehavior)
end

local rawName, pledgeName
-- Flag pledges with control attribute and controls with pledge attribute
local function MarkDungeonForPledge(control, data, pledgeActivityType)
    rawName = strformat('%s', data.rawName:lower():gsub('%si$', ' 1'):gsub('%sii$', ' 2'))

    for i = 1, #pledges do
        pledgeName = pledges[i].pledgeName
        if rawName == pledgeName or rawName:match(strformat('.*:%s.*', pledgeName:gsub('%s+', '.*'))) or pledgeName:match(strformat('.*%s', rawName:gsub('%s+', '.*'))) then
            control.pledge = pledgeActivityType -- Used in GetTextColour
            pledges[i].control = control -- Used in CheckPledges

            break
        end
    end
end

local activityType, achievementIcons
-- Called on each dungeon in Dungeon Finder and checks if it's a pledge and if the relative quest is completed
local function OnTreeEntrySetup(node, control, data, open)
    -- LFG_ACTIVITY_DUNGEON = 2
    -- LFG_ACTIVITY_MASTER_DUNGEON = 3
    activityType = data:GetActivityType()
    control.pledge = nil

    if #pledges ~= 0 then
        if not canDoVetdlcDungeons and activityType == 2 then MarkDungeonForPledge(control, data, 2)
        elseif canDoVetdlcDungeons and activityType == 3 then MarkDungeonForPledge(control, data, 3) end
    end

    if activityType == 2 and not completedQuests[data.rawName] then tblinsert(quests, control) end

    -- Refresh colour in order to apply pledge colour
    control.text:RefreshTextColor()
end

local questName, completed, questType, formattedName
-- Get pledges in player's quest journal
local function GetPledges()
    for i = 1, GetNumJournalQuests() do
        questName, _, _, _, _, completed, _, _, _, questType = GetJournalQuestInfo(i)
        if questType == QUEST_TYPE_UNDAUNTED_PLEDGE and completed == false then
            formattedName = strformat('%s', questName:lower():gsub('.*:%s*', ''):gsub('%si$', ' 1'):gsub('%sii$', ' 2'))
            tblinsert(pledges, {pledgeName = formattedName})
        end

        if #pledges == 3 then break end
    end
end

local objectiveName
local function GetCompletedQuests()
    for index, value in ipairs(questIds) do
        _, objectiveName = GetCompletedQuestLocationInfo(value)
        objectiveName = objectiveName:gsub('.*:%s*', '')
        if value == 4641 then objectiveName = objectiveName .. 'I' end

        if objectiveName ~= "" then completedQuests[objectiveName] = true end
    end
end

local function OnDungeonFinderShown()
    GetPledges()
    GetCompletedQuests()
end

local function OnDungeonFinderHidden()
    pledges = {}
    quests = {}
    completedQuests = {}
end

-- Make group list reflect 'Display Name' setting
local function OnGroupListShown(self, control, data)
    if ZO_ShouldPreferUserId() then control.characterNameLabel:SetText(zo_strformat(SI_GROUP_LIST_PANEL_CHARACTER_NAME, data.index, data.displayName)) end
end

-- Make leaderboards reflect 'Display Name' setting
local function OnLeaderboardListShown(self, control, data)
    if ZO_ShouldPreferUserId() then control.nameLabel:SetText(data.displayName) end
end

-- Make mouseover show character name instead of account name if 'Display Name' setting is set to 'Prefer UserID'
local function OnSocialListMouseEnter(self, control)
    if ZO_ShouldPreferUserId() then
        local row = control:GetParent()
        local data = ZO_ScrollList_GetData(row)

        if data.characterName then
            InitializeTooltip(InformationTooltip)
            local textWidth = control:GetTextDimensions()
            InformationTooltip:ClearAnchors()
            InformationTooltip:SetAnchor(BOTTOM, control, TOPLEFT, textWidth * 0.5, 0)
            SetTooltipText(InformationTooltip, data.characterName)
        end

        self:EnterRow(row)

        return true
    end

    return false
end

function BN.GroupMenuInitialise()
    BuildPledgeButton()
    BuildQuestButton()
    SetObjectPoolCustomFactoryBehavior()

    ZO_PostHook(treeEntry, 'setupFunction', OnTreeEntrySetup)
    ZO_PreHookHandler(ZO_DungeonFinder_KeyboardListSection, 'OnEffectivelyShown', OnDungeonFinderShown)
    ZO_PostHookHandler(ZO_DungeonFinder_KeyboardListSection, 'OnEffectivelyHidden', OnDungeonFinderHidden)

    ZO_PostHook(GROUP_LIST, 'SetupGroupEntry', OnGroupListShown)
    ZO_PostHook(ZO_LeaderboardsManager_Shared, 'SetupLeaderboardPlayerEntry', OnLeaderboardListShown)
    ZO_PreHook(ZO_SocialListKeyboard, 'CharacterName_OnMouseEnter', OnSocialListMouseEnter)
end