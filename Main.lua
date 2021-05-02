BearNecessities = {
    name = 'BearNecessities',
    version = '1.5.0',
    svName = 'BearNecessitiesSV',
    svVersion = 2,
    isUILocked = true,

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
        isChatAccountWide = false,

        chatSettings = {},
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
    [61260] = 'unistat', -- Increase Max Magicka
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

local sv = nil -- local saved variables

-- Localised functions are faster
local strformat = string.format
local strmatch = string.match

local isInRaidOrDungeon = false
local isVeteran = GetUnitEffectiveChampionPoints('player') >= 160 and 3 or 2
local isGroupHidden = false
local isNecro = GetUnitClassId('player') == 5
local dungeonHeaderNormal
local isTyping = false

-- Chat variables
local activeWindow = 1
local chatContainer, systemWindow

-- UI fragments
local foodFragment, groupFragment, healthFragment, shieldFragment, magickaFragment, staminaFragment, mountStaminaFragment

local function AddSimpleFragment(control, condition)
    local fragment = ZO_SimpleSceneFragment:New(control)

    if condition then fragment:SetConditional(condition) end

    HUD_SCENE:AddFragment(fragment)
    HUD_UI_SCENE:AddFragment(fragment)

    return fragment
end

local function CreateSceneFragments()
    local function FoodFragmentCondition()
        local result
        local foodBuffRemaining = 0

        if not (not BN.isUILocked or isInRaidOrDungeon) or not sv.isFoodReminderEnabled then result = false
        elseif not BN.isUILocked then -- UI is unlocked, show default
            BearNecessities_FoodReminder_Timer:SetText('7:38')
            result = true
        else
            local finish, abilityId
            for i = 1, GetNumBuffs('player') do
                _, _, finish, _, _, _, _, _, _, _, abilityId = GetUnitBuffInfo('player', i)

                if foodList[abilityId] then
                    foodBuffRemaining = finish - GetGameTimeSeconds()
                    break
                end
            end

            if foodBuffRemaining <= sv.foodReminderThreshold * 60 then
                if foodBuffRemaining > 0 then
                    local foodFormattedTime = ZO_FormatTime(foodBuffRemaining, TIME_FORMAT_STYLE_COLONS, TIME_FORMAT_PRECISION_SECONDS)
                    BearNecessities_FoodReminder_Timer:SetText(foodFormattedTime)
                else BearNecessities_FoodReminder_Timer:SetText('|cFF0000EXPIRED|r') end

                result = true
            end
        end

        return result
    end

    local function GroupFragmentCondition()
        local result

        if not (not BN.isUILocked or IsUnitGrouped('player')) or not sv.isGroupUIEnabled then result = false
        elseif not BN.isUILocked then -- UI is unlocked, show default
            BearNecessities_GroupFrame_Label:SetText('7/12')
            result = true
        else
            local groupMembersAlive, groupMembersOnline = 0, 0
            local unitTag, isOnline, isDead

            for i = 1, GetGroupSize() do
                unitTag = GetGroupUnitTagByIndex(i)
                isOnline = IsUnitOnline(unitTag)
                isDead = IsUnitDead(unitTag)

                if isOnline then
                    groupMembersOnline = groupMembersOnline + 1
                    if not isDead then groupMembersAlive = groupMembersAlive + 1 end
                end
            end

            ZO_UnitFramesGroups:SetHidden(true) -- Hide base game group ui. TODO: Disable base game ui
            BearNecessities_GroupFrame_Label:SetText(strformat('%d/%d', groupMembersAlive, groupMembersOnline))

            result = true
        end

        return result
    end

    local function AttributeFragmentCondition()
        local result

        -- return sv.isAttributeUIEnabled
        if not sv.isAttributeUIEnabled then result = false
        else result = true end

        return result
    end

    local function ShieldFragmentCondition()
        local result

        -- return sv.isAttributeUIEnabled and BearNecessities_Shield_Value:GetText() ~= '0%'
        if not sv.isAttributeUIEnabled or BearNecessities_Shield_Value:GetText() == '0%' then result = false
        else result = true end

        return result
    end

    local function MountStaminaFragmentCondition()
        local result

        -- return sv.isAttributeUIEnabled and IsMounted()
        if not sv.isAttributeUIEnabled or not IsMounted() then result = false
        else result = true end

        return result
    end

    foodFragment = AddSimpleFragment(BearNecessities_FoodReminder, FoodFragmentCondition)
    groupFragment = AddSimpleFragment(BearNecessities_GroupFrame, GroupFragmentCondition)
    healthFragment = AddSimpleFragment(BearNecessities_Health, AttributeFragmentCondition)
    shieldFragment = AddSimpleFragment(BearNecessities_Shield, ShieldFragmentCondition)
    magickaFragment = AddSimpleFragment(BearNecessities_Magicka, AttributeFragmentCondition)
    staminaFragment = AddSimpleFragment(BearNecessities_Stamina, AttributeFragmentCondition)
    mountStaminaFragment = AddSimpleFragment(BearNecessities_MountStamina, MountStaminaFragmentCondition)
end

local function CheckPledges()
    local container = _G['ZO_DungeonFinder_KeyboardListSectionScrollChildContainer' .. isVeteran]
    local numPressed = 0

    local control, zoneId
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
    local container = ZO_DungeonFinder_KeyboardListSectionScrollChildContainer2
    local numPressed = 0

    local control, zoneId
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
        if not dungeonHeaderNormal.node.open then dungeonHeaderNormal:OnMouseUp(true) end
        BearNecessities_CheckQuests:SetText('Uncheck Quests')
    else
        if dungeonHeaderNormal.node.open then dungeonHeaderNormal:OnMouseUp(true) end
        BearNecessities_CheckQuests:SetText('Check Quests')
    end
end

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

local function TransferCurrenciesToBank()
    if not sv.doMoveCurrencies then return end

    local ap = GetCurrencyAmount(CURT_ALLIANCE_POINTS, CURRENCY_LOCATION_CHARACTER)
    local gold = GetCurrencyAmount(CURT_MONEY, CURRENCY_LOCATION_CHARACTER)
    local tv = GetCurrencyAmount(CURT_TELVAR_STONES, CURRENCY_LOCATION_CHARACTER)
    local wv = GetCurrencyAmount(CURT_WRIT_VOUCHERS, CURRENCY_LOCATION_CHARACTER)

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
    if not sv.doAutoCheckGear or IsUnitDead('player') then return end

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
        CheckEquippedGearPiece(nil, BAG_WORN, slotIndex)
    end
end

-- Cloudrest Shade buffId = 102271
local function UpdateGroupFrame()
    groupFragment:Refresh()
end

-- Update attribute UI
local function OnPowerUpdate(_, _, _, powerType, powerValue, _, powerEffectiveMax)
    if powerValue == nil then powerValue, _, powerEffectiveMax = GetUnitPower('player', powerType) end

    local percentage = math.floor(powerValue / powerEffectiveMax * 100 + 0.5)

    if powerType == POWERTYPE_HEALTH then
        local shield = GetUnitAttributeVisualizerEffectInfo('player', ATTRIBUTE_VISUAL_POWER_SHIELDING, STAT_MITIGATION, ATTRIBUTE_HEALTH, POWERTYPE_HEALTH)
        if not shield then shield = 0 end
        shield = math.floor(shield / powerEffectiveMax * 100 + 0.5)

        BearNecessities_Shield_Value:SetText(strformat('%d%%', shield))
        shieldFragment:Refresh()
        BearNecessities_Health_Value:SetText(strformat('%d%%', percentage))
    elseif powerType == POWERTYPE_MAGICKA then BearNecessities_Magicka_Value:SetText(strformat('%d%%', percentage))
    elseif powerType == POWERTYPE_STAMINA then BearNecessities_Stamina_Value:SetText(strformat('%d%%', percentage))
    elseif powerType == POWERTYPE_MOUNT_STAMINA then
        BearNecessities_MountStamina_Value:SetText(strformat('%d%%', percentage))
        mountStaminaFragment:Refresh()
    end
end

local function OnShieldUpdate()
    OnPowerUpdate(nil, nil, nil, POWERTYPE_HEALTH)
end

-- OnPowerUpdate is called late when mounted state changes
-- so we call it asap here for better user experience
local function OnMountChanged()
    OnPowerUpdate(nil, nil, nil, POWERTYPE_MOUNT_STAMINA)
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
    if sv.doHideChatInCombat and inCombat and not isTyping then CHAT_SYSTEM:Minimize()
    -- Don't open chat if autohide isn't enabled,
    -- player could've closed chat themself
    elseif sv.doHideChatInCombat then CHAT_SYSTEM:Maximize() end
end

local function IsPlayerInRaidOrDungeon()
    if IsPlayerInRaid() or IsUnitInDungeon('player') then isInRaidOrDungeon = true
    else isInRaidOrDungeon = false end
end

local function SetChatWindowSettings()
    local sv = BearNecessitiesSV.Default[GetDisplayName()]['$AccountWide']

    if sv.isChatAccountWide then
        chatContainer.settings.point = sv.chatSettings.point
        chatContainer.settings.relPoint = sv.chatSettings.relPoint
        chatContainer.settings.x = sv.chatSettings.x
        chatContainer.settings.y = sv.chatSettings.y
        chatContainer.settings.height = sv.chatSettings.height
        chatContainer.settings.width = sv.chatSettings.width

        CHAT_SYSTEM.control:ClearAnchors()
        CHAT_SYSTEM.control:SetAnchor(chatContainer.settings.point, GuiRoot, chatContainer.settings.relPoint, chatContainer.settings.x, chatContainer.settings.y)
        CHAT_SYSTEM.control:SetDimensions(chatContainer.settings.width, chatContainer.settings.height)

        CHAT_SYSTEM:SetFontSize(sv.chatSettings.fontSize)
        SetChatFontSize(sv.chatSettings.fontSize)

        for tabIndex in ipairs(sv.chatSettings.tabs) do
            if #chatContainer.windows < tabIndex then
                chatContainer:AddWindow(sv.chatSettings.tabs[tabIndex].name)
            end

            chatContainer:SetTabName(tabIndex, sv.chatSettings.tabs[tabIndex].name)
            chatContainer:SetLocked(tabIndex, sv.chatSettings.tabs[tabIndex].isLocked)
            chatContainer:SetInteractivity(tabIndex, sv.chatSettings.tabs[tabIndex].isInteractable)
            chatContainer:SetTimestampsEnabled(tabIndex, sv.chatSettings.tabs[tabIndex].areTimestampsEnabled)

            for category = 1, GetNumChatCategories() do
                SetChatContainerTabCategoryEnabled(chatContainer.id, tabIndex, category, sv.chatSettings.tabs[tabIndex].categories[category])
            end
        end
    end
end

local function OnPlayerActivated()
    chatContainer = CHAT_SYSTEM.primaryContainer
    systemWindow = chatContainer.windows[1]

    for _, window in ipairs(chatContainer.windows) do
        window.buffer:SetMaxHistoryLines(1000)
        window.buffer:SetLineFade(0, 0)
    end

    OnBossChange()
    CheckAllWornGear()
    UpdateGroupFrame()
    IsPlayerInRaidOrDungeon()
    SetChatWindowSettings()

    -- Dungeon Finder is reset on EVENT_PLAYER_ACTIVATED, so need to reset button text as well
    BearNecessities_CheckPledges:SetText('Check Pledges')
    BearNecessities_CheckQuests:SetText('Check Quests')

    ZO_PreHook(chatContainer, 'HandleTabClick', function(_, tab) activeWindow = tab.index end)
end

local function RegisterEvents()
    EM:RegisterForEvent(BN.name, EVENT_OPEN_BANK, TransferCurrenciesToBank)

    EM:RegisterForEvent(BN.name, EVENT_INVENTORY_SINGLE_SLOT_UPDATE, CheckEquippedGearPiece)
    EM:AddFilterForEvent(BN.name, EVENT_INVENTORY_SINGLE_SLOT_UPDATE, REGISTER_FILTER_BAG_ID, BAG_WORN)
    EM:RegisterForEvent(BN.name, EVENT_PLAYER_ALIVE, CheckAllWornGear)

    EM:RegisterForEvent(BN.name, EVENT_UNIT_DEATH_STATE_CHANGED, UpdateGroupFrame)
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
    BearNecessities_FoodReminder:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, sv.foodLeft, sv.foodTop)

    BearNecessities_GroupFrame:ClearAnchors()
    BearNecessities_GroupFrame:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, sv.groupLeft, sv.groupTop)

    BearNecessities_Health:ClearAnchors()
    BearNecessities_Health:SetAnchor(TOPRIGHT, GuiRoot, TOPLEFT, sv.healthRight, sv.healthTop)

    BearNecessities_Magicka:ClearAnchors()
    BearNecessities_Magicka:SetAnchor(TOPRIGHT, GuiRoot, TOPLEFT, sv.magickaRight, sv.magickaTop)

    BearNecessities_Stamina:ClearAnchors()
    BearNecessities_Stamina:SetAnchor(TOPRIGHT, GuiRoot, TOPLEFT, sv.staminaRight, sv.staminaTop)
