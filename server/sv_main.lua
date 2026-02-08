local Config <const> = require 'config.main'

RegisterNetEvent(Event('server:collectFruit'), function(zoneName)
    local src = source
    local Player = Framework.GetPlayer(src)
    if not Player then return end

    local pedCoords = GetEntityCoords(GetPlayerPed(src))
    local itemData
    if zoneName == 'orange_collection_zone' then
        for _, location in pairs(Config.Orange.Collection) do
            local distance = #(pedCoords - location.coords)
            if distance <= location.radius then
                itemData = location.itemName
                break
            end
        end

        if itemData then
            if Player.Functions.AddItem(itemData, 1) then
                lib.notify({
                    title = 'Meyve Toplama',
                    description = 'Portakal topladınız.',
                    type = 'success'
                })
            else
                lib.notify({
                    title = 'Meyve Toplama',
                    description = 'Portakal toplarken bir hata oluştu.',
                    type = 'error'
                })
            end
        else
            DropPlayer(src, 'Geçersiz bölgeye erişmeye çalıştığınız için bağlantınız kesildi.')
        end
    elseif zoneName == 'watermelon_collection_zone' then
        for _, location in pairs(Config.Watermelon.Collection) do
            local distance = #(pedCoords - location.coords)
            if distance <= location.radius then
                itemData = location.itemName
                break
            end
        end

        if itemData then
            if Player.Functions.AddItem(itemData, 1) then
                lib.notify({
                    title = 'Meyve Toplama',
                    description = 'Karpuz topladınız.',
                    type = 'success'
                })
            else
                lib.notify({
                    title = 'Meyve Toplama',
                    description = 'Karpuz toplarken bir hata oluştu.',
                    type = 'error'
                })
            end
        else
            DropPlayer(src, 'Geçersiz bölgeye erişmeye çalıştığınız için bağlantınız kesildi.')
        end
    elseif zoneName == 'grape_collection_zone' then
        for _, location in pairs(Config.Grape.Collection) do
            local distance = #(pedCoords - location.coords)
            if distance <= location.radius then
                itemData = location.itemName
                break
            end
        end

        if itemData then
            if Player.Functions.AddItem(itemData, 1) then
                lib.notify({
                    title = 'Meyve Toplama',
                    description = 'Üzüm topladınız.',
                    type = 'success'
                })
            else
                lib.notify({
                    title = 'Meyve Toplama',
                    description = 'Üzüm toplarken bir hata oluştu.',
                    type = 'error'
                })
            end
        else
            DropPlayer(src, 'Geçersiz bölgeye erişmeye çalıştığınız için bağlantınız kesildi.')
        end
    else
        DropPlayer(src, 'Geçersiz bölgeye erişmeye çalıştığınız için bağlantınız kesildi.')
    end
end)

RegisterNetEvent(Event('server:processFruit'), function(zoneName)
    local src = source
    local Player = Framework.GetPlayer(src)
    if not Player then return end

    local requiredItem, rewardItem, rewardAmount

    if zoneName == 'orange_processing_zone' then
        requiredItem = Config.Orange.Processing.requiredItem
        rewardItem = Config.Orange.Processing.rewardItem
        rewardAmount = Config.Orange.Processing.rewardAmount
    elseif zoneName == 'watermelon_processing_zone' then
        requiredItem = Config.Watermelon.Processing.requiredItem
        rewardItem = Config.Watermelon.Processing.rewardItem
        rewardAmount = Config.Watermelon.Processing.rewardAmount
    elseif zoneName == 'grape_processing_zone' then
        requiredItem = Config.Grape.Processing.requiredItem
        rewardItem = Config.Grape.Processing.rewardItem
        rewardAmount = Config.Grape.Processing.rewardAmount
    else
        DropPlayer(src, 'Geçersiz bölgeye erişmeye çalıştığınız için bağlantınız kesildi.')
        return
    end

    local hasRequiredItems = true
    if type(requiredItem) == 'string' then
        if Player.Functions.GetItemByName(requiredItem) == nil or Player.Functions.GetItemByName(requiredItem).amount < 1 then
            hasRequiredItems = false
        end
    end

    if hasRequiredItems then
        if Player.Functions.RemoveItem(requiredItem, 1) then
            Player.Functions.AddItem(rewardItem, rewardAmount)
            TriggerClientEvent('ox_lib:notify', src,{
                title = 'Meyve İşleme',
                description = 'Meyveleri işlediniz ve ' .. rewardAmount .. 'x ' .. rewardItem .. ' aldınız.',
                type = 'success'
            })
        else
            TriggerClientEvent('ox_lib:notify', src,{
                title = 'Meyve İşleme',
                description = 'Meyveleri işlerken bir hata oluştu.',
                type = 'error'
            })
        end
    else
        TriggerClientEvent('ox_lib:notify', src,{
            title = 'Meyve İşleme',
            description = 'İşlemek için gerekli malzemelere sahip değilsiniz.',
            type = 'error'
        })
    end
end)

RegisterNetEvent(Event('server:sellFruit'), function(itemName, amount)
    local src = source
    local Player = Framework.GetPlayer(src)
    if not Player then return end

    local itemData = Config.Selling.price[itemName]
    if Player.Functions.RemoveItem(itemName, amount) and itemData then
        Framework.AddAccountBalance(src, 'cash', itemData.price * amount)
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Meyve Satışı',
            description = 'İşlem için gerekli malzemeleri verdiniz.',
            type = 'success'
        })
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Meyve Satışı',
            description = 'Gerekli malzemeleri verirken bir hata oluştu.',
            type = 'error'
        })
    end
end)