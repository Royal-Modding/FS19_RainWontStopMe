--- ${title}

---@author ${author}
---@version r_version_r
---@date 17/03/2021

InitRoyalMod(Utils.getFilename("rmod/", g_currentModDirectory))
InitRoyalUtility(Utils.getFilename("utility/", g_currentModDirectory))

---@class RainWontStopMe : RoyalMod
RainWontStopMe = RoyalMod.new(r_debug_r, false)
RainWontStopMe.allowedVehicles = {
    "data/vehicles/grimme/SE260/SE260.xml",
    "data/vehicles/ropa/keiler2/keiler2.xml",
    "data/vehicles/ropa/panther2/panther2.xml",
    "data/vehicles/ropa/tiger6/tiger6.xml"
}

function RainWontStopMe:initialize()
    Utility.appendedFunction(Combine, "loadCombineSetup", RainWontStopMe.combine_loadCombineSetup)
end

function RainWontStopMe.combine_loadCombineSetup(vehicle, _, _, entry)
    if TableUtility.contains(RainWontStopMe.allowedVehicles, vehicle.configFileName) then
        entry.allowThreshingDuringRain = true
        g_logManager:devInfo("[%s] Vehicle '%s' allowed to thresh during rain", RainWontStopMe.name, vehicle.configFileName)
    end
end
