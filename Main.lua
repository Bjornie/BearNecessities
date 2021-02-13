BearNecessities = {
    name = 'BearNecessities',
    version = '1.5.0',
    svName = 'BearNecessitiesSV',
    svVersion = 2,
    isMovable = false,

    defaults = {
        isAccountWide = false,
        isFoodReminderEnabled = false,
        foodLeft = 200,
        foodTop = 200,
        foodReminderThreshold = 10,
        doHideBossCompassHealthBar = false,
        doHideTargetHealthBar = false,
        isGroupUIEnabled = false,
        groupLeft = 0,
        groupTop = 0,
        isAttributeUIEnabled = false,
        healthRight = 1460,
        healthTop = 1513,
        healthColour = {0.65, 0.16, 0.16, 1},
        magickaRight = 1360,
        magickaTop = 1513,
        magickaColour = {0.16, 0.51, 0.76, 1},
        staminaRight = 1560,
        staminaTop = 1513,
        staminaColour = {0, 0.5, 0.4, 1},
        isExpBarHidden = false,
        doMoveCurrencies = false,
        doHideChatInCombat = false,
        doAutoCheckGear = false,
    },
}

local equipmentSlots = {
    EQUIP_SLOT_HEAD,
    EQUIP_SLOT_CHEST,
    EQUIP_SLOT_SHOULDERS,
    EQUIP_SLOT_MAIN_HAND,
    EQUIP_SLOT_OFF_HAND,
    EQUIP_SLOT_WAIST,
    EQUIP_SLOT_LEGS,
    EQUIP_SLOT_FEET,
    EQUIP_SLOT_HAND,
    EQUIP_SLOT_BACKUP_MAIN,
    EQUIP_SLOT_BACKUP_OFF,
}

local foodList = {
    [61255] = 'bistat', -- Increase Max Health & Stamina
    [84720] = 'unique', -- Ghastly Eye Bowl
    [86673] = 'unique', -- Lava Foot Soup-And-Saltrice
    [107748] = 'unique', -- Artaeum Pickled Fish Bowl
    [107789] = 'unique', -- Artaeum Takeaway Broth
    [127596] = 'unique', -- Bewitched Sugar Skulls
}

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

local BN = BearNecessities
local EM = GetEventManager()
local WM = GetWindowManager()

local strformat = string.format
local strmatch = string.match

local isInRaidOrDungeon = false
local isVeteran = GetUnitEffectiveChampionPoints('player') >= 160 and 3 or 2
local container, numPressed, control, zoneId
local headerNormal = ZO_DungeonFinder_KeyboardListSectionScrollChildZO_ActivityFinderTemplateNavigationHeader_Keyboard1
local activeWindow, chatContainer, systemWindow, groupWindow, whisperWindow, guildWindow, generalWindow
local groupMembersAlive, groupMembersOnline = 0, 0
local isGroupHidden = false
local isNecro = GetUnitClassId('player') == 5
local isTyping = false

local fragment
local function AddSimpleFragment(control, condition)
    fragment = ZO_SimpleSceneFragment:New(control)

    if condition then fragment:SetConditional(condition) end

    HUD_SCENE:AddFragment(fragment)
    HUD_UI_SCENE:AddFragment(fragment)

    return fragment
end

local function CreateSceneFragments()
    local finish, abilityId
    local noFood, foodBuffRemaining, foodFormattedTime = true, 0, 0
    local function FoodFragmentCondition()
        if not BN.SV.isFoodReminderEnabled or not isInRaidOrDungeon then return false end

        for i = 1, GetNumBuffs('player') do
            _, _, finish, _, _, _, _, _, _, _, abilityId = GetUnitBuffInfo('player', i)

            if foodList[abilityId] then
                noFood = false
                foodBuffRemaining = finish - GetGameTimeSeconds()

                if foodBuffRemaining <= BN.SV.foodReminderThreshold * 60 then
                    foodFormattedTime = ZO_FormatTime(foodBuffRemaining, TIME_FORMAT_STYLE_COLONS, TIME_FORMAT_PRECISION_SECONDS)
                    BearNecessities_FoodReminder_Timer:SetText(foodFormattedTime)

                    return true
                else return false end
            end
        end

        if noFood then
            BearNecessities_FoodReminder_Timer:SetText('|cFF0000EXPIRED|r')
            return true
        end
    end

    local function GroupFragmentCondition()
        BearNecessities_GroupFrame_Label:SetText(strformat('%d/%d', groupMembersAlive, groupMembersOnline))
        return BN.SV.isGroupUIEnabled and IsUnitGrouped('player') or BN.isMovable
    end

    local function AttributeFragmentCondition()
        return BN.SV.isAttributeUIEnabled
    end

    FOOD_FRAGMENT = AddSimpleFragment(BearNecessities_FoodReminder, FoodFragmentCondition)
    GROUP_FRAGMENT = AddSimpleFragment(BearNecessities_GroupFrame, GroupFragmentCondition)
    HEALTH_FRAGMENT = AddSimpleFragment(BearNecessities_Health, AttributeFragmentCondition)
    MAGICKA_FRAGMENT = AddSimpleFragment(BearNecessities_Magicka, AttributeFragmentCondition)
    STAMINA_FRAGMENT = AddSimpleFragment(BearNecessities_Stamina, AttributeFragmentCondition)
