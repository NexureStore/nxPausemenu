local Framework = nil

-- Framework Detection
local function InitializeFramework()
    if GetResourceState('es_extended') == 'started' then
        local success, result = pcall(function()
            return exports["es_extended"]:getSharedObject()
        end)
        if success and result then
            Framework = result
            print('[Pause Menu] Server initialized with ESX framework')
            return 'esx'
        end
    end
    
    if GetResourceState('qb-core') == 'started' then
        local success, result = pcall(function()
            return exports['qb-core']:GetCoreObject()
        end)
        if success and result then
            Framework = result
            print('[Pause Menu] Server initialized with QBCore framework')
            return 'qbcore'
        end
    end
    
    print('[Pause Menu] WARNING: No compatible framework found on server side')
    return nil
end

local frameworkName = InitializeFramework()

if not frameworkName then
    print('[Pause Menu] ERROR: Failed to initialize any framework. Callbacks will not work!')
    return
end

-- Server Info callback (works for both frameworks)
local function RegisterServerInfoCallback()
    if frameworkName == 'esx' then
        Framework.RegisterServerCallback('pausemenu:getServerInfo', function(source, cb)
            local ping = GetPlayerPing(source)
            if ping == nil or ping == -1 then ping = 0 end
            
            cb({
                players = #GetPlayers(),
                maxPlayers = GetConvarInt('sv_maxclients', 32),
                ping = ping
            })
        end)
    elseif frameworkName == 'qbcore' then
        Framework.Functions.CreateCallback('pausemenu:getServerInfo', function(source, cb)
            local ping = GetPlayerPing(source)
            if ping == nil or ping == -1 then ping = 0 end
            
            cb({
                players = #GetPlayers(),
                maxPlayers = GetConvarInt('sv_maxclients', 32),
                ping = ping
            })
        end)
    end
end

-- Time and Date callback (works for both frameworks)
local function RegisterTimeCallback()
    if frameworkName == 'esx' then
        Framework.RegisterServerCallback('pausemenu:getTimeDate', function(source, cb)
            cb({
                time = os.date(Config.Components.datetime.format.time),
                date = os.date(Config.Components.datetime.format.date)
            })
        end)
    elseif frameworkName == 'qbcore' then
        Framework.Functions.CreateCallback('pausemenu:getTimeDate', function(source, cb)
            cb({
                time = os.date(Config.Components.datetime.format.time),
                date = os.date(Config.Components.datetime.format.date)
            })
        end)
    end
end

-- Register callbacks
RegisterServerInfoCallback()
RegisterTimeCallback()

-- Framework-specific callbacks
if frameworkName == 'esx' then
    Framework.RegisterServerCallback('pausemenu:getMoney', function(source, cb)
        local xPlayer = Framework.GetPlayerFromId(source)
        if xPlayer then
            cb({
                cash = xPlayer.getMoney(),
                bank = xPlayer.getAccount('bank').money
            })
        else
            cb({ cash = 0, bank = 0 })
        end
    end)

    Framework.RegisterServerCallback('pausemenu:getPlayerName', function(source, cb)
        local xPlayer = Framework.GetPlayerFromId(source)
        if xPlayer then
            local result = MySQL.query.await('SELECT firstname, lastname FROM users WHERE identifier = ?', {
                xPlayer.identifier
            })
            
            if result and result[1] then
                cb(string.format('%s %s', result[1].firstname, result[1].lastname))
            else
                cb(GetPlayerName(source))
            end
        else
            cb(GetPlayerName(source))
        end
    end)

elseif frameworkName == 'qbcore' then
    Framework.Functions.CreateCallback('pausemenu:getMoney', function(source, cb)
        local Player = Framework.Functions.GetPlayer(source)
        if Player then
            cb({
                cash = Player.PlayerData.money['cash'],
                bank = Player.PlayerData.money['bank']
            })
        else
            cb({ cash = 0, bank = 0 })
        end
    end)

    Framework.Functions.CreateCallback('pausemenu:getPlayerName', function(source, cb)
        local Player = Framework.Functions.GetPlayer(source)
        if Player then
            cb(string.format('%s %s', 
                Player.PlayerData.charinfo.firstname, 
                Player.PlayerData.charinfo.lastname
            ))
        else
            cb(GetPlayerName(source))
        end
    end)
end 