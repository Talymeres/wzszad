Config = {}

Config.Price = 100

Config.DrawDistance = 0.0
Config.MarkerSize   = {x = 1.5, y = 1.5, z = 1.0}
Config.MarkerColor  = {r = 102, g = 102, b = 204}
Config.MarkerType   = 1
Config.Locale = 'fr'

Config.Zones = {}

Config.Shops = {
  {x = 209.9069519043,y=-924.17657470703,z=30.692022323608},
}

for i=1, #Config.Shops, 1 do

	Config.Zones['Shop_' .. i] = {
	 	Pos   = Config.Shops[i],
	 	Size  = Config.MarkerSize,
	 	Color = Config.MarkerColor,
	 	Type  = Config.MarkerType
  }

end