BearNecessities = {
  name = "BearNecessities",
  version = "1.0.0",
  svName = "BearNecessitiesSV",
  svVersion = 1,

  Default = {
    isAccountWide = true,
    isFoodEnabled = true,
  },
}

local BN = BearNecessities

local function ActivityFinderAchievements()
end

local function Initialise()
  BN.SavedVariables = ZO_SavedVars:NewAccountWide(BN.svName, BN.svVersion, nil, BN.Default)

  if not BN.SavedVariables.isAccountWide then
    BN.SavedVariables = ZO_SavedVars:NewCharacterIdSettings(BN.svName, BN.svVersion, nil, BN.Default)
  end

  ActivityFinderAchievements()
  BN.BuildMenu()
end

local function OnAddonLoaded(_, addonName)
  if addonName == BN.name then
    EVENT_MANAGER:UnregisterForEvent(BN.name, EVENT_ADD_ON_LOADED)
    Initialise()
  end
end

EVENT_MANAGER:RegisterForEvent(BN.name, EVENT_ADD_ON_LOADED, OnAddonLoaded)