end

local function CheckPledges()
    container = isVeteran == 3 and ZO_DungeonFinder_KeyboardListSectionScrollChildContainer3 or ZO_DungeonFinder_KeyboardListSectionScrollChildContainer2
    numPressed = 0

    for i = 1, container:GetNumChildren() do
        control = container:GetChild(i)
        zoneId = control.node.data.zoneId

        if pledges[zoneId] == false and control.check:GetState() == 0 then
            control.check:SetState(BSTATE_PRESSED, true)
            ZO_ACTIVITY_FINDER_ROOT_MANAGER:ToggleLocationSelected(control.node.data)
            numPressed = numPressed + 1
        elseif pledges[zoneId] == false and control.check:GetState() == 1 then
            control.check.SetState(B_STATE_NORMAL, true)
            ZO_ACTIVITY_FINDER_ROOT_MANAGER:ToggleLocationSelected(control.node.data)
            numPressed = numPressed - 1
        end
    end

    if numPressed > 0 then BearNecessities_CheckPledges:SetText('Uncheck Pledges')
    else BearNecessities_CheckPledges:SetText('Check Pledges') end
end

local function BuildPledgeButton()
    WM:CreateControlFromVirtual('BearNecessities_CheckPledges', ZO_DungeonFinder_Keyboard, 'ZO_DefaultButton')
    BearNecessities_CheckPledges:SetWidth(200)
    BearNecessities_CheckPledges:SetText('Check Pledges')
    BearNecessities_CheckPledges:SetAnchor(BOTTOM, ZO_SearchingForGroupLeaveQueueButton, TOP, 0, -10)
    BearNecessities_CheckPledges:SetClickSound('Click')
    BearNecessities_CheckPledges:SetHandler('OnClicked', CheckPledges)
end

local function CheckQuests()
    container = ZO_DungeonFinder_KeyboardListSectionScrollChildContainer2
    numPressed = 0

    for i = 1, container:GetNumChildren() do
        control = container:GetChild(i)
        zoneId = control.node.data.zoneId

        if not completedQuests[zoneId] and control.check:GetState() == 0 then
            control.check:SetState(BSTATE_PRESSED, true)
            ZO_ACTIVITY_FINDER_ROOT_MANAGER:ToggleLocationSelected(control.node.data)
            numPressed = numPressed + 1
        elseif not completedQuests[zoneId] and control.check:GetState() == 1 then
            control.check:SetState(BSTATE_NORMAL, true)
            ZO_ACTIVITY_FINDER_ROOT_MANAGER:ToggleLocationSelected(control.node.data)
            numPressed = numPressed - 1
        end
    end

    if numPressed > 0 then
        if not headerNormal.node.open then headerNormal:OnMouseUp(true) end
        BearNecessities_CheckQuests:SetText('Uncheck Quests')
    else
        if headerNormal.node.open then headerNormal:OnMouseUp(true) end
        BearNecessities_CheckQuests:SetText('Check Quests')
    end
end

local function BuildQuestButton()
    WM:CreateControlFromVirtual('BearNecessities_CheckQuests', ZO_DungeonFinder_Keyboard, 'ZO_DefaultButton')
    BearNecessities_CheckQuests:SetWidth(200)
    BearNecessities_CheckQuests:SetText('Check Quests')
    BearNecessities_CheckQuests:SetAnchor(BOTTOM, BearNecessities_CheckPledges, TOP, 0, -10)
    BearNecessities_CheckPledges:SetClickSound('Click')
    BearNecessities_CheckPledges:SetHandler('OnClicked', CheckQuests)

    ZO_SearchingForGroupActualTime:ClearAnchors()
    ZO_SearchingForGroupActualTime:SetAnchor(Bottom, BearNecessities_CheckQuests, TOP)
end

local function RemoveChatTabs(index)
    for window = index, #chatContainer.windows do
        chatContainer:RemoveWindow(window)
    end
end

local window, key
local function CreateNewWindowTab(name)
    window, key = chatContainer.windowPool:AcquireObject()
    window.key = key

    chatContainer:AddRawWindow(window, name)

    local tabIndex = window.tab.index

    chatContainer:SetInteractivity(tabIndex, true)
    chatContainer:SetLocked(tabIndex, true)
    chatContainer:SetTimestampsEnabled(tabIndex, true)

    for category = 1, 24 do chatContainer:SetWindowFilterEnabled(tabIndex, category, false) end
end

