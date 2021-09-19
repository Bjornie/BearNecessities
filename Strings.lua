local strings = {
    BN_SUMMON_MERCHANT = 'Summon Merchant Assistant',
    BN_SUMMON_BANKER = 'Summon Banker Assistant',
    BN_SUMMON_SMUGGLER = 'Summon Smuggler Assistant',

    BN_SWITCH_TAB_NEXT = 'Switch To Next Tab',
    BN_SWITCH_TAB_PREVIOUS = 'Switch To Previous Tab',
}

for id, string in pairs(strings) do
    ZO_CreateStringId(id, string)
    SafeAddVersion(id, 1)
end