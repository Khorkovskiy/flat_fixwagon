
VORP = exports.vorp_inventory:vorp_inventoryApi()

VORP.RegisterUsableItem(Config.FixItem, function(data)
	VORP.subItem(data.source, Config.FixItem, 1)
	TriggerClientEvent('flat:FixWagon', data.source)
end)

RegisterNetEvent("flat:addfixitem")
AddEventHandler("flat:addfixitem", function()
    
    VORP.addItem(source, Config.FixItem, 1)
end)