--  1 = /say
--  2 = /yell
--  3 = /tell (and /whisper?) incoming
--  4 = /tell (and /whisper?) outgoing
--  5 = /say
--  6 = /zone
--  7 = /group
--  8 = /emote
--  9 = player has logged on/off
-- 10 = /guild1
-- 11 = /guild2
-- 12 = /guild3
-- 13 = /guild4
-- 14 = /guild5
-- 15 = /officer1
-- 16 = /officer2
-- 17 = /officer3
-- 18 = /officer4
-- 19 = /officer5
-- 20 = /enzone
-- 21 = /frzone
-- 22 = /dezone
-- 23 = /jpzone
-- 24 = /ruzone
-- 25 = /say
-- 26 = /say
-- 27 = /say
-- 28 = /say
-- 29 = /say
-- 30 = /say
-- 31 = /say
-- 32 = /say
-- 33 = /say
-- 34 = /say
-- 35 = /say
-- 36 = /say
-- 37 = /say
-- 38 = /say
-- 39 = /say
-- 40 = /say
-- 41 = /npc
-- 42 = ???
-- 43 = ???
-- 44 = ???
-- 45 = ???
-- 46 = ???
-- 47 = ???
-- 48 = ???
-- 49 = ???
-- 50 = ???
-- 51 = ???
-- 52 = ???
-- 53 = ???
-- 54 = ???
-- 55 = ???
-- 56 = ???
-- 57 = ???
-- 58 = ???
-- 59 = ???
-- 60 = ???
-- 61 = ???
-- GetNumChatCategories()
local function GetChatWindowTabs()
    if not CHAT_SYSTEM.primaryContainer then zo_callLater(GetChatWindowTabs, 200) return end

    chatContainer = CHAT_SYSTEM.primaryContainer

    if chatContainer:GetTabName(1) ~= 'System' then
        chatContainer:SetTabName(1, 'System')

        for category = 1, 24 do chatContainer:SetWindowFilterEnabled(1, category, false) end

        chatContainer:SetWindowFilterEnabled(1, 9, true)
    end

    if chatContainer:GetTabName(2) ~= 'Loot Log' then
        RemoveChatTabs(2)
        CreateNewWindowTab('Loot Log')
    end

    if chatContainer:GetTabName(3) ~= 'Group' then
        RemoveChatTabs(3)
        CreateNewWindowTab('Group')

        chatContainer:SetWindowFilterEnabled(3, 7, true)
    end

    if chatContainer:GetTabName(4) ~= 'Whisper' then
        RemoveChatTabs(4)
        CreateNewWindowTab('Whisper')

        chatContainer:SetWindowFilterEnabled(4, 3, true)
        chatContainer:SetWindowFilterEnabled(4, 4, true)
    end

    if chatContainer:GetTabName(5) ~= 'Guild' then
        RemoveChatTabs(5)
        CreateNewWindowTab('Guild')

        for category = 10, 19 do chatContainer:SetWindowFilterEnabled(5, category, true) end
    end

    if chatContainer:GetTabName(6) ~= 'General' then
        RemoveChatTabs(6)
        CreateNewWindowTab('General')

        chatContainer:SetWindowFilterEnabled(6, 1, true)
        chatContainer:SetWindowFilterEnabled(6, 2, true)
        chatContainer:SetWindowFilterEnabled(6, 5, true)
        chatContainer:SetWindowFilterEnabled(6, 6, true)
        chatContainer:SetWindowFilterEnabled(6, 8, true)
        chatContainer:SetWindowFilterEnabled(6, 20, true)
        chatContainer:SetWindowFilterEnabled(6, 21, true)
        chatContainer:SetWindowFilterEnabled(6, 22, true)
        chatContainer:SetWindowFilterEnabled(6, 23, true)
        chatContainer:SetWindowFilterEnabled(6, 24, true)
    end

    for key, container in pairs(CHAT_SYSTEM.containers) do
        container:FadeIn()

        for tabIndex = 1, #container.windows do
            container.windows[tabIndex].buffer:ShowFadedLines()
            container.windows[tabIndex].buffer:SetLineFade(0, 0)
        end
    end

    activeWindow = 1
    systemWindow = chatContainer.windows[1]
    groupWindow = chatContainer.windows[3]
    whisperWindow = chatContainer.windows[4]
    guildWindow = chatContainer.windows[5]
    generalWindow = chatContainer.windows[6]

    ZO_PreHook(chatContainer, 'HandleTabClick', function(self, tab) activeWindow = tab.index end)
end

local ap, gold, tv, wv
local function TransferCurrenciesToBank()
    if not BN.SV.doMoveCurrencies then return end

    ap = GetCurrencyAmount(CURT_ALLIANCE_POINTS, CURRENCY_LOCATION_CHARACTER)
    gold = GetCurrencyAmount(CURT_MONEY, CURRENCY_LOCATION_CHARACTER)
    tv = GetCurrencyAmount(CURT_TELVAR_STONES, CURRENCY_LOCATION_CHARACTER)
    wv = GetCurrencyAmount(CURT_WRIT_VOUCHERS, CURRENCY_LOCATION_CHARACTER)

    if ap > 0 then
        TransferCurrency(CURT_ALLIANCE_POINTS, ap, CURRENCY_LOCATION_CHARACTER, CURRENCY_LOCATION_BANK)
        systemWindow.buffer:AddMessage(strformat('|c00BFFFBear Necessities|r |cC5C29Ehas moved|r |cFFFFFF%d|r |c00FF00Alliance Points|r', ap))
    end

    if gold > 0 then
        TransferCurrency(CURT_MONEY, gold, CURRENCY_LOCATION_CHARACTER, CURRENCY_LOCATION_BANK)
        systemWindow.buffer:AddMessage(strformat('|c00BFFFBear Necessities|r |cC5C29Ehas moved|r |cFFFFFF%d|r |cFFFF00Gold|r', gold))
    end

    if tv > 0 then
        TransferCurrency(CURT_TELVAR_STONES, tv, CURRENCY_LOCATION_CHARACTER, CURRENCY_LOCATION_BANK)
        systemWindow.buffer:AddMessage(strformat('|c00BFFFBear Necessities|r |cC5C29Ehas moved|r |cFFFFFF%d|r |c5EB9D7Tel Var Stones|r', tv))
    end

    if wv > 0 then
        TransferCurrency(CURT_WRIT_VOUCHERS, wv, CURRENCY_LOCATION_CHARACTER, CURRENCY_LOCATION_BANK)
        systemWindow.buffer:AddMessage(strformat('|c00BFFFBear Necessities|r |cC5C29Ehas moved|r |cFFFFFF%d|r |cE6C563Writ Vouchers|r', wv))
    end
