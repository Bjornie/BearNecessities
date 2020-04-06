BearNecessities = {
  name = "BearNecessities",
  version = "1.0.0",
  svName = "BearNecessitiesSV",
  svVersion = 1,

  Default = {},
}

local BN = BearNecessities

local function Initialise()
  BN.SavedVariables = ZO_SavedVars:NewAccountWide(BN.svName, BN.svVersion, nil, BN.Default)

  BN.BuildMenu()
end

local function OnAddonLoaded(_, addonName)
  if addonName == BN.name then
    EVENT_MANAGER:UnregisterForEvent(BN.name, EVENT_ADD_ON_LOADED)
    Initialise()
  end
end

EVENT_MANAGER:RegisterForEvent(BN.name, EVENT_ADD_ON_LOADED, OnAddonLoaded))