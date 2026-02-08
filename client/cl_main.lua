local Config <const> = require 'config.main'
local Zones = {
    Orange = {},
    Watermelon = {},
    Grape = {},
}
local Blips = {}
local SellerPed = nil

function EnterZone(self)
    if self.zoneName == 'orange_collection_zone' then
        lib.showTextUI('[E] - Portakal Topla', {
            position = 'left-center',
            icon = 'fa-solid fa-hand',
        })
    elseif self.zoneName == 'watermelon_collection_zone' then
        lib.showTextUI('[E] - Karpuz Topla', {
            position = 'left-center',
            icon = 'fa-solid fa-hand',
        })
    elseif self.zoneName == 'grape_collection_zone' then
        lib.showTextUI('[E] - Üzüm Topla', {
            position = 'left-center',
            icon = 'fa-solid fa-hand',
        })
    end
end

function ExitZone()
    lib.hideTextUI()
end

function InsideZone(self)
    DrawMarker(1, self.coords.x, self.coords.y, self.coords.z-1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 1.5, 255, 165, 0, 100, false, false, 0, false, nil, nil, false)

    if IsControlJustPressed(0, 38) and not lib.progressActive() then
        if lib.progressCircle({
            duration = 5000,
            position = 'bottom',
            label = 'Meyve toplanıyor...',
            useWhileDead = false,
            canCancel = true,
            disable = {
                move = true,
                car = true,
                combat = true,
            },
            anim = {
                dict = 'amb@prop_human_bum_bin@base',
                clip = 'base'
            }
        }) then
            TriggerServerEvent(Event('server:collectFruit'), self.zoneName)
        end
    end
end

function InputModal(fruitName, itemName)
    local input = lib.inputDialog(fruitName .. " Sat", {
        {type = 'number', label = 'Kaç ' .. fruitName .. ' satmak istiyorsunuz?', placeholder = 'Orn: 0-99', min = 1},
    })

    if input then
        local quantity = tonumber(input[1])
        if quantity and quantity > 0 then
            TriggerServerEvent(Event('server:sellFruit'), itemName, quantity)
        else
            lib.notify({
                title = 'Hata',
                description = 'Geçersiz miktar girdiniz.',
                type = 'error'
            })
        end
    end
end

