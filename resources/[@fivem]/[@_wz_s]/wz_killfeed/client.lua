
RZ = RZ or {}
TriggerEvent('RZ:GetFramework', function(object)
    RZ = object
end)


RegisterNetEvent('rz-killfeed:client:kill')
AddEventHandler('rz-killfeed:client:kill', function(killed, killer, weapon, logorank, logorank2)
	SendNUIMessage({
		type = 'newKill',
		killer = killer,
		killed = killed,
		weapon = weapon,
		logorank = logorank,
		logorank2 = logorank2,
	})
end)


RegisterCommand("boostfps", function()
	RopeDrawShadowEnabled(false)

	CascadeShadowsClearShadowSampleType()
	CascadeShadowsSetAircraftMode(false)
	CascadeShadowsEnableEntityTracker(true)
	CascadeShadowsSetDynamicDepthMode(false)
	CascadeShadowsSetEntityTrackerScale(0.0)
	CascadeShadowsSetDynamicDepthValue(0.0)
	CascadeShadowsSetCascadeBoundsScale(0.0)

	SetFlashLightFadeDistance(0.0)
	SetLightsCutoffDistanceTweak(0.0)
	DistantCopCarSirens(false)
end)