end

-- Called before BOSS_BAR:RefreshBossHealthBar, which is only executed if
-- the intercept function returns a falsey or no value.
local function InterceptBossHealthBar()
    return sv.doHideBossCompassHealthBar
end

local function GetChatWindowSettings()
    local sv = BearNecessitiesSV.Default[GetDisplayName()]['$AccountWide']

    if sv.isChatAccountWide then
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

            sv.chatSettings.tabs[tabIndex].categories = {}
            for category = 1, GetNumChatCategories() do
                sv.chatSettings.tabs[tabIndex].categories[category] = IsChatContainerTabCategoryEnabled(chatContainer.id, tabIndex, category)
            end
        end
    end
end

local function PositionAchievementIcons(name, parent, string)
    local control = _G[name] or WM:CreateControl(name, parent, CT_LABEL)

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
local function DungeonFinder()
    dungeonHeaderNormal = ZO_DungeonFinder_KeyboardListSectionScrollChildZO_ActivityFinderTemplateNavigationHeader_Keyboard1
    if isVeteran == 3 and dungeonHeaderNormal.node.open then dungeonHeaderNormal:OnMouseUp(true) end

    local activeStepTrackerOverrideText, questType
    for i = 1, GetNumJournalQuests() do
        _, _, _, _, activeStepTrackerOverrideText, _, _, _, _, questType = GetJournalQuestInfo(i)
        if questType == QUEST_TYPE_UNDAUNTED_PLEDGE then pledges[GetZoneId(GetJournalQuestStartingZone(i))] = 'Return' == strmatch(activeStepTrackerOverrideText, 'Return') end
    end

    local container
    for c = 2, 3 do
        container = _G['ZO_DungeonFinder_KeyboardListSectionScrollChildContainer' .. c]

        if container then
            local control, id, zoneId, achievementIcons
            for i = 1, container:GetNumChildren() do
                control = container:GetChild(i)
                id = control.node.data.id
                zoneId = control.node.data.zoneId

                if pledges[zoneId] == false then control.text:SetText(control.text:GetText() .. ' |c00BFFF(Pledge)|r')
                elseif pledges[zoneId] == true then control.text:SetText(control.text:GetText() .. ' |c00FF00(Completed)|r') end

                if dungeonAchievements[id] then
                    achievementIcons = IsAchievementComplete(dungeonAchievements[id].clear) and '|t20:20:/esoui/art/cadwell/check.dds|t' or '|t20:20:/esoui/art/icons/heraldrycrests_misc_blank_01.dds|t'
                    achievementIcons = achievementIcons .. (IsAchievementComplete(dungeonAchievements[id].hardMode) and '|t20:20:/esoui/art/treeicons/gamepad/achievement_categoryicon_veterandungeons.dds|t' or '|t20:20:/esoui/art/icons/heraldrycrests_misc_blank_01.dds|t')
                    achievementIcons = achievementIcons .. (IsAchievementComplete(dungeonAchievements[id].speed) and '|t20:20:/esoui/art/mounts/gamepad/gp_ridingskill_speed.dds|t' or '|t20:20:/esoui/art/icons/heraldrycrests_misc_blank_01.dds|t')
                    achievementIcons = achievementIcons .. (IsAchievementComplete(dungeonAchievements[id].noDeath) and '|t20:20:/esoui/art/deathrecap/deathrecap_killingblow_icon.dds|t' or '|t20:20:/esoui/art/icons/heraldrycrests_misc_blank_01.dds|t')
                    achievementIcons = achievementIcons .. (IsAchievementComplete(dungeonAchievements[id].triple) and '|t20:20:/esoui/art/market/keyboard/esoplus_chalice_white2_64.dds|t' or '|t20:20:/esoui/art/icons/heraldrycrests_misc_blank_01.dds|t')
                end

                PositionAchievementIcons('BearNecessities_AchievementIcons' .. c .. i, control, achievementIcons)

                if c == 2 then
                    local rawName = control.node.data.rawName
                    local objectiveName

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

