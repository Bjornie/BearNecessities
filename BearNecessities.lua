BearNecessities = {
    name = "BearNecessities",
    version = "1.0.0",
    svName = "BearNecessitiesSV",
    svVersion = 1,

    Default = {
        isAccountWide = true,
        isFoodEnabled = true,
        foodReminderInterval = 30,
        foodReminderThreshold = 600,
        doHideBossCompassHealthBar = false,
    },
}

local EquipmentSlots =
{
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

local FoodList = {
    [61255] = "bistat", -- Increase Max Health & Stamina
    [84720] = "unique", -- Ghastly Eye Bowl
    [86673] = "unique", -- Lava Foot Soup-And-Saltrice
    [107748] = "unique", -- Artaeum Pickled Fish Bowl
    [107789] = "unique", -- Artaeum Takeaway Broth
    [127596] = "unique", -- Bewitched Sugar Skulls
}

local DungeonAchievements = {
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

local Pledges = {}

local BN = BearNecessities

local isInRaidOrDungeon = false

local noFood = true
local buffFoodRemaining
local foodFormattedTime

-- Checks pledges in Dungeon Finder
local function CheckPledges()
    -- Ineffecient locales
    local isVeteran = GetPlayerChampionPointsEarned() >= 160 and 3 or 2
    local container = _G["ZO_DungeonFinder_KeyboardListSectionScrollChildContainer" .. isVeteran]

    for i = 1, container:GetNumChildren() do
        local control = container:GetChild(i)

        if Pledges[control.node.data.rawName] == false and control.check:GetState() == 0 then
            control.check:SetState(BSTATE_PRESSED, true)
            ZO_ACTIVITY_FINDER_ROOT_MANAGER:ToggleLocationSelected(control.node.data)
        elseif Pledges[control.node.data.rawName] == false and control.check:GetState() == 1 then
            control.check:SetState(BSTATE_NORMAL, true)
            ZO_ACTIVITY_FINDER_ROOT_MANAGER:ToggleLocationSelected(control.node.data)
        end
    end
end

-- Creates 'Un-/Check Pledges' button
local function BuildPledgeButton()
    BN_CheckPledges:SetWidth(200)
    BN_CheckPledges:SetHeight(28)
    BN_CheckPledges:SetText("Un-/Check Pledges")
    BN_CheckPledges:ClearAnchors()
    BN_CheckPledges:SetAnchor(BOTTOM, ZO_SearchingForGroup, BOTTOM, 0, -76)
    BN_CheckPledges:SetClickSound("Click")
    BN_CheckPledges:SetHandler("OnClicked", CheckPledges)
end

-- Positions completed achievements icons next to dungeon names in Dungeon Finder
local function PositionAchievementIcons(name, parent, string)
    local control = _G[name] or WINDOW_MANAGER:CreateControl(name, parent, CT_LABEL)

    control:ClearAnchors()
    control:SetAnchor(LEFT, parent, LEFT, 450)
    control:SetColor(1, 1, 1, 1)
    control:SetDimensions(80, 20)
    control:SetFont("ZOFontGameLarge")
    control:SetHidden(false)
    control:SetHorizontalAlignment(0)
    control:SetText(string)
    control:SetVerticalAlignment(1)
end

-- Retrieves pledge quests and checks completed dungeon achievements
local function DungeonFinder()
    local isVeteran = GetPlayerChampionPointsEarned() >= 160 and 3 or 2
    local headerNormal = _G["ZO_DungeonFinder_KeyboardListSectionScrollChildZO_ActivityFinderTemplateNavigationHeader_Keyboard1"]
    local container
    local control
    local id
    local achievementIcons

    if isVeteran == 3 and headerNormal.text:GetColor() == 1 then headerNormal:OnMouseUp(true) end

    for i = 1, GetNumJournalQuests() do
        local questName, _, _, _, _, completed, _, _, _, questType = GetJournalQuestInfo(i)

        if questType == QUEST_TYPE_UNDAUNTED_PLEDGE then
            questName = questName:gsub(".*:%s*", "")
            Pledges[questName] = completed
        end
    end

    for c = 2, 3 do
        container = _G["ZO_DungeonFinder_KeyboardListSectionScrollChildContainer" .. c]

        for i = 1, container:GetNumChildren() do
            control = container:GetChild(i)
            id = control.node.data.id

            if Pledges[control.node.data.rawName] == false then control.text:SetText(control.text:GetText() .. " |c00BFFF(Pledge)|r")
            elseif Pledges[control.node.data.rawName] == true then control.text:SetText(control.text:GetText() .. " |c00FF00(Completed)|r") end

            achievementIcons = IsAchievementComplete(DungeonAchievements[id].clear) and "|t20:20:/esoui/art/cadwell/check.dds|t" or "|t20:20:/esoui/art/icons/heraldrycrests_misc_blank_01.dds|t"
            achievementIcons = achievementIcons .. (IsAchievementComplete(DungeonAchievements[id].hardMode) and "|t20:20:/esoui/art/treeicons/gamepad/achievement_categoryicon_veterandungeons.dds|t" or "|t20:20:/esoui/art/icons/heraldrycrests_misc_blank_01.dds:|t")
            achievementIcons = achievementIcons .. (IsAchievementComplete(DungeonAchievements[id].speed) and "|t20:20:/esoui/art/mounts/gamepad/gp_ridingskill_speed.dds|t" or "|t20:20:/esoui/art/icons/heraldrycrests_misc_blank_01.dds|t")
            achievementIcons = achievementIcons .. (IsAchievementComplete(DungeonAchievements[id].noDeath) and "|t20:20:/esoui/art/deathrecap/deathrecap_killingblow_icon.dds|t" or "|t20:20:/esoui/art/icons/heraldrycrests_misc_blank_01.dds|t")
            achievementIcons = achievementIcons .. (IsAchievementComplete(DungeonAchievements[id].triple) and "|t20:20:/esoui/art/market/keyboard/esoplus_chalice_white2_64.dds|t" or "|t20:20:/esoui/art/icons/heraldrycrests_misc_blank_01.dds|t")

            PositionAchievementIcons("BN_AchievementIcons" .. c .. i, control, achievementIcons)
        end
    end
end

function BN.FoodReminder()
    if not isInRaidOrDungeon then return end

    noFood = true

    for i = 1, GetNumBuffs("player") do
        local _, _, finish, _, _, _, _, _, _, _, abilityId = GetUnitBuffInfo("player", i)

        if FoodList[abilityId] then
            noFood = false
            buffFoodRemaining = finish - GetGameTimeSeconds()
            foodFormattedTime = ZO_FormatTime(buffFoodRemaining, TIME_FORMAT_STYLE_COLONS, TIME_FORMAT_PRECISION_SECONDS)

            if buffFoodRemaining <= BN.SavedVariables.foodReminderThreshold * 60 then d("|c00BFFFYour food buff is expiring in: |r" .. foodFormattedTime) end
        end
    end

    if noFood then d("|cFF0000You have no food buff!|r") end
end

local function IsPlayerInRaidOrDungeon()
    if IsPlayerInRaid() or IsUnitInDungeon("player") then isInRaidOrDungeon = true
    else isInRaidOrDungeon = false end

    -- Shouldn't be here, but I'm lazy
    ZO_AlertTextNotification:SetHidden(true)
end

-- Moves all character currencies to bank
local function TransferCurrenciesToBank()
    local ap = GetCurrencyAmount(CURT_ALLIANCE_POINTS, CURRENCY_LOCATION_CHARACTER)
    local gold = GetCurrencyAmount(CURT_MONEY, CURRENCY_LOCATION_CHARACTER)
    local tv = GetCurrencyAmount(CURT_TELVAR_STONES, CURRENCY_LOCATION_CHARACTER)
    local wv = GetCurrencyAmount(CURT_WRIT_VOUCHERS, CURRENCY_LOCATION_CHARACTER)

    if ap > 0 then
        TransferCurrency(CURT_ALLIANCE_POINTS, ap, CURRENCY_LOCATION_CHARACTER, CURRENCY_LOCATION_BANK)
        d("|c00BFFFBear Necessities|r |cC5C29Ehas moved|r |cFFFFFF" .. ap .. "|r |c00FF00Alliance Points|r")
    end

    if gold > 0 then
        TransferCurrency(CURT_MONEY, gold, CURRENCY_LOCATION_CHARACTER, CURRENCY_LOCATION_BANK)
        d("|c00BFFFBear Necessities|r |cC5C29Ehas moved|r |cFFFFFF" .. gold .. "|r |cFFFF00Gold|r")
    end

    if tv > 0 then
        TransferCurrency(CURT_TELVAR_STONES, tv, CURRENCY_LOCATION_CHARACTER, CURRENCY_LOCATION_BANK)
        d("|c00BFFFBear Necessities|r |cC5C29Ehas moved|r |cFFFFFF" .. tv .. "|r |c5EB9D7Tel Var Stones|r")
    end

    if wv > 0 then
        TransferCurrency(CURT_WRIT_VOUCHERS, wv, CURRENCY_LOCATION_CHARACTER, CURRENCY_LOCATION_BANK)
        d("|c00BFFFBear Necessities|r |cC5C29Ehas moved|r |cFFFFFF" .. wv .. "|r |cE6C563Writ Vouchers|r")
    end
end

local function IsEnchantmentEffectivenessReduced(bagId, slotIndex)
    local currentCharges, maxCharges = GetChargeInfoForItem(bagId, slotIndex)

    return maxCharges > 0 and currentCharges == 0
end

local function CheckEquippedGearPiece(_, bagId, slotIndex)
    if bagId ~= BAG_WORN then return end

    if DoesItemHaveDurability(bagId, slotIndex) and IsArmorEffectivenessReduced(bagId, slotIndex) then
        local backpackSlotIndex = ZO_GetNextBagSlotIndex(BAG_BACKPACK)

        while backpackSlotIndex do
            if IsItemRepairKit(BAG_BACKPACK, backpackSlotIndex) then
                RepairItemWithRepairKit(bagId, slotIndex, BAG_BACKPACK, backpackSlotIndex)
                d("|c00BFFFBear Necessities|r |cC5C29Eused a " .. GetItemLink(BAG_BACKPACK, backpackSlotIndex) .. " to repair|r " .. GetItemLink(BAG_WORN, slotIndex))
                break
            end

            backpackSlotIndex = ZO_GetNextBagSlotIndex(BAG_BACKPACK, backpackSlotIndex)
        end
    elseif IsItemChargeable(bagId, slotIndex) and IsEnchantmentEffectivenessReduced(bagId, slotIndex) then
        local backpackSlotIndex = ZO_GetNextBagSlotIndex(BAG_BACKPACK)

        while backpackSlotIndex do
            if IsItemSoulGem(SOUL_GEM_TYPE_FILLED, BAG_BACKPACK, backpackSlotIndex) then
                ChargeItemWithSoulGem(bagId, slotIndex, BAG_BACKPACK, backpackSlotIndex)
                break
            end

            backpackSlotIndex = ZO_GetNextBagSlotIndex(BAG_BACKPACK, backpackSlotIndex)
        end
    end
end

local function CheckAllWornGear()
    for _, slotIndex in ipairs(EquipmentSlots) do
        CheckEquippedGearPiece(_, BAG_WORN, slotIndex)
    end
end

local function Initialise()
    BN.SavedVariables = ZO_SavedVars:NewAccountWide(BN.svName, BN.svVersion, nil, BN.Default)

    if not BN.SavedVariables.isAccountWide then
        BN.SavedVariables = ZO_SavedVars:NewCharacterIdSettings(BN.svName, BN.svVersion, nil, BN.Default)
    end

    BOSS_BAR.RefreshBossHealthBar = function(self, smoothAnimate)
        if BN.SavedVariables.doHideBossCompassHealthBar then return end

        local totalHealth = 0
        local totalMaxHealth = 0

        for unitTag, bossEntry in pairs(self.bossHealthValues) do
            totalHealth = totalHealth + bossEntry.health
            totalMaxHealth = totalMaxHealth + bossEntry.maxHealth
        end

        local halfHealth = zo_floor(totalHealth / 2)
        local halfMax = zo_max(zo_floor(totalMaxHealth / 2), 1)

        for i = 1, #self.bars do
            ZO_StatusBar_SmoothTransition(self.bars[i], halfHealth, halfMax, not smoothAnimate)
        end

        self.healthText:SetText(ZO_FormatResourceBarCurrentAndMax(totalHealth, totalMaxHealth))

        COMPASS_FRAME:SetBossBarActive(totalHealth > 0)
    end

    WINDOW_MANAGER:CreateControlFromVirtual("BN_CheckPledges", ZO_DungeonFinder_Keyboard, "ZO_DefaultButton")

    BuildPledgeButton()
    ZO_PreHookHandler(ZO_DungeonFinder_KeyboardListSection, "OnEffectivelyShown", function()
        zo_callLater(DungeonFinder, 100)
        ZO_SearchingForGroupStatus:ClearAnchors()
        ZO_SearchingForGroupStatus:SetAnchor(BOTTOM, ZO_SearchingForGroup, BOTTOM, 0, -112)
    end)

    ZO_PreHookHandler(ZO_DungeonFinder_KeyboardListSection, "OnEffectivelyHidden", function()
        Pledges = {}
        ZO_SearchingForGroupStatus:ClearAnchors()
        ZO_SearchingForGroupStatus:SetAnchor(BOTTOM, ZO_SearchingForGroupEstimatedTime, TOP)
    end)

    BN.BuildMenu()

    if BN.SavedVariables.isFoodEnabled then EVENT_MANAGER:RegisterForUpdate(BN.name .. "FoodReminder", BN.SavedVariables.foodReminderInterval * 1000, BN.FoodReminder) end

    EVENT_MANAGER:RegisterForEvent(BN.name .. "IsPlayerInRaidOrDungeon", EVENT_PLAYER_ACTIVATED, IsPlayerInRaidOrDungeon)
    EVENT_MANAGER:RegisterForEvent(BN.name .. "TransferGold", EVENT_OPEN_BANK, TransferCurrenciesToBank)
    EVENT_MANAGER:RegisterForEvent(BN.name .. "CheckEquippedGearPiece", EVENT_INVENTORY_SINGLE_SLOT_UPDATE, CheckEquippedGearPiece)
    EVENT_MANAGER:RegisterForEvent(BN.name .. "CheckAllWornGear", EVENT_PLAYER_ACTIVATED, CheckAllWornGear)
end

SLASH_COMMANDS["/house"] = function()
    RequestJumpToHouse(GetHousingPrimaryHouse())
end

SLASH_COMMANDS["/merchant"] = function()
    if IsCollectibleUnlocked(301) then UseCollectible(301)
    elseif IsCollectibleUnlocked(6378) then UseCollectible(6378) end
end

SLASH_COMMANDS["/banker"] = function()
    if IsCollectibleUnlocked(267) then UseCollectible(267)
    elseif IsCollectibleUnlocked(6376) then UseCollectible(6376) end
end

EVENT_MANAGER:RegisterForEvent(BN.name, EVENT_ADD_ON_LOADED, function(_, addonName)
    if addonName == BN.name then
        EVENT_MANAGER:UnregisterForEvent(BN.name, EVENT_ADD_ON_LOADED)
        Initialise()
    end
end)