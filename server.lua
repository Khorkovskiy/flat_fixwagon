
VORP = exports.vorp_inventory:vorp_inventoryApi()

VORP.RegisterUsableItem(Config.FixItem, function(data)
	VORP.subItem(data.source, Config.FixItem, 1)
	VORP.CloseInv(data.source)
	TriggerClientEvent('flat:FixWagon', data.source)
end)

RegisterNetEvent("flat:addfixitem")
AddEventHandler("flat:addfixitem", function()
    
    VORP.addItem(source, Config.FixItem, 1)
end)