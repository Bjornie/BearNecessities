local BN = BearNecessities
local WM = GetWindowManager()

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

local missingQuests = {}

function BN.BuildDungeonQuestButton()
    local function CheckQuests()
        local headerNormal = _G['ZO_DungeonFinder_KeyboardListSectionScrollChildZO_ActivityFinderTemplateNavigationHeader_Keyboard1']
        local container = _G["ZO_DungeonFinder_KeyboardListSectionScrollChildContainer2"]

        if headerNormal.text:GetColor() ~= 1 then headerNormal:OnMouseUp(true) end

        for i = 1, container:GetNumChildren() do
            local control = container:GetChild(i)
            local zoneId = control.node.data.zoneId

            if not missingQuests[zoneId] and control.check:GetState() == 0 then
                control.check:SetState(BSTATE_PRESSED, true)
                ZO_ACTIVITY_FINDER_ROOT_MANAGER:ToggleLocationSelected(control.node.data)
            elseif not missingQuests[zoneId] and control.check:GetState() == 1 then
                control.check:SetState(BSTATE_NORMAL, true)
                ZO_ACTIVITY_FINDER_ROOT_MANAGER:ToggleLocationSelected(control.node.data)
            end
        end
    end

    WM:CreateControlFromVirtual('BearNecessities_CheckQuests', ZO_DungeonFinder_Keyboard, 'ZO_DefaultButton')

    BearNecessities_CheckQuests:SetWidth(200)
    BearNecessities_CheckQuests:SetText('Un-/Check Quests')
    BearNecessities_CheckQuests:SetAnchor(BOTTOM, BearNecessities_CheckPledges, TOP, 0, -10)
    BearNecessities_CheckQuests:SetClickSound('Click')
    BearNecessities_CheckQuests:SetHandler('OnClicked', CheckQuests)

    -- Husk at ændre dette tilbage i BuildPledgeButton()
    ZO_SearchingForGroupActualTime:ClearAnchors()
    ZO_SearchingForGroupActualTime:SetAnchor(BOTTOM, BearNecessities_CheckQuests, TOP)
end

local function DungeonFinder()
    local container = _G["ZO_DungeonFinder_KeyboardListSectionScrollChildContainer2"]

        for i = 1, container:GetNumChildren() do
            local control = container:GetChild(i)
            local rawName = control.node.data.rawName
            local zoneId = control.node.data.zoneId

            for key, value in ipairs(questIds) do
                local zoneName, objectiveName, zoneIndex, poiIndex = GetCompletedQuestLocationInfo(value)

                objectiveName = objectiveName:gsub('.*:%s*', '')

                if value == 4641 then objectiveName = objectiveName .. 'I' end

                if objectiveName == rawName then missingQuests[zoneId] = true end
            end
        end
end

ZO_PreHookHandler(ZO_DungeonFinder_KeyboardListSection, 'OnEffectivelyShown', function() zo_callLater(DungeonFinder, 100) end)
ZO_PreHookHandler(ZO_DungeonFinder_KeyboardListSection, 'OnEffectivelyHidden', function() missingQuests = {} end)