end

local function IsEnchantmentEffectivenessReduced(bagId, slotIndex)
    local charges, maxCharges = GetChargeInfoForItem(bagId, slotIndex)
    return maxCharges > 0 and charges == 1
end

-- Repairs broken gear and recharges drained weapons
local function CheckEquippedGearPiece(_, bagId, slotIndex)
    if IsUnitDead('player') then return end
    if bagId ~= BAG_WORN then return end
    if not BN.SV.doAutoCheckGear then return end

    if DoesItemHaveDurability(bagId, slotIndex) and IsArmorEffectivenessReduced(bagId, slotIndex) then
        for i = 0, GetBagSize(BAG_BACKPACK) - 1 do
            if IsItemRepairKit(BAG_BACKPACK, i) then
                RepairItemWithRepairKit(bagId, slotIndex, BAG_BACKPACK, i)
                systemWindow.buffer:AddMessage(strformat('|c00BFFFBear Necessities|r |cC5C29Eused a %s to repair|r %s', GetItemLink(BAG_BACKPACK, i), GetItemLink(BAG_WORN, slotIndex)))
                break
            end
        end
    elseif IsItemChargeable(bagId, slotIndex) and IsEnchantmentEffectivenessReduced(bagId, slotIndex) then
        for i = 0, GetBagSize(BAG_BACKPACK) - 1 do
            if IsItemSoulGem(SOUL_GEM_TYPE_FILLED, BAG_BACKPACK, i) then
                ChargeItemWithSoulGem(bagId, slotIndex, BAG_BACKPACK, i)
                systemWindow.buffer:AddMessage(strformat('|c00BFFFBear Necessities|r |cC5C29Eused a %s to recharge|r %s', GetItemLink(BAG_BACKPACK, backpackSlotIndex), GetItemLink(BAG_WORN, slotIndex)))
                break
            end
        end
    end
end

local function CheckAllWornGear()
    for index, slotIndex in ipairs(equipmentSlots) do
        CheckEquippedGearPiece(_, BAG_WORN, slotIndex)
    end
end

-- Cloudrest Shade buffId = 102271
local function UpdateDeath(_, unitTag, isDead)
    if isDead then groupMembersAlive = groupMembersAlive - 1
    else groupMembersAlive = groupMembersAlive + 1 end

    GROUP_FRAGMENT:Refresh()
end

-- EVENT_GROUP_MEMBER_JOINED(eventCode, memberCharacterName, memberDisplayName, isLocalPlayer)
-- EVENT_GROUP_MEMBER_LEFT(eventCode, memberCharacterName, reason, isLocalPlayer, isLeader, memberDisplayName, actionRequiredVote)
-- EVENT_GROUP_UPDATE(eventCode)
local tag, isOnline, isDead
local function UpdateGroupFrame(_, ...)
    ZO_UnitFramesGroups:SetHidden(true)

    groupMembersAlive, groupMembersOnline = 0, 0

    for i = 1, GetGroupSize() do
        tag = GetGroupUnitTagByIndex(i)
        isOnline = IsUnitOnline(tag)
        isDead = IsUnitDead(tag)

        if isOnline then
            groupMembersOnline = groupMembersOnline + 1
            if not isDead then groupMembersAlive = groupMembersAlive + 1 end
        end
    end

    GROUP_FRAGMENT:Refresh()
end

