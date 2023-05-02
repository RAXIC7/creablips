Citizen.CreateThread(function()
    for i = 1, #Config.Blips do
        local coords = Config.Blips[i].coords
        local sprite = Config.Blips[i].sprite
        local color = Config.Blips[i].color
        local name = Config.Blips[i].name
        local scale = Config.Blips[i].scale
        local shortRange = Config.Blips[i].shortRange

        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, sprite)
        SetBlipColour(blip, color)
        SetBlipScale(blip, scale)
        SetBlipAsShortRange(blip, shortRange)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(name)
        EndTextCommandSetBlipName(blip)
    end
end)