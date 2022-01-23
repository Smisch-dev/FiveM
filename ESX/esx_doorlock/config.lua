Config = {}
Config.Locale = 'en'
Config.text = nil

Config.DoorList = {

	{
		--Main doors LSPD
		textCoords = vector3(434.7, -982.0, 30.69), -- Location of hologram
		authorizedJobs = {'police', 'offpolice','fbi'}, -- Jobs allowed to use lock
		identifier = 'steam:hex', -- Steam ID when you want allow specific player to use lock
		locked = false, -- Default lock status after restart
		maxDistance = 4, -- Maximum Distance to unlock lock
		doors = {                                                                                        -- When you want lock double doors
			{objHash = -1547307588, objHeading = 270.0, objCoords = vector3(434.7, -980.6, 30.8)},   -- Door1
			{objHash = -1547307588, objHeading = 90.0, objCoords = vector3(434.7, -983.2, 30.8)}	 -- Door2
		}
	},
      {       
		objHash = GetHashKey('farmhouse_door2'), -- Other way to sellect object to lock
		objCoords = vector3(1536.41, 2232.15, 77.79), -- Coords of object you want to lock
		textCoords = vector3(1536.41, 2232.15, 77.7), -- Location of hologram
		authorizedJobs = {'kubans'}, -- Allowed jobs
		locked = true, -- Default lock status after restart
		maxDistance = 3, -- Maximum Distance to unlock lock
		size = 0.5 -- Size of hologram
	  }	
}