-- Update attribute UI
local function OnPowerUpdate(_, _, _, powerType, powerValue, powerMax, powerEffectiveMax)
    if powerValue == nil then powerValue, powerMax, powerEffectiveMax = GetUnitPower('player', powerType) end

    local percentage = math.floor(powerValue / powerEffectiveMax * 100 + 0.5)

    if powerType == POWERTYPE_HEALTH then
        local shield = GetUnitAttributeVisualizerEffectInfo('player', ATTRIBUTE_VISUAL_POWER_SHIELDING, STAT_MITIGATION, ATTRIBUTE_HEALTH, POWERTYPE_HEALTH)

        if shield then
            shield = math.floor(shield / powerEffectiveMax * 100 + 0.5)

            BearNecessities_Shield:SetHidden(false)
            BearNecessities_Shield_Value:SetText(strformat('%d%%', shield))
        else BearNecessities_Shield:SetHidden(true) end

        BearNecessities_Health_Value:SetText(strformat('%d%%', percentage))
    elseif powerType == POWERTYPE_MAGICKA then BearNecessities_Magicka_Value:SetText(strformat('%d%%', percentage))
    elseif powerType == POWERTYPE_STAMINA then BearNecessities_Stamina_Value:SetText(strformat('%d%%', percentage))
    elseif powerType == POWERTYPE_MOUNT_STAMINA and IsMounted() then
        BearNecessities_MountStamina:SetHidden(false)
        BearNecessities_MountStamina_Value:SetText(strformat('%d%%', percentage))
    else BearNecessities_MountStamina:SetHidden(true) end
end

local function OnShieldUpdate()
    OnPowerUpdate(_, _, _, POWERTYPE_HEALTH)
end

-- OnPowerUpdate is called late when mounted state changes
-- so we call it earlier here for better user experience
local function OnMountChanged()
    OnPowerUpdate(_, _, _, POWERTYPE_MOUNT_STAMINA)
end

local changedHiddenGroup = false
local function OnBossChange()
    for i = 1, MAX_BOSSES do
        if DoesUnitExist('boss' .. i) then
            if isNecro and isGroupHidden then
                changedHiddenGroup = true
                isGroupHidden = false
                SetCrownCrateNPCVisible(false)
            end

            return
        end
    end

    if changedHiddenGroup then
        changedHiddenGroup = false
        isGroupHidden = true
        SetCrownCrateNPCVisible(true)
    end
end

local function OnCombatStateChanged(_, inCombat)
    if BN.SV.doHideChatInCombat and inCombat and not isTyping then CHAT_SYSTEM:Minimize()
    -- Don't open chat if autohide isn't enabled,
    -- player could've closed chat themself
    elseif BN.SV.doHideChatInCombat then CHAT_SYSTEM:Maximize() end
end

local function IsPlayerInRaidOrDungeon()
    if IsPlayerInRaid() or IsUnitInDungeon('player') then isInRaidOrDungeon = true
    else isInRaidOrDungeon = false end
end

local function OnPlayerActivated()
    SetCrownCrateNPCVisible(isGroupHidden)
    CheckAllWornGear()
    UpdateGroupFrame()
    IsPlayerInRaidOrDungeon()
end

local function RegisterEvents()
    EM:RegisterForEvent(BN.name, EVENT_OPEN_BANK, TransferCurrenciesToBank)

    EM:RegisterForEvent(BN.name, EVENT_INVENTORY_SINGLE_SLOT_UPDATE, CheckEquippedGearPiece)
    EM:RegisterForEvent(BN.name, EVENT_PLAYER_ALIVE, CheckAllWornGear)

    EM:RegisterForEvent(BN.name, EVENT_UNIT_DEATH_STATE_CHANGED, UpdateDeath)
    EM:AddFilterForEvent(BN.name, EVENT_UNIT_DEATH_STATE_CHANGED, REGISTER_FILTER_UNIT_TAG_PREFIX, 'group')
    EM:RegisterForEvent(BN.name, EVENT_GROUP_MEMBER_JOINED, UpdateGroupFrame)
    EM:RegisterForEvent(BN.name, EVENT_GROUP_MEMBER_LEFT, UpdateGroupFrame)
    EM:RegisterForEvent(BN.name, EVENT_GROUP_UPDATE, UpdateGroupFrame)

    EM:RegisterForEvent(BN.name, EVENT_POWER_UPDATE, OnPowerUpdate)
    EM:AddFilterForEvent(BN.name, EVENT_POWER_UPDATE, REGISTER_FILTER_UNIT_TAG, 'player')
    EM:RegisterForEvent(BN.name, EVENT_UNIT_ATTRIBUTE_VISUAL_ADDED, OnShieldUpdate)
    EM:AddFilterForEvent(BN.name, EVENT_UNIT_ATTRIBUTE_VISUAL_ADDED, REGISTER_FILTER_UNIT_TAG, 'player')
    EM:RegisterForEvent(BN.name, EVENT_UNIT_ATTRIBUTE_VISUAL_REMOVED, OnShieldUpdate)
    EM:AddFilterForEvent(BN.name, EVENT_UNIT_ATTRIBUTE_VISUAL_REMOVED, REGISTER_FILTER_UNIT_TAG, 'player')
    EM:RegisterForEvent(BN.name, EVENT_UNIT_ATTRIBUTE_VISUAL_UPDATED, OnShieldUpdate)
    EM:AddFilterForEvent(BN.name, EVENT_UNIT_ATTRIBUTE_VISUAL_UPDATED, REGISTER_FILTER_UNIT_TAG, 'player')
    EM:RegisterForEvent(BN.name, EVENT_MOUNTED_STATE_CHANGED, OnMountChanged)

    EM:RegisterForEvent(BN.name, EVENT_BOSSES_CHANGED, OnBossChange)

    EM:RegisterForEvent(BN.name, EVENT_PLAYER_COMBAT_STATE, OnCombatStateChanged)

    EM:RegisterForEvent(BN.name, EVENT_PLAYER_ACTIVATED, OnPlayerActivated)
