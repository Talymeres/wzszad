fx_version 'cerulean'
game 'gta5'

files {
	'datals/handling.meta',
	'datals/vehicles.meta',
	'datals/carvariations.meta',

	'weapons/*.meta',
	'weapons/recul/*.meta',
	'weapons/melee/*.meta',
	'weapons/vehicles/*.meta',
	'weapons/components/*.meta',
	'weapons/shopweapons/*.meta',
}


data_file 'WEAPON_METADATA_FILE' 'weapons/weaponarchetypes.meta'
data_file 'WEAPON_ANIMATIONS_FILE' 'weapons/weaponanimations.meta'
data_file 'WEAPON_ANIMATIONS_FILE' 'weapons/weaponanimations2.meta'
data_file 'LOADOUTS_FILE' 'weapons/loadouts.meta'
data_file 'WEAPONINFO_FILE' 'weapons/weaponsgtalife.meta'
data_file 'PED_PERSONALITY_FILE' 'weapons/pedpersonality.meta'
data_file 'PED_PERSONALITY_FILE' 'weapons/pedpersonality2.meta'
data_file 'EXPLOSION_INFO_FILE' 'weapons/explosion.ymt'

data_file 'HANDLING_FILE' 'datals/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'datals/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'datals/carvariations.meta'

data_file 'WEAPONINFO_FILE_PATCH' 'weapons/*.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'weapons/recul/*.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'weapons/melee/*.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'weapons/vehicles/*.meta'

data_file 'WEAPON_METADATA_FILE' 'weapons/archetypes/*.meta'
data_file 'WEAPONCOMPONENTSINFO_FILE' 'weapons/components/*.meta'

client_script 'datals/vehicle_names.lua'
client_script 'datalc/vehicle_names.lua'
client_script "client.lua"
client_script "@pichot_core/cl_orcus.lua"