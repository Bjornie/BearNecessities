local BN = BearNecessities
local WM = GetWindowManager()

-- Text colour for pledges, disabled pledges (not group lead, etc.), and mouseover respectively
local pledgeColours = {
    pledge = {0, 0.75, 1, 1},
    disabled = {0, 0.15, 0.2, 1},
    highlighted = {0, 0.91, 1, 1},
}

-- ID's for dungeon achievements (normal, vet, hard mode, speed, no death, and triple)
local dungeonAchievements = {
    [2] = {clear = 294}, -- normal Fungal Grotto 1
    [3] = {clear = 301}, -- normal Spindleclutch 1
    [4] = {clear = 325}, -- normal The Banished Cells 1
    [5] = {clear = 78}, -- normal Darkshade Caverns 1
    [6] = {clear = 79}, -- normal Wayrest Sewers 1
    [7] = {clear = 11}, -- normal Elden Hollow 1
    [8] = {clear = 272}, -- normal Arx Corinium
    [9] = {clear = 80,}, -- normal Crypt of Hearts 1
    [10] = {clear = 551}, -- normal City of Ash 1
    [11] = {clear = 357}, -- normal Direfrost Keep
    [12] = {clear = 391}, -- normal Volenfell
    [13] = {clear = 81}, -- normal Tempest Island
    [14] = {clear = 393}, -- normal Blessed Crucible
    [15] = {clear = 410}, -- normal Blackheart Haven
    [16] = {clear = 417}, -- normal Selene's Web
    [17] = {clear = 570}, -- normal Vaults of Madness
    [18] = {clear = 1562}, -- normal Fungal Grotto 2
    [19] = {clear = 421, hardMode = 448, speed = 446, noDeath = 1572}, -- veteran Spindleclutch 2
    [20] = {clear = 1549, hardMode = 1554, speed = 1552, noDeath = 1553}, -- veteran The Banished Cells 1
    [21] = {clear = 464, hardMode = 467, speed = 465, noDeath = 1588}, -- veteran Darkshade Caverns 2
    [22] = {clear = 1595}, -- normal Wayrest Sewers 2
    [23] = {clear = 1573, hardMode = 1578, speed = 1576, noDeath = 1577}, -- veteran Elden Hollow 1
    [261] = {clear = 1610, hardmode = 1615, speed = 1613, noDeath = 1614}, -- veteran Crypt of Hearts 1
    [267] = {clear = 878, hardMode = 1114, speed = 1108, noDeath = 1107}, -- veteran City of Ash 2
    [268] = {clear = 880, hardMode = 1303, speed = 1128, noDeath = 1129}, -- veteran Imperial City Prison
    [287] = {clear = 1120, hardMode = 1279, speed = 1275, noDeath = 1276}, -- veteran White-Gold Tower
    [288] = {clear = 1346}, -- normal White-Gold Tower
    [289] = {clear = 1345}, -- normal Imperial City Prison
    [293] = {clear = 1504}, -- normal Ruins of Mazzatun
    [294] = {clear = 1505, hardMode = 1506, speed = 1507, noDeath = 1508}, -- veteran Ruins of Mazzatun
    [295] = {clear = 1522}, -- normal Cradle of Shadows
    [296] = {clear = 1523, hardMode = 1524, speed = 1525, noDeath = 1526}, -- veteran Cradle of Shadows
    [299] = {clear = 1556, hardMode = 1561, speed = 1559, noDeath = 1560}, -- veteran Fungal Grotto 1
    [300] = {clear = 1555}, -- normal The Banished Cells 2
    [301] = {clear = 545, hardMode = 451, speed = 449, noDeath = 1564}, -- veteran The Banished Cells 2
    [302] = {clear = 459, hardMode = 463, speed = 461, noDeath = 1580}, -- veteran Elden Hollow 2
    [303] = {clear = 1579}, -- normal Elden Hollow 2
    [304] = {clear = 1629, hardMode = 1634, speed = 1632, noDeath = 1633}, -- veteran Volenfell
    [305] = {clear = 1604, hardMode = 1609, speed = 1607, noDeath = 1608}, -- veteran Arx Corinium
    [306] = {clear = 1589, hardMode = 1594, speed = 1592, noDeath = 1593}, -- veteran Wayrest Sewers 1
    [307] = {clear = 678, hardMode = 681, speed = 679, noDeath = 1596}, -- veteran Wayrest Sewers 2
    [308] = {clear = 1587}, -- normal Darkshade Caverns 2
    [309] = {clear = 1581, hardMode = 1586, speed = 1584, noDeath = 1585}, -- veteran Darkshade Caverns 1
    [310] = {clear = 1597, hardMode = 1602, speed = 1600, noDeath = 1601}, -- veteran City of Ash 1
    [311] = {clear = 1617, hardMode = 1622, speed = 1620, noDeath = 1621}, -- veteran Tempest Island
    [312] = {clear = 343, hardMode = 342, speed = 340, noDeath = 1563}, -- veteran Fungal Grotto 2
    [313] = {clear = 1635, hardMode = 1640, speed = 1638, noDeath = 1639}, -- veteran Selene's Web
    [314] = {clear = 1653, hardMode = 1658, speed = 1656, noDeath = 1657}, -- veteran Vaults of Madness
    [315] = {clear = 1565, hardMode = 1570, speed = 1568, noDeath = 1569}, -- veteran Spindleclutch 1
    [316] = {clear = 1571}, -- normal Spindleclutch 2
    [317] = {clear = 1616}, -- normal Crypt of Hearts 2
    [318] = {clear = 876, hardMode = 1084, speed = 941, noDeath = 942}, -- veteran Crypt of Hearts 2
    [319] = {clear = 1623, hardMode = 1628, speed = 1626, noDeath = 1627}, -- veteran Direfrost Keep
    [320] = {clear = 1641, hardMode = 1646, speed = 1644, noDeath = 1645}, -- veteran Blessed Crucible
    [321] = {clear = 1647, hardMode = 1652, speed = 1650, noDeath = 1651}, -- veteran Blackheart Haven
    [322] = {clear = 1603}, -- normal City of Ash 2
    [324] = {clear = 1690}, -- normal Bloodroot Forge
    [325] = {clear = 1691, hardMode = 1696, speed = 1694, noDeath = 1695}, -- veteran Bloodroot Forge
    [368] = {clear = 1698}, -- normal Falkreath Hold
    [369] = {clear = 1699, hardMode = 1704, speed = 1702, noDeath = 1703}, -- veteran Falkreath Hold
    [418] = {clear = 1959}, -- normal Scalecaller Peak
    [419] = {clear = 1960, hardMode = 1965, speed = 1963, noDeath = 1964, triple = 2102}, -- veteran Scalecaller Peak
    [420] = {clear = 1975}, -- normal Fang Lair
    [421] = {clear = 1976, hardMode = 1981, speed = 1979, noDeath = 1980, triple = 1983}, -- veteran Fang Lair
    [426] = {clear = 2152}, -- normal Moon Hunter Keep
    [427] = {clear = 2153, hardMode = 2154, speed = 2155, noDeath = 2156, triple = 2159}, -- veteran Moon Hunter Keep
    [428] = {clear = 2162}, -- normal March of Sacrifices
    [429] = {clear = 2163, hardMode = 2164, speed = 2165, noDeath = 2166, triple = 2168}, -- veteran March of Sacrifices
    [433] = {clear = 2260}, -- normal Frostvault
    [434] = {clear = 2261, hardMode = 2262, speed = 2263, noDeath = 2264, triple = 2267}, -- veteran Frostvault
    [435] = {clear = 2270}, -- normal Depths of Malatar
    [436] = {clear = 2271, hardMode = 2272, speed = 2273, noDeath = 2274, triple = 2276}, -- veteran Depths of Malatar
    [494] = {clear = 2415}, -- normal Moongrave Fane
    [495] = {clear = 2416, hardMode = 2417, speed = 2418, noDeath = 2419, triple = 2422}, -- veteran Moongrave Fane
    [496] = {clear = 2425}, -- normal Lair of Maarselok
    [497] = {clear = 2426, hardMode = 2427, speed = 2428, noDeath = 2429, triple = 2431}, -- veteran Lair of Maarselok
    [503] = {clear = 2539}, -- normal Icereach
    [504] = {clear = 2540, hardMode = 2541, speed = 2542, noDeath = 2543, triple = 2546}, -- veteran Icereach
    [505] = {clear = 2549}, -- normal Unhallowed Grave
    [506] = {clear = 2550, hardMode = 2551, speed = 2552, noDeath = 2553, triple = 2555}, -- veteran Unhallowed Grave
    [507] = {clear = 2694}, -- normal Stone Garden
    [508] = {clear = 2695, hardMode = 2755, speed = 2697, noDeath = 2698, triple = 2701}, -- veteran Stone Garden
    [509] = {clear = 2704}, -- normal Castle Thorn
    [510] = {clear = 2705, hardMode = 2706, speed = 2707, noDeath = 2708, triple = 2710}, -- veteran Castle Thorn
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
}