end

local function RestorePositions()
    BearNecessities_FoodReminder:ClearAnchors()
    BearNecessities_FoodReminder:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, BN.SV.foodLeft, BN.SV.foodTop)

    BearNecessities_GroupFrame:ClearAnchors()
    BearNecessities_GroupFrame:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, BN.SV.groupLeft, BN.SV.groupTop)

    BearNecessities_Health:ClearAnchors()
    BearNecessities_Health:SetAnchor(TOPRIGHT, GuiRoot, TOPLEFT, BN.SV.healthRight, BN.SV.healthTop)

    BearNecessities_Magicka:ClearAnchors()
    BearNecessities_Magicka:SetAnchor(TOPRIGHT, GuiRoot, TOPLEFT, BN.SV.magickaRight, BN.SV.magickaTop)

    BearNecessities_Stamina:ClearAnchors()
    BearNecessities_Stamina:SetAnchor(TOPRIGHT, GuiRoot, TOPLEFT, BN.SV.staminaRight, BN.SV.staminaTop)
end

-- Called before BOSS_BAR:RefreshBossHealthBar, which is only executed if
-- the intercept function returns a falsey or no value.
local function InterceptBossHealthBar()
    return BN.SV.doHideBossCompassHealthBar
end

local function PositionAchievementIcons(name, parent, string)
    control = _G[name] or WM:CreateControl(name, parent, CT_LABEL)

    control:ClearAnchors()
    control:SetAnchor(LEFT, parent, LEFT, 400)
    control:SetColor(1, 1, 1, 1)
    control:SetDimensions(100, 20)
    control:SetFont('ZOFontGameLarge')
    control:SetHidden(false)
    control:SetHorizontalAlignment(0)
    control:SetText(string)
    control:SetVerticalAlignment(1)
end

-- Marks pledges, positions achievement icons and collects completed dungeon quests
local activeStepTrackerOverrideText, questType, id, achievementIcons, rawName, objectiveName
local function DungeonFinder()
    if isVeteran == 3 and headerNormal.node.open then headerNormal:OnMouseUp(true) end

    for i = 1, GetNumJournalQuests do
        _, _, _, _, activeStepTrackerOverrideText, _, _, _, _, questType = GetJournalQuestInfo(i)

        if questType == QUEST_TYPE_UNDAUNTED_PLEDGE then pledges[GetZoneId(GetJournalQuestStartingZone(i))] = 'Return' == strmatch(activeStepTrackerOverrideText, 'Return') end
    end

    for c = 2, 3 do
        container = _G['ZO_DungeonFinder_KeyboardListSectionScrollChildContainer' .. c]

        if container then
            for i = 1, container:GetNumChildren() do
                control = container:GetChild(i)
                id = control.node.data.id
                zoneId = control.node.data.zoneId

                if pledges[zoneId] == false then control.text:SetText(control.text:GetText() .. ' |c00BFFF(Pledge)|r')
                elseif pledges[zoneId] == true then control.text:SetText(control.text:GetText() .. ' |c00FF00(Completed)|r') end

                achievementIcons = IsAchievementComplete(dungeonAchievements[id].clear) and '|t20:20:/esoui/art/cadwell/check.dds|t' or '|t20:20:/esoui/art/icons/heraldrycrests_misc_blank_01.dds|t'
                achievementIcons = achievementIcons .. (IsAchievementComplete(dungeonAchievements[id].hardMode) and '|t20:20:/esoui/art/treeicons/gamepad/achievement_categoryicon_veterandungeons.dds|t' or '|t20:20:/esoui/art/icons/heraldrycrests_misc_blank_01.dds|t')
                achievementIcons = achievementIcons .. (IsAchievementComplete(dungeonAchievements[id].speed) and '|t20:20:/esoui/art/mounts/gamepad/gp_ridingskill_speed.dds|t' or '|t20:20:/esoui/art/icons/heraldrycrests_misc_blank_01.dds|t')
                achievementIcons = achievementIcons .. (IsAchievementComplete(dungeonAchievements[id].noDeath) and '|t20:20:/esoui/art/deathrecap/deathrecap_killingblow_icon.dds|t' or '|t20:20:/esoui/art/icons/heraldrycrests_misc_blank_01.dds|t')
                achievementIcons = achievementIcons .. (IsAchievementComplete(dungeonAchievements[id].triple) and '|t20:20:/esoui/art/market/keyboard/esoplus_chalice_white2_64.dds|t' or '|t20:20:/esoui/art/icons/heraldrycrests_misc_blank_01.dds|t')

                PositionAchievementIcons('BearNecessities_AchievementIcons' .. c .. i, control, achievementIcons)

                if c == 2 then
                    rawName = control.node.data.rawName

                    for index, value in ipairs(questIds) do
                        _, objectiveName = GetCompletedQuestLocationInfo(value)
                        objectiveName = objectiveName:gsub('.*:%s*', '')

                        if value == 4641 then objectiveName = objectiveName .. 'I' end
                        if objectiveName == rawName then completedQuests[zoneId] = true end
                    end
                end
            end
        end
    end