local InitLocations <const> = function()
    if Config.Orange.Collection and next(Config.Orange.Collection) then
        if Config.UseTarget then
        else
            for _, location in pairs(Config.Orange.Collection) do

                Zones.Orange.Collection = lib.zones.sphere({
                    coords = location.coords,
                    radius = location.radius,
                    zoneName = 'orange_collection_zone',
                    onEnter = EnterZone,
                    onExit = ExitZone,
                    inside = InsideZone,
                })
            end
        end
    end
    if Config.Watermelon.Collection and next(Config.Watermelon.Collection) then
        if Config.UseTarget then
        else
            for _, location in pairs(Config.Watermelon.Collection) do
                Zones.Watermelon.Collection = lib.zones.sphere({
                    coords = location.coords,
                    radius = location.radius,
                    zoneName = 'watermelon_collection_zone',
                    onEnter = EnterZone,
                    onExit = ExitZone,
                    inside = InsideZone,
                })
            end
        end
    end
    if Config.Grape.Collection and next(Config.Grape.Collection) then
        if Config.UseTarget then
        else
            for _, location in pairs(Config.Grape.Collection) do
                Zones.Grape.Collection = lib.zones.sphere({
                    coords = location.coords,
                    radius = location.radius,
                    zoneName = 'grape_collection_zone',
                    onEnter = EnterZone,
                    onExit = ExitZone,
                    inside = InsideZone,
                })
            end
        end
    end

    if Config.Orange.Processing and next(Config.Orange.Processing) then
        local location = Config.Orange.Processing
        Zones.Orange.Processing = lib.zones.sphere({
            coords = location.coords,
            radius = location.radius,
            zoneName = 'orange_processing_zone',
            onEnter = function()
                lib.showTextUI('[E] - Portakal İşleme', {
                    position = 'left-center',
                    icon = 'fa-solid fa-hand',
                })
            end,
            onExit = function()
                lib.hideTextUI()
            end,
            inside = function()
                if IsControlJustPressed(0, 38) and not lib.progressActive() then
                    lib.progressCircle({
                        duration = 5000,
                        position = 'bottom',
                        label = 'Portakal işleniyor...',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                        },
                        anim = {
                            dict = 'amb@prop_human_bum_bin@base',
                            clip = 'base'
                        }
                    })

                    TriggerServerEvent(Event('server:processFruit'), 'orange_processing_zone')
                end
            end,
        })
    end

    if Config.Watermelon.Processing and next(Config.Watermelon.Processing) then
        local location = Config.Watermelon.Processing
        Zones.Watermelon.Processing = lib.zones.sphere({
            coords = location.coords,
            radius = location.radius,
            zoneName = 'watermelon_processing_zone',
            onEnter = function()
                lib.showTextUI('[E] - Karpuz İşleme', {
                    position = 'left-center',
                    icon = 'fa-solid fa-hand',
                })
            end,
            onExit = function()
                lib.hideTextUI()
            end,
            inside = function()
                if IsControlJustPressed(0, 38) and not lib.progressActive() then
                    lib.progressCircle({
                        duration = 5000,
                        position = 'bottom',
                        label = 'Karpuz işleniyor...',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                        },
                        anim = {
                            dict = 'amb@prop_human_bum_bin@base',
                            clip = 'base'
                        }
                    })

                    TriggerServerEvent(Event('server:processFruit'), 'watermelon_processing_zone')
                end
            end,
        })
    end

    if Config.Grape.Processing and next(Config.Grape.Processing) then
        local location = Config.Grape.Processing
        Zones.Grape.Processing = lib.zones.sphere({
            coords = location.coords,
            radius = location.radius,
            zoneName = 'grape_processing_zone',
            onEnter = function()
                lib.showTextUI('[E] - Üzüm İşleme', {
                    position = 'left-center',
                    icon = 'fa-solid fa-hand',
                })
            end,
            onExit = function()
                lib.hideTextUI()
            end,
            inside = function()
                if IsControlJustPressed(0, 38) and not lib.progressActive() then
                    lib.progressCircle({
                        duration = 5000,
                        position = 'bottom',
                        label = 'Üzüm işleniyor...',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                        },
                        anim = {
                            dict = 'amb@prop_human_bum_bin@base',
                            clip = 'base'
                        }
                    })

                    TriggerServerEvent(Event('server:processFruit'), 'grape_processing_zone')
                end
            end,
        })
    end

    if Config.Selling and next(Config.Selling) then
        if not HasModelLoaded(Config.Selling.model) then
            lib.requestModel(Config.Selling.model)
        end

        SellerPed = CreatePed(0, Config.Selling.model, Config.Selling.coords.x, Config.Selling.coords.y, Config.Selling.coords.z - 1.0, Config.Selling.coords.w, false, true)
        SetEntityHeading(SellerPed, Config.Selling.coords.w)
        FreezeEntityPosition(SellerPed, true)
        SetEntityInvincible(SellerPed, true)
        SetBlockingOfNonTemporaryEvents(SellerPed, true)
        SetModelAsNoLongerNeeded(Config.Selling.model)

        if Config.UseTarget then
        else
            lib.registerContext({
                id = 'fruit_selling_menu',
                title = 'Meyve Satış',
                options = {
                    {
                        title = 'Portakal Sat',
                        icon = 'fa-solid fa-cart-shopping',
                        onSelect = function()
                            InputModal(Config.Selling.price['weapon_pistol'].name or 'Portakal Suyu', 'orange_juice')
                        end
                    },
                    {
                        title = 'Karpuz Sat',
                        icon = 'fa-solid fa-cart-shopping',
                        onSelect = function()
                            InputModal(Config.Selling.price['watermelon_slice'].name or 'Karpuz Dilimi', 'watermelon_slice')
                        end
                    },
                    {
                        title = 'Üzüm Sat',
                        icon = 'fa-solid fa-cart-shopping',
                        onSelect = function()
                            InputModal(Config.Selling.price['grape_juice'].name or 'Üzüm Suyu', 'grape_juice')
                        end
                    },
                }
            })

            Zones.Selling = lib.zones.sphere({
                coords = vector3(Config.Selling.coords.x, Config.Selling.coords.y, Config.Selling.coords.z),
                radius = 2.0,
                zoneName = 'selling_zone',
                onEnter = function()
                    lib.showTextUI('[E] - Meyve Sat', {
                        position = 'left-center',
                        icon = 'fa-solid fa-hand',
                    })
                end,
                onExit = function()
                    lib.hideTextUI()
                end,
                inside = function()
                    if IsControlJustPressed(0, 38) and not lib.progressActive() then
                        lib.showContext('fruit_selling_menu')
                    end
                end,
            })
        end
    end
end

local function InitBlips()
    for _, blip in pairs(Config.Blips) do
        local createdBlip = AddBlipForCoord(blip.coords.x, blip.coords.y, blip.coords.z)
        SetBlipSprite(createdBlip, blip.sprite)
        SetBlipDisplay(createdBlip, 4)
        SetBlipScale(createdBlip, blip.scale)
        SetBlipColour(createdBlip, blip.color)
        SetBlipAsShortRange(createdBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(blip.name)
        EndTextCommandSetBlipName(createdBlip)

        Blips[#Blips + 1] = createdBlip
    end
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        if NetworkIsPlayerActive(PlayerId()) then
            InitLocations()
            InitBlips()
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        if not Config.UseTarget then
            for _, zone in pairs(Zones.Orange) do
                if zone then
                    zone:remove()
                end
            end

            for _, zone in pairs(Zones.Watermelon) do
                if zone then
                    zone:remove()
                end
            end

            for _, zone in pairs(Zones.Grape) do
                if zone then
                    zone:remove()
                end
            end
        end

        for _, blip in pairs(Blips) do
            if blip and DoesBlipExist(blip) then
                RemoveBlip(blip)
            end
        end
    end
end)

RegisterNetEvent(Event('client:onPlayerLoaded'), function()
    InitLocations()
    InitBlips()
end)

RegisterNetEvent(Event('client:onPlayerUnload'), function()
    if not Config.UseTarget then
        for _, zone in pairs(Zones.Orange) do
            if zone then
                zone:remove()
            end
        end

        for _, zone in pairs(Zones.Watermelon) do
            if zone then
                zone:remove()
            end
        end

        for _, zone in pairs(Zones.Grape) do
            if zone then
                zone:remove()
            end
        end
    end

    for _, blip in pairs(Blips) do
        if blip and DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
    end
end)