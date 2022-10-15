Config = {}
Config.Locale = 'en'

Config.Price = 250

Config.DrawDistance = 0.0
Config.MarkerSize   = {x = 1.5, y = 1.5, z = 1.0}
Config.MarkerColor  = {r = 102, g = 102, b = 204}
Config.MarkerType   = 1

Config.Zones = {}

Config.Shops = {
  {x=185.10333251953,y=-940.90618896484,z=30.09192276001},
}

for i=1, #Config.Shops, 1 do

	Config.Zones['Shop_' .. i] = {
	 	Pos   = Config.Shops[i],
	 	Size  = Config.MarkerSize,
	 	Color = Config.MarkerColor,
	 	Type  = Config.MarkerType
  }

end