local function OnChatFocused()
    isTyping = true
end

local function OnChatFocusLost()
    isTyping = false
    local inCombat = IsUnitInCombat('player')
    OnCombatStateChanged(_, inCombat)
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

local function OnGroupListShown(self, control, data)
    if ZO_ShouldPreferUserId() then control.characterNameLabel:SetText(zo_strformat(SI_GROUP_LIST_PANEL_CHARACTER_NAME, data.index, data.displayName)) end
end

local function OnLeaderboardListShown(self, control, data)
    if ZO_ShouldPreferUserId() then control.nameLabel:SetText(data.displayName) end
end

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

        return true
    end

    return false
end

local function RefreshFoodReminder()
    foodFragment:Refresh()
end

-- local layerIndex, categoryIndex, actionIndex = GetActionIndicesFromName(*string* _bindingName_)
-- CallSecureProtected('UnbindAllKeysFromAction', layerIndex, categoryIndex, actionIndex)
-- CallSecureProtected('BindKeyToAction', layerIndex, categoryIndex, actionIndex, *luaindex* _bindingIndex_, *[KeyCode|#KeyCode]* _key_, *[KeyCode|#KeyCode]* _modifier1_, *[KeyCode|#KeyCode]* _modifier2_, *[KeyCode|#KeyCode]* _modifier3_, *[KeyCode|#KeyCode]* _modifier4_)
function BN.SwitchToNextTab()
    local activeWindow = activeWindow
    local numTabs = #chatContainer.windows

    if numTabs > 1 then
        local newWindow, oldWindow
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
    local numTabs = #chatContainer.windows

    if numTabs > 1 then
        local newWindow, oldWindow
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

function BN.RemoveFragment(fragment)
    HUD_SCENE:RemoveFragment(fragment)
    HUD_UI_SCENE:RemoveFragment(fragment)
    LOOT_SCENE:RemoveFragment(fragment)
end

function BN.AddFragment(fragment)
    HUD_SCENE:AddFragment(fragment)
    HUD_UI_SCENE:AddFragment(fragment)
    LOOT_SCENE:AddFragment(fragment)
end

function BN.ToggleUI()
    BN.isUILocked = not BN.isUILocked

    if not BN.isUILocked then
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

function BN.ResetUIPositions()
    sv.foodLeft = BN.defaults.foodLeft
    sv.foodTop = BN.defaults.foodTop

    sv.groupFrameLeft = BN.defaults.groupFrameLeft
    sv.groupFrameTop = BN.defaults.groupFrameTop

    sv.healthRight = BN.defaults.healthRight
    sv.healthTop = BN.defaults.healthTop

    sv.magickaRight = BN.defaults.magickaRight
    sv.magickaTop = BN.defaults.magickaTop

    sv.staminaRight = BN.defaults.staminaRight
    sv.staminaTop = BN.defaults.staminaTop

    RestorePositions()
end

function BN.FoodOnMoveStop()
    sv.foodLeft = BearNecessities_FoodReminder:GetLeft()
    sv.foodTop = BearNecessities_FoodReminder:GetTop()
end

function BN.GroupFrameOnMoveStop()
    sv.groupLeft = BearNecessities_GroupFrame:GetLeft()
    sv.groupTop = BearNecessities_GroupFrame:GetTop()
end

function BN.HealthOnMoveStop()
    sv.healthRight = BearNecessities_Health:GetRight()
    sv.healthTop = BearNecessities_Health:GetTop()
end

function BN.MagickaOnMoveStop()
    sv.magickaRight = BearNecessities_Magicka:GetRight()
    sv.magickaTop = BearNecessities_Magicka:GetTop()
end

function BN.StaminaOnMoveStop()
    sv.staminaRight = BearNecessities_Stamina:GetRight()
    sv.staminaTop = BearNecessities_Stamina:GetTop()
end

local function Initialise()
    BN.sv = ZO_SavedVars:NewAccountWide(BN.svName, BN.svVersion, nil, BN.defaults)
    if not BN.sv.isAccountWide then BN.sv = ZO_SavedVars:NewCharacterIdSettings(BN.svName, BN.svVersion, nil, BN.defaults) end
    sv = BN.sv

    if sv.doHideTargetHealthBar then UNIT_FRAMES.staticFrames['reticleover']:SetHiddenForReason('BearNecessities', true) end
    if sv.isExpBarHidden then BN.RemoveFragment(PLAYER_PROGRESS_BAR_FRAGMENT) end
    if sv.isAttributeUIEnabled then BN.RemoveFragment(PLAYER_ATTRIBUTE_BARS_FRAGMENT) end
    if sv.isGroupUIEnabled then UNIT_FRAMES:DisableGroupAndRaidFrames() end

    CreateSceneFragments()
    BuildPledgeButton()
    BuildQuestButton()
    RegisterEvents()
    RestorePositions()
    BN.BuildMenu()

    ZO_PreHook(BOSS_BAR, 'RefreshBossHealthBar', InterceptBossHealthBar)
    -- Not exactly a clean way/time to gather chat settings but working with the chat is a pain and this is easy
    ZO_PreHook('ReloadUI', GetChatWindowSettings)
    ZO_PreHook('Logout', GetChatWindowSettings)
    ZO_PreHook('Quit', GetChatWindowSettings)
    ZO_PostHook('StartChatInput', OnChatFocused)
    ZO_PostHook('ZO_ChatTextEntry_FocusLost', OnChatFocusLost)
    ZO_PreHookHandler(ZO_DungeonFinder_KeyboardListSection, 'OnEffectivelyShown', OnDungeonFinderShownDelayed)
    ZO_PreHookHandler(ZO_DungeonFinder_KeyboardListSection, 'OnEffectivelyHidden', OnDungeonFinderHidden)
    ZO_PostHook(GROUP_LIST, 'SetupGroupEntry', OnGroupListShown)
    ZO_PostHook(ZO_LeaderboardsManager_Shared, 'SetupLeaderboardPlayerEntry', OnLeaderboardListShown)
    ZO_PreHook(ZO_SocialListKeyboard, 'CharacterName_OnMouseEnter', OnSocialListMouseEnter)

    EM:RegisterForUpdate(BN.name .. 'FoodReminder', 1000, RefreshFoodReminder)

    ZO_CreateStringId('SI_BINDING_NAME_BN_SWITCH_TAB_NEXT', 'Switch To Next Tab')
    ZO_CreateStringId('SI_BINDING_NAME_BN_SWITCH_TAB_PREVIOUS', 'Switch To Previous Tab')
end

local function OnAddonLoaded(_, addonName)
    if addonName == BN.name then
        EM:UnregisterForEvent(BN.name, EVENT_ADD_ON_LOADED)
        Initialise()
    end
end

EM:RegisterForEvent(BN.name, EVENT_ADD_ON_LOADED, OnAddonLoaded)

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