end

-- Small delay is required to ensure tables are created
local function OnDungeonFinderShownDelayed()
    zo_callLater(DungeonFinder, 100)
end

-- Reset DungeonFinder related tables
local function OnDungeonFinderHidden()
    pledges = {}
    completedQuests = {}
end

local function OnChatFocused()
    isTyping = true
end

local function OnChatFocusLost()
    isTyping = false
    OnCombatStateChanged(_, IsUnitInCombat('player'))
end

local function RefreshFoodReminder()
    FOOD_FRAGMENT:Refresh()
end

-- local layerIndex, categoryIndex, actionIndex = GetActionIndicesFromName(*string* _bindingName_)
-- CallSecureProtected('UnbindAllKeysFromAction', layerIndex, categoryIndex, actionIndex)
-- CallSecureProtected('BindKeyToAction', layerIndex, categoryIndex, actionIndex, *luaindex* _bindingIndex_, *[KeyCode|#KeyCode]* _key_, *[KeyCode|#KeyCode]* _modifier1_, *[KeyCode|#KeyCode]* _modifier2_, *[KeyCode|#KeyCode]* _modifier3_, *[KeyCode|#KeyCode]* _modifier4_)
local numTabs, newWindow, oldWindow
function BN.SwitchToNextTab()
    local activeWindow = activeWindow
    numTabs = #chatContainer.windows

    if numTabs > 1 then
        for index, window in ipairs(chatContainer.windows) do
            if activeWindow + 1 == index then
                chatContainer:HandleTabClick(window.tab)

                newWindow = chatContainer.windows[index].tab
                oldWindow = chatContainer.windows[activeWindow].tab

                newWindow:GetNamedChild('Text'):SetColor(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_SELECTED))
                newWindow.state = 1
                oldWindow:GetNamedChild('Text'):SetColor(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_CONTRAST))
                oldWindow.state = 2

                return
            end
        end

        chatContainer:HandleTabClick(chatContainer.windows[1].tab)

        newWindow = chatContainer.windows[1].tab
        oldWindow = chatContainer.windows[activeWindow].tab

        -- Repetitive, should consider making a function
        newWindow:GetNamedChild('Text'):SetColor(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_SELECTED))
        newWindow.state = 1
        oldWindow:GetNamedChild('Text'):SetColor(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_CONTRAST))
        oldWindow.state = 2
    end
end

function BN.SwitchToPreviousTab()
    local activeWindow = activeWindow
    numTabs = #chatContainer.windows

    if numTabs > 1 then
        for index, window in ipairs(chatContainer.windows) do
            if activeWindow - 1 == index then
                chatContainer:HandleTabClick(window.tab)

                newWindow = chatContainer.windows[index].tab
                oldWindow = chatContainer.windows[activeWindow].tab

                newWindow:GetNamedChild('Text'):SetColor(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_SELECTED))
                newWindow.state = 1
                oldWindow:GetNamedChild('Text'):SetColor(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_CONTRAST))
                oldWindow.state = 2

                return
            end
        end

        chatContainer:HandleTabClick(chatContainer.windows[numTabs].tab)

        newWindow = chatContainer.windows[numTabs].tab
        oldWindow = chatContainer.windows[activeWindow].tab

        -- Repetitive, should consider making a function
        newWindow:GetNamedChild('Text'):SetColor(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_SELECTED))
        newWindow.state = 1
        oldWindow:GetNamedChild('Text'):SetColor(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_CONTRAST))
        oldWindow.state = 2
    end
end

function BN.ToggleUI()
    BN.isMovable = not BN.isMovable

    if BN.isMovable then
        BearNecessities_FoodReminder:SetMouseEnabled(true)
        BearNecessities_FoodReminder:SetMovable(true)

        BearNecessities_GroupFrame:SetMouseEnabled(true)
        BearNecessities_GroupFrame:SetMovable(true)

        BearNecessities_Health:SetMouseEnabled(true)
        BearNecessities_Health:SetMovable(true)

        BearNecessities_Magicka:SetMouseEnabled(true)
        BearNecessities_Magicka:SetMovable(true)

        BearNecessities_Stamina:SetMouseEnabled(true)
        BearNecessities_Stamina:SetMovable(true)
    else
        BearNecessities_FoodReminder:SetMouseEnabled(false)
        BearNecessities_FoodReminder:SetMovable(false)

        BearNecessities_GroupFrame:SetMouseEnabled(false)
        BearNecessities_GroupFrame:SetMovable(false)

        BearNecessities_Health:SetMouseEnabled(false)
        BearNecessities_Health:SetMovable(false)

        BearNecessities_Magicka:SetMouseEnabled(false)
        BearNecessities_Magicka:SetMovable(false)

        BearNecessities_Stamina:SetMouseEnabled(false)
        BearNecessities_Stamina:SetMovable(false)
    end
end

