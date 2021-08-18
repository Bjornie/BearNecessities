BearNecessities = {
    name = 'BearNecessities',
    version = '2.0.1',
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
        shieldColour = {1, 0.6, 0, 1},
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
        isGameSettingsAccountWide = false,

        chatSettings = {},
        gameSettings = {},
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

local BN = BearNecessities
local EM = GetEventManager()

local sv -- local saved variables

-- Localised functions are faster
local strformat = string.format

local checkFood = false
local isGroupHidden = false
local isNecro = GetUnitClassId('player') == 5
local isTyping = false

-- Chat variables
local activeWindow = 1
local chatContainer, systemWindow
local lootLog, lootLogWindow

-- UI fragments
local foodFragment, groupFragment, healthFragment, shieldFragment, magickaFragment, staminaFragment, mountStaminaFragment

local fragment
local function AddSimpleFragment(control, condition)
    fragment = ZO_SimpleSceneFragment:New(control)

    if condition then fragment:SetConditional(condition) end

    HUD_SCENE:AddFragment(fragment)
    HUD_UI_SCENE:AddFragment(fragment)

    return fragment
end

local function CreateSceneFragments()
    local foodBuffRemaining = 0
    local finish, abilityId, foodFormattedTime
    local function FoodFragmentCondition()
        local result

        if not (not BN.isUILocked or checkFood) or not sv.isFoodReminderEnabled then result = false
        elseif not BN.isUILocked then -- UI is unlocked, show default
            BearNecessities_FoodReminder_Timer:SetText('7:38')
            result = true
        else
            for i = 1, GetNumBuffs('player') do
                _, _, finish, _, _, _, _, _, _, _, abilityId = GetUnitBuffInfo('player', i)

                if foodList[abilityId] then
                    foodBuffRemaining = finish - GetGameTimeSeconds()
                    break
                end
            end

            if foodBuffRemaining <= sv.foodReminderThreshold * 60 then
                if foodBuffRemaining > 0 then
                    foodFormattedTime = ZO_FormatTime(foodBuffRemaining, TIME_FORMAT_STYLE_COLONS, TIME_FORMAT_PRECISION_SECONDS)
                    BearNecessities_FoodReminder_Timer:SetText(foodFormattedTime)
                else BearNecessities_FoodReminder_Timer:SetText('|cFF0000EXPIRED|r') end

                result = true
            end
        end

        return result
    end

    local groupMembersOnline, groupMembersAlive
    local unitTag, isOnline, isDead
    local function GroupFragmentCondition()
        local result
        groupMembersOnline, groupMembersAlive = 0, 0

        if not (not BN.isUILocked or IsUnitGrouped('player')) or not sv.isGroupUIEnabled then result = false
        elseif not BN.isUILocked then -- UI is unlocked, show default
            BearNecessities_GroupFrame_Label:SetText('7/12')
            result = true
        else
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

local ap, gold, tv, wv
local function TransferCurrenciesToBank()
    if not sv.doMoveCurrencies then return end

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

local charges, maxCharges
local function IsEnchantmentEffectivenessReduced(bagId, slotIndex)
    charges, maxCharges = GetChargeInfoForItem(bagId, slotIndex)
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

local percentage, shield
-- Update attribute UI
local function OnPowerUpdate(_, _, _, powerType, powerValue, _, powerEffectiveMax)
    if powerValue == nil then powerValue, _, powerEffectiveMax = GetUnitPower('player', powerType) end

    percentage = math.floor(powerValue / powerEffectiveMax * 100 + 0.5)

    if powerType == POWERTYPE_HEALTH then
        shield = GetUnitAttributeVisualizerEffectInfo('player', ATTRIBUTE_VISUAL_POWER_SHIELDING, STAT_MITIGATION, ATTRIBUTE_HEALTH, POWERTYPE_HEALTH)
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
local function OnCombatStateChanged(_, inCombat)
    if inCombat then
        if sv.doHideChatInCombat and not isTyping then CHAT_SYSTEM:Minimize() end
        if isNecro and isGroupHidden and DoesUnitExist('boss1') then
            changedHiddenGroup = true
            isGroupHidden = false
            SetCrownCrateNPCVisible(false)
        end
    else
        if sv.doHideChatInCombat then CHAT_SYSTEM:Maximize() end
        if changedHiddenGroup then
            changedHiddenGroup = false
            isGroupHidden = true
            SetCrownCrateNPCVisible(true)
        end
    end
end

local function OnPlayerActivated(eventCode, initial)
    BN.CallbackManager:FireCallbacks('PlayerActivated', initial)

    chatContainer = CHAT_SYSTEM.primaryContainer
    systemWindow = chatContainer.windows[1]

    for index, window in ipairs(chatContainer.windows) do
        window.buffer:SetMaxHistoryLines(1000)
        window.buffer:SetLineFade(0, 0)

        if chatContainer:GetTabName(index):find('Loot Log', nil, true) then lootLogWindow = window end
    end

    if GetCurrentZoneDungeonDifficulty() ~= 0 then checkFood = true
    else checkFood = false end

    SetCrownCrateNPCVisible(isGroupHidden)
    CheckAllWornGear()
    UpdateGroupFrame()

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

local function InterceptLootLogMessage(text)
	lootLogWindow.buffer:AddMessage(string.format("|H0:lootlog|h[%s]|h %s", lootLog.title, text), 1, 1, 0)

    return true
end

-- Called before BOSS_BAR:RefreshBossHealthBar, which is only executed if
-- the intercept function returns a falsey or no value.
local function InterceptBossHealthBar()
    return sv.doHideBossCompassHealthBar
end

local function OnChatFocused()
    isTyping = true
end

local inCombat
local function OnChatFocusLost()
    isTyping = false
    inCombat = IsUnitInCombat('player')
    OnCombatStateChanged(_, inCombat)
end

local function RefreshFoodReminder()
    foodFragment:Refresh()
end

local contrastColourR, contrastColourG, contrastColourB, contrastColourA
local selectedColourR, selectedColourG, selectedColourB, selectedColourA
local function FocusNewChatTab(oldWindow, newWindow)
    contrastColourR, contrastColourG, contrastColourB, contrastColourA = GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_CONTRAST)
    selectedColourR, selectedColourG, selectedColourB, selectedColourA = GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_SELECTED)

    oldWindow:GetNamedChild('Text'):SetColor(contrastColourR, contrastColourG, contrastColourB, contrastColourA)
    oldWindow.state = 2
    newWindow:GetNamedChild('Text'):SetColor(selectedColourR, selectedColourG, selectedColourB, selectedColourA)
    newWindow.state = 1
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

                oldWindow = chatContainer.windows[activeWindow].tab
                newWindow = chatContainer.windows[index].tab

                FocusNewChatTab(oldWindow, newWindow)
                return
            end
        end

        chatContainer:HandleTabClick(chatContainer.windows[1].tab)

        oldWindow = chatContainer.windows[activeWindow].tab
        newWindow = chatContainer.windows[1].tab

        FocusNewChatTab(oldWindow, newWindow)
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

                oldWindow = chatContainer.windows[activeWindow].tab
                newWindow = chatContainer.windows[index].tab

                FocusNewChatTab(oldWindow, newWindow)
                return
            end
        end

        chatContainer:HandleTabClick(chatContainer.windows[numTabs].tab)

        oldWindow = chatContainer.windows[activeWindow].tab
        newWindow = chatContainer.windows[numTabs].tab

        FocusNewChatTab(oldWindow, newWindow)
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

