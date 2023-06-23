RegisterNetEvent('flat:FixWagon')
AddEventHandler('flat:FixWagon', function()
	local playerPed = PlayerPedId()
	local vehicle = nil
	local vehicleHandle = GetClosestVehicle(GetEntityCoords(playerPed), 2.0, 0, 71)

	if DoesEntityExist(vehicleHandle) then
		Wait(500)

		vehicle = vehicleHandle
		local scenario = "PROP_HUMAN_REPAIR_WAGON_WHEEL_ON_SMALL"
		SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)
		TaskStartScenarioInPlace(playerPed, GetHashKey(scenario), -1)

		local testplayer = exports["syn_minigame"]:taskBar(4000, 7)
		local testplayer2
		local testplayer3
		local testplayer4
		Wait(1000)
		if testplayer == 100 then
			testplayer2 = exports["syn_minigame"]:taskBar(3500, 7)
		end
		Wait(1000)
		if testplayer2 == 100 then
			testplayer3 = exports["syn_minigame"]:taskBar(3200, 7)
		end
		Wait(1000)
		if testplayer3 == 100 then
			testplayer4 = exports["syn_minigame"]:taskBar(2900, 7)
		end
		if testplayer4 == 100 then
			SetVehicleFixed(vehicle)
			
			SetVehicleUndriveable(vehicle, false)
			SetVehicleEngineOn(vehicle, true, true)
			ClearPedTasks(playerPed)
		else
			if testplayer or testplayer2 or testplayer3 or testplayer4 ~= 100 then

			FailFixWheel()
			local testplayer = nil
			local testplayer2 = nil
			local testplayer3 = nil
			local testplayer4 = nil

			end
		end

		
	else
		TriggerEvent('vorp:NotifyLeft', Config.NotifyFailTitle, Config.NotifyNoWagonNear, "INVENTORY_ITEMS", "kit_upgrade_camp_wagon", 4000)
		TriggerServerEvent("flat:addfixitem")
		
	end
end)



function FailFixWheel()
	local playerPed = PlayerPedId()
	AnimpostfxPlay("PlayerWakeUpKnockout")
	ClearPedTasks(playerPed)
	ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.53)
	SetPedToRagdoll(playerPed, 1500, 1500, 1, 0, 1, 0)
	Citizen.InvokeNative(0x697157CED63F18D4, playerPed, 50, false, true, true)
	TriggerEvent('vorp:NotifyLeft', Config.NotifyFailTitle, Config.NotifyFailMinigame, "INVENTORY_ITEMS", "kit_upgrade_camp_wagon", 4000)
	Citizen.Wait(30000)
	AnimpostfxStop("PlayerWakeUpKnockout")
end