function BN.ResetPositions()
    BN.SV.groupFrameLeft = BN.defaults.groupFrameLeft
    BN.SV.groupFrameTop = BN.defaults.groupFrameTop

    BN.SV.healthRight = BN.defaults.healthRight
    BN.SV.healthTop = BN.defaults.healthTop

    BN.SV.magickaRight = BN.defaults.magickaRight
    BN.SV.magickaTop = BN.defaults.magickaTop

    BN.SV.staminaRight = BN.defaults.staminaRight
    BN.SV.staminaTop = BN.defaults.staminaTop

    BN.SV.foodLeft = BN.defaults.foodLeft
    BN.SV.foodTop = BN.defaults.foodTop

    RestorePositions()
end

function BN.FoodOnMoveStop()
    BN.SV.foodLeft = BearNecessities_FoodReminder:GetLeft()
    BN.SV.foodTop = BearNecessities_FoodReminder:GetTop()
end

function BN.GroupFrameOnMoveStop()
    BN.SV.groupLeft = BearNecessities_GroupFrame:GetLeft()
    BN.SV.groupTop = BearNecessities_GroupFrame:GetTop()
end

function BN.HealthOnMoveStop()
    BN.SV.healthRight = BearNecessities_Health:GetRight()
    BN.SV.healthTop = BearNecessities_Health:GetTop()
end

function BN.MagickaOnMoveStop()
    BN.SV.magickaRight = BearNecessities_Magicka:GetRight()
    BN.SV.magickaTop = BearNecessities_Magicka:GetTop()
end

function BN.StaminaOnMoveStop()
    BN.SV.staminaRight = BearNecessities_Stamina:GetRight()
    BN.SV.staminaTop = BearNecessities_Stamina:GetTop()
end

local function Initialise()
    BN.SV = ZO_SavedVars:NewAccountWide(BN.svName, BN.svVersion, nil, BN.defaults)
    if not BN.SV.isAccountWide then BN.SV = ZO_SavedVars:NewCharacterIdSettings(BN.svName, BN.svVersion, nil, BN.defaults) end

    if BN.SV.doHideTargetHealthBar then UNIT_FRAMES.staticFrames['reticleover']:SetHiddenForReason('BearNecessities', true) end
    if BN.SV.isExpBarHidden then
        HUD_SCENE:RemoveFragment(PLAYER_PROGRESS_BAR_FRAGMENT)
        HUD_UI_SCENE:RemoveFragment(PLAYER_PROGRESS_BAR_FRAGMENT)
        LOOT_SCENE:RemoveFragment(PLAYER_PROGRESS_BAR_FRAGMENT)
    end
    if BN.SV.isAttributeUIEnabled then
        HUD_SCENE:RemoveFragment(PLAYER_ATTRIBUTE_BARS_FRAGMENT)
        HUD_UI_SCENE:RemoveFragment(PLAYER_ATTRIBUTE_BARS_FRAGMENT)
        LOOT_SCENE:RemoveFragment(PLAYER_ATTRIBUTE_BARS_FRAGMENT)
    end
    if BN.SV.isGroupUIEnabled then UNIT_FRAMES:DisableGroupAndRaidFrames() end

    CreateSceneFragments()
    BuildPledgeButton()
    BuildQuestButton()
    GetChatWindowTabs()
    RegisterEvents()
    RestorePositions()
    BN.BuildMenu()

    ZO_PreHook(BOSS_BAR, 'RefreshBossHealthBar', InterceptBossHealthBar)
    ZO_PreHookHandler(ZO_DungeonFinder_KeyboardListSection, 'OnEffectivelyShown', OnDungeonFinderShownDelayed)
    ZO_PreHookHandler(ZO_DungeonFinder_KeyboardListSection, 'OnEffectivelyHidden', OnDungeonFinderHidden)
    SecurePostHook('StartChatInput', OnChatFocused)
    SecurePostHook('ZO_ChatTextEntry_FocusLost', OnChatFocusLost)

    EM:RegisterForUpdate(BN.name .. 'FoodReminder', 1000, RefreshFoodReminder)

    ZO_CreateStringId('SI_BINDING_NAME_BN_SWITCH_TAB_NEXT', 'Switch To Next Tab')
    ZO_CreateStringId('SI_BINDING_NAME_BN_SWITCH_TAB_PREVIOUS', 'Switch To Previous Tab')
end

EM:RegisterForEvent(BN.name, EVENT_ADD_ON_LOADED, function(_, addonName)
    if addonName == BN.name then
        EM:UnregisterForEvent(BN.name, EVENT_ADD_ON_LOADED)
        Initialise()
    end
end)

SLASH_COMMANDS['/house'] = function() RequestJumpToHouse(GetHousingPrimaryHouse()) end
SLASH_COMMANDS['/merchant'] = function()
    if IsCollectibleUnlocked(6378) then UseCollectible(6378)
    elseif IsCollectibleUnlocked(301) then UseCollectible(301) end
end
SLASH_COMMANDS['/banker'] = function()
    if IsCollectibleUnlocked(6376) then UseCollectible(6376)
    elseif IsCollectibleUnlocked(267) then UseCollectible(267) end
end
SLASH_COMMANDS['/hidegroup'] = function()
    isGroupHidden = not isGroupHidden
    SetCrownCrateNPCVisible(isGroupHidden)
end