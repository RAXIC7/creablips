local blips = {}

RegisterServerEvent("addBlip")
AddEventHandler("addBlip", function(x, y, z, blipType, name)
  local id = #blips + 1
  blips[id] = AddBlipForCoord(x, y, z)
  SetBlipSprite(blips[id], blipType)
  SetBlipScale(blips[id], 1.0)
  SetBlipColour(blips[id], 2)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(name)
  EndTextCommandSetBlipName(blips[id])
  TriggerClientEvent("refreshBlips", -1, blips)
end)

RegisterServerEvent("editBlip")
AddEventHandler("editBlip", function(id, x, y, z, blipType, name)
  if blips[id] then
    SetBlipCoords(blips[id], x, y, z)
    SetBlipSprite(blips[id], blipType)
    SetBlipScale(blips[id], 1.0)
    SetBlipColour(blips[id], 2)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(name)
    EndTextCommandSetBlipName(blips[id])
    TriggerClientEvent("refreshBlips", -1, blips)
  end
end)

RegisterServerEvent("deleteBlip")
AddEventHandler("deleteBlip", function(id)
  if blips[id] then
    RemoveBlip(blips[id])
    blips[id] = nil
    TriggerClientEvent("refreshBlips", -1, blips)
  end
end)