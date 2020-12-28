
local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}


ESX = nil
npcfrkntamir = false


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


Citizen.CreateThread(function()
    while true do 
        player = PlayerPedId()
        playerCoords = GetEntityCoords(player)
        entityMaxHealth = GetEntityMaxHealth(player)
        id = GetPlayerServerId(player)
        Citizen.Wait(3500)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)


local aractamir = {

{x = 718.15, y = -1081.37, z = 21.9}
}

    Citizen.CreateThread(function()
        while true do
Citizen.Wait(0)
for k in pairs (aractamir) do

    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)       
    local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, aractamir[k].x, aractamir[k].y, aractamir[k].z)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)  
   

    if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
        if dist <= 3 and not frkntamir then

                    Frkn3d(718.15, -1081.37, 22.28, "[E] - Aracı tamir et")
                  if IsControlJustPressed(0, Keys['E']) then
                    ESX.TriggerServerCallback('frkn_npcrepair:mekanikvarmı',function(online)
                        if online ==1 then
                           exports['mythic_notify']:DoHudText('error', "Şehirde mekanik varken ben çalışmam!")
                        else
                    FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId()), true)
                    local finished = exports["frkn-taskbar"]:taskBar(3000,"Aracınızın tamire hazırlanıyor")
                    frkntamir = true
                    SetVehicleDeformationFixed(vehicle)
                    SetVehicleFixed(vehicle)
                    SetVehicleTyreFixed(vehicle, 4) 
                    SetVehicleDoorOpen(vehicle, 4, 0, 0)
                    TriggerServerEvent('paraal', source)

                  end
                end)
                end
            end
        end
    end
end
    end)



    Citizen.CreateThread(function()
        local frknnnn = GetHashKey("mp_m_waremech_01")
        if not HasModelLoaded(frknnnn) then
            RequestModel(frknnnn)
            Citizen.Wait(3500)
        end
        while not HasModelLoaded(frknnnn) do
            Citizen.Wait(3500)
        end
        if not npcfrkntamir then
            local hoopfrkn = CreatePed(6, frknnnn, 720.65, -1073.07, 22.06, 95.65, false, false)
            SetBlockingOfNonTemporaryEvents(hoopfrkn, true)
            SetPedDiesWhenInjured(hoopfrkn, true)
            SetPedCanRagdollFromPlayerImpact(hoopfrkn, true)
            SetPedCanRagdoll(hoopfrkn, true)
            FreezeEntityPosition(hoopfrkn, true)
            loadAnimDict('amb@prop_human_bum_shopping_cart@male@idle_a')
            if not IsEntityPlayingAnim(hoopfrkn, "amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", 3) then
                TaskPlayAnim(hoopfrkn, "amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
            end
            Citizen.CreateThread(function()
                while true do 
                    Citizen.Wait(0)
                    if frkntamir then 
                        inTed = true
                        Citizen.Wait(100)
                        ClearPedTasksImmediately(hoopfrkn)
                        FreezeEntityPosition(hoopfrkn, false)
                        Citizen.Wait(50)
                        TaskGoStraightToCoord(hoopfrkn, 718.01, -1081.52, 21.66, 20, -1, 251.08, 0)
                        Citizen.Wait(3000)
                        TaskGoStraightToCoord(hoopfrkn,718.01, -1081.52, 21.66, 20, -1, 180.66, 0)
                        Citizen.Wait(4500)
                        loadAnimDict("mini@repair")
                        if not IsEntityPlayingAnim(hoopfrkn, "mini@repair", "fixing_a_ped", 3) then
                            TaskPlayAnim(hoopfrkn, "mini@repair", "fixing_a_ped", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
                        end 
                        Citizen.Wait(10000)
                        ClearPedTasksImmediately(hoopfrkn)
                        Citizen.Wait(50)
                        TaskGoStraightToCoord(hoopfrkn, 720.65, -1073.07, 22.06, 20, -1, 75.94, 0)
                        Citizen.Wait(3200)
                        TaskGoStraightToCoord(hoopfrkn, 720.65, -1073.07, 22.06, 20, -1, 252.65, 0)
                        Citizen.Wait(5500)
                        FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId()), false)
                        loadAnimDict('amb@prop_human_bum_shopping_cart@male@idle_a')
                        if not IsEntityPlayingAnim(hoopfrkn, "amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", 3) then
                            TaskPlayAnim(hoopfrkn, "amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
                        end
                        inTed = false
                        frkntamir = false
                    end
                end
            end)
        end
    end)











function Frkn3d(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
  
  end


  function loadAnimDict(dict)  
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(500)
    end
end