function BN.SummonMerchant()
    if IsCollectibleUnlocked(8995) then UseCollectible(8995) -- Peddler of Prizes
    elseif IsCollectibleUnlocked(6378) then UseCollectible(6378) -- Fezez
    elseif IsCollectibleUnlocked(301) then UseCollectible(301) end -- Nuzhimeh
end

function BN.SummonBanker()
    if IsCollectibleUnlocked(8994) then UseCollectible(8994) -- Baron Jangleplume
    elseif IsCollectibleUnlocked(6376) then UseCollectible(6376) -- Ezabi
    elseif IsCollectibleUnlocked(267) then UseCollectible(267) end -- Tythis Andromo
end

function BN.HideGroup()
    isGroupHidden = not isGroupHidden
    SetCrownCrateNPCVisible(isGroupHidden)
end

function BN.SummonSmuggler()
    if IsCollectibleUnlocked(300) then UseCollectible(300) end -- Pirharri
end

local function OnAddonLoaded(eventCode, addonName)
    if addonName == BN.name then
        EM:UnregisterForEvent(BN.name, EVENT_ADD_ON_LOADED)

        BN.sv = ZO_SavedVars:NewAccountWide(BN.svName, BN.svVersion, nil, BN.defaults)
        if not BN.sv.isAccountWide then BN.sv = ZO_SavedVars:NewCharacterIdSettings(BN.svName, BN.svVersion, nil, BN.defaults) end
        sv = BN.sv

        BN.CallbackManager = ZO_CallbackObject:New()

        if sv.doHideTargetHealthBar then UNIT_FRAMES.staticFrames['reticleover']:SetHiddenForReason('BearNecessities', true) end
        if sv.isExpBarHidden then BN.RemoveFragment(PLAYER_PROGRESS_BAR_FRAGMENT) end
        if sv.isAttributeUIEnabled then BN.RemoveFragment(PLAYER_ATTRIBUTE_BARS_FRAGMENT) end
        if sv.isGroupUIEnabled then UNIT_FRAMES:DisableGroupAndRaidFrames() end

        -- Must be changed before chat is initialised
        CHAT_SYSTEM.maxContainerWidth, CHAT_SYSTEM.maxContainerHeight = GuiRoot:GetDimensions()

        CreateSceneFragments()
        RegisterEvents()
        RestorePositions()

        BN.GlobalSettingsInitialise()
        BN.GroupMenuInitialise()

        BN.BuildMenu()

        if LootLog then
            lootLog = LootLog
            ZO_PreHook(lootLog, 'Msg', InterceptLootLogMessage)
        end

        ZO_PreHook(BOSS_BAR, 'RefreshBossHealthBar', InterceptBossHealthBar)
        ZO_PostHook('StartChatInput', OnChatFocused)
        ZO_PostHook('ZO_ChatTextEntry_FocusLost', OnChatFocusLost)

        EM:RegisterForUpdate(BN.name .. 'FoodReminder', 1000, RefreshFoodReminder)
    end
end

EM:RegisterForEvent(BN.name, EVENT_ADD_ON_LOADED, OnAddonLoaded)

SLASH_COMMANDS['/house'] = function() RequestJumpToHouse(GetHousingPrimaryHouse()) end
SLASH_COMMANDS['/m'] = BN.SummonMerchant
SLASH_COMMANDS['/b'] = BN.SummonBanker
SLASH_COMMANDS['/s'] = BN.SummonSmuggler
SLASH_COMMANDS['/hg'] = BN.HideGroup