local pledges = {}
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
    local container = ZO_DungeonFinder_KeyboardListSectionScrollChildContainer2

    local control, zoneId
    for i = 1, container:GetNumChildren() do
        control = container:GetChild(i)
        zoneId = control.node.data.zoneId

        if not completedQuests[zoneId] then
            ZO_CheckButton_OnClicked(control.check)
            ZO_ACTIVITY_FINDER_ROOT_MANAGER:ToggleLocationSelected(control.node.data)
        end
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

local iconControl
-- Positions achievement icons (normal/vet completion, hard mode, speed, no death, and triple) next to each dungeon in Dungeon Finder
local function PositionAchievementIcons(name, parent, string)
    iconControl = _G[name] or WM:CreateControl(name, parent, CT_LABEL)

    iconControl:ClearAnchors()
    iconControl:SetAnchor(LEFT, parent, LEFT, 400)
    iconControl:SetColor(1, 1, 1, 1)
    iconControl:SetDimensions(100, 20)
    iconControl:SetFont('ZOFontGameLarge')
    iconControl:SetHidden(false)
    iconControl:SetHorizontalAlignment(0)
    iconControl:SetText(string)
    iconControl:SetVerticalAlignment(1)
end

local activityType, achievementIcons, objectiveName
-- Called on each dungeon in Dungeon Finder, checks:
-- • If it's a pledge
-- • Completed achievements
-- • If dungeon quest is completed
local function OnTreeEntrySetup(node, control, data, open)
    -- LFG_ACTIVITY_DUNGEON = 2
    -- LFG_ACTIVITY_MASTER_DUNGEON = 3
    activityType = data:GetActivityType()
    control.pledge = nil

    if #pledges ~= 0 then
        if not canDoVetdlcDungeons and activityType == 2 then MarkDungeonForPledge(control, data, 2)
        elseif canDoVetdlcDungeons and activityType == 3 then MarkDungeonForPledge(control, data, 3) end
    end

    -- String containing icons for completed dungeon achievements
    if dungeonAchievements[data.id] then
        achievementIcons = IsAchievementComplete(dungeonAchievements[data.id].clear) and '|t20:20:/esoui/art/cadwell/check.dds|t' or '|t20:20:/esoui/art/icons/heraldrycrests_misc_blank_01.dds|t'
        achievementIcons = achievementIcons .. (IsAchievementComplete(dungeonAchievements[data.id].hardMode) and '|t20:20:/esoui/art/treeicons/gamepad/achievement_categoryicon_veterandungeons.dds|t' or '|t20:20:/esoui/art/icons/heraldrycrests_misc_blank_01.dds|t')
        achievementIcons = achievementIcons .. (IsAchievementComplete(dungeonAchievements[data.id].speed) and '|t20:20:/esoui/art/mounts/gamepad/gp_ridingskill_speed.dds|t' or '|t20:20:/esoui/art/icons/heraldrycrests_misc_blank_01.dds|t')
        achievementIcons = achievementIcons .. (IsAchievementComplete(dungeonAchievements[data.id].noDeath) and '|t20:20:/esoui/art/deathrecap/deathrecap_killingblow_icon.dds|t' or '|t20:20:/esoui/art/icons/heraldrycrests_misc_blank_01.dds|t')
        achievementIcons = achievementIcons .. (IsAchievementComplete(dungeonAchievements[data.id].triple) and '|t20:20:/esoui/art/market/keyboard/esoplus_chalice_white2_64.dds|t' or '|t20:20:/esoui/art/icons/heraldrycrests_misc_blank_01.dds|t')
    end

    PositionAchievementIcons('BearNecessities_AchievementIcons' .. activityType .. data.id, control, achievementIcons)

    -- Dungeon quest check
    if activityType == 2 then -- LFG_ACTIVITY_DUNGEON = 2
        for index, value in ipairs(questIds) do
            _, objectiveName = GetCompletedQuestLocationInfo(value)
            objectiveName = objectiveName:gsub('.*:%s*', '')

            if value == 4641 then objectiveName = objectiveName .. 'I' end
            if objectiveName == data.rawName then completedQuests[data.zoneId] = true end
        end
    end

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

local function OnDungeonFinderShown()
    GetPledges()
end

local function OnDungeonFinderHidden()
    pledges = {}
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