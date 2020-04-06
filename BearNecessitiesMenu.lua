local BN = BearNecessities

function BN.BuildMenu()
  local PanelData = {
    type = "panel",
    name = "Bear Necessities",
    displayname = "Bear Necessities",
    author = "|c00BFFFBjørnTheBurr|r",
    version = BN.version,
    registerForRefresh = true,
  }

  local OptionsTable = {
    {
      type = "header",
      name = "|cFFFACDGeneral|r",
    },
    {
      type = "checkbox",
      name = "Account-Wide Settings",
      getFunc = function() return BN.SavedVariables.isAccountWide end,
      setFunc = function(value) BN.SavedVariables.isAccountWide = value end,
    },
    {
      type = "checkbox",
      name = "Food Reminder",
      width = "half",
      getFunc = function() return BN.SavedVariables.isFoodEnabled end,
      setFunc = function(value) BN.SavedVariables.isFoodEnabled = value end,
    },
    {
      type = "description",
      width = "half",
      text = "On-screen notification when food buff is close to ending.",
    },
  }

  LibAddonMenu2:RegisterAddonPanel(BN.name, PanelData)
  LibAddonMenu2:RegisterOptionControls(BN.name, OptionsTable)
end