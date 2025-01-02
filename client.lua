local Framework = nil
local PlayerData = {}
local PlayerStats = {
    cash = 0,
    bank = 0,
    job = { name = 'unemployed', grade = '', label = 'Unemployed' },
    name = '',
    id = 0
}

-- Utility Functions
local function FormatNumber(number)
    if not number then return "0" end
    local formatted = tostring(math.floor(number))
    local pos = string.len(formatted) % 3
    if pos == 0 then pos = 3 end
    return string.sub(formatted, 1, pos) .. string.gsub(string.sub(formatted, pos + 1), "(...)", ",%1")
end

-- Framework Detection and Initialization
local function InitializeFramework()
    if Config.Framework == 'auto' or Config.Framework == 'esx' then
        if GetResourceState('es_extended') == 'started' then
            local success, result = pcall(function()
                return exports["es_extended"]:getSharedObject()
            end)
            if success and result then
                Framework = result
                Config.Framework = 'esx'
                return true
            end
        end
    end
    
    if Config.Framework == 'auto' or Config.Framework == 'qbcore' then
        if GetResourceState('qb-core') == 'started' then
            local success, result = pcall(function()
                return exports['qb-core']:GetCoreObject()
            end)
            if success and result then
                Framework = result
                Config.Framework = 'qbcore'
                return true
            end
        end
    end
    
    return false
end

-- Framework-specific functions
local function UpdatePlayerData()
    if Config.Framework == 'esx' then
        PlayerData = Framework.GetPlayerData()
        if Config.Components.money.enabled then
            Framework.TriggerServerCallback('pausemenu:getMoney', function(money)
                PlayerStats.cash = money.cash
                PlayerStats.bank = money.bank
            end)
        end
        
        if Config.Components.job.enabled then
            PlayerStats.job = {
                name = PlayerData.job.name,
                grade = PlayerData.job.grade_label,
                label = PlayerData.job.label
            }
        end
        
        if Config.Components.player.enabled then
            Framework.TriggerServerCallback('pausemenu:getPlayerName', function(name)
                PlayerStats.name = name
            end)
        end
    elseif Config.Framework == 'qbcore' then
        PlayerData = Framework.Functions.GetPlayerData()
        if Config.Components.money.enabled then
            PlayerStats.cash = PlayerData.money['cash']
            PlayerStats.bank = PlayerData.money['bank']
        end
        
        if Config.Components.job.enabled then
            PlayerStats.job = {
                name = PlayerData.job.name,
                grade = PlayerData.job.grade.name,
                label = PlayerData.job.label
            }
        end
        
        if Config.Components.player.enabled then
            PlayerStats.name = string.format('%s %s', 
                PlayerData.charinfo.firstname, 
                PlayerData.charinfo.lastname
            )
        end
    end
    
    if Config.Components.player.enabled then
        PlayerStats.id = GetPlayerServerId(PlayerId())
    end
end

-- Time and Date handling
local timeData = {
    time = '',
    date = ''
}

local function UpdateTimeDate()
    if Config.Components.datetime.enabled then
        if Config.Framework == 'esx' then
            Framework.TriggerServerCallback('pausemenu:getTimeDate', function(data)
                timeData = data
            end)
        elseif Config.Framework == 'qbcore' then
            Framework.Functions.TriggerCallback('pausemenu:getTimeDate', function(data)
                timeData = data
            end)
        end
    end
end

-- Server Info handling
local serverInfo = {
    players = 0,
    maxPlayers = 0,
    ping = 0
}

local function UpdateServerInfo()
    if Config.Components.server.enabled then
        if Config.Framework == 'esx' then
            Framework.TriggerServerCallback('pausemenu:getServerInfo', function(info)
                serverInfo = info
            end)
        elseif Config.Framework == 'qbcore' then
            Framework.Functions.TriggerCallback('pausemenu:getServerInfo', function(info)
                serverInfo = info
            end)
        end
    end
end

-- Main Thread
Citizen.CreateThread(function()
    while not InitializeFramework() do
        Citizen.Wait(1000)
    end
    
    local isPauseMenu = false
    
    while true do
        Citizen.Wait(0)
        
        if IsPauseMenuActive() then
            if not isPauseMenu then
                isPauseMenu = true
                UpdatePlayerData()
                UpdateTimeDate()
                UpdateServerInfo()
            end

            -- Clear previous header
            BeginScaleformMovieMethodOnFrontendHeader("CLEAR_ALL")
            EndScaleformMovieMethod()

            -- Add space for subtitle
            BeginScaleformMovieMethodOnFrontendHeader("SHIFT_CORONA_DESC")
            PushScaleformMovieFunctionParameterBool(true)
            PushScaleformMovieFunctionParameterBool(true)
            EndScaleformMovieMethod()

            -- Set Title and Subtitle
            BeginScaleformMovieMethodOnFrontendHeader("SET_HEADER_TITLE")
            PushScaleformMovieFunctionParameterString(Config.Title)
            PushScaleformMovieFunctionParameterBool(true)
            PushScaleformMovieFunctionParameterString(Config.Subtitle)
            PushScaleformMovieFunctionParameterBool(true)
            EndScaleformMovieMethod()

            -- Set Details
            BeginScaleformMovieMethodOnFrontendHeader("SET_HEADING_DETAILS")
            
            -- Initialize text variables
            local headerText = ''
            local moneyText = ''
            local infoText = ''

            -- Check if components are in layout order
            local function isInLayout(component)
                for _, v in ipairs(Config.Layout.order) do
                    if v == component then
                        return true
                    end
                end
                return false
            end
            
            -- Player Information
            if Config.Components.player.enabled and isInLayout('player') then
                local name = Config.Components.player.colors.name .. PlayerStats.name
                if Config.Components.player.show.id then
                    headerText = name .. Config.Components.player.colors.separator .. ' | ' .. 
                                Config.Components.player.colors.id .. Config.Components.player.format.id_prefix .. ' ' .. PlayerStats.id
                else
                    headerText = name
                end
            end
            PushScaleformMovieFunctionParameterString(headerText)
            
            -- Money Information
            if Config.Components.money.enabled and isInLayout('money') then
                if Config.Components.money.show.cash then
                    moneyText = Config.Components.money.colors.text .. 'Cash ' .. 
                               Config.Components.money.colors.currency .. Config.Components.money.format.currency .. 
                               Config.Components.money.colors.cash .. FormatNumber(PlayerStats.cash)
                end
                if Config.Components.money.show.bank then
                    if moneyText ~= '' then 
                        moneyText = moneyText .. Config.Components.money.colors.separator .. ' | ' 
                    end
                    moneyText = moneyText .. Config.Components.money.colors.text .. 'Bank ' .. 
                               Config.Components.money.colors.currency .. Config.Components.money.format.currency ..
                               Config.Components.money.colors.bank .. FormatNumber(PlayerStats.bank)
                end
            end
            PushScaleformMovieFunctionParameterString(moneyText)
            
            -- Job Information
            if Config.Components.job.enabled and isInLayout('job') then
                local jobColor = PlayerStats.job.name == 'unemployed' and Config.Components.job.colors.unemployed or Config.Components.job.colors.employed
                if Config.Components.job.show.grade then
                    infoText = jobColor .. PlayerStats.job.label .. Config.Components.job.colors.separator .. ' - ' .. 
                              Config.Components.job.colors.grade .. PlayerStats.job.grade
                else
                    infoText = jobColor .. PlayerStats.job.label
                end
            end
            
            -- Time and Date Information
            if Config.Components.datetime.enabled and isInLayout('datetime') then
                if infoText ~= '' then 
                    infoText = infoText .. Config.Components.datetime.colors.separator .. ' | ' 
                end
                if Config.Components.datetime.show.time then
                    infoText = infoText .. Config.Components.datetime.colors.time .. timeData.time
                end
                if Config.Components.datetime.show.date then
                    if Config.Components.datetime.show.time then 
                        infoText = infoText .. Config.Components.datetime.colors.separator .. ' | ' 
                    end
                    infoText = infoText .. Config.Components.datetime.colors.date .. timeData.date
                end
            end
            
            -- Server Information
            if Config.Components.server.enabled and isInLayout('server') then
                if infoText ~= '' then 
                    infoText = infoText .. Config.Components.server.colors.separator .. ' | ' 
                end
                if Config.Components.server.show.players then
                    infoText = infoText .. Config.Components.server.colors.players .. 
                              tostring(serverInfo.players) .. '/' .. tostring(serverInfo.maxPlayers) .. ' Players'
                end
                if Config.Components.server.show.ping then
                    if Config.Components.server.show.players then 
                        infoText = infoText .. Config.Components.server.colors.separator .. ' | ' 
                    end
                    local pingColor = serverInfo.ping <= 100 and Config.Components.server.colors.ping.good or 
                                     serverInfo.ping <= 200 and Config.Components.server.colors.ping.medium or 
                                     Config.Components.server.colors.ping.bad
                    infoText = infoText .. Config.Components.server.colors.players .. 'Ping: ' .. 
                              pingColor .. tostring(serverInfo.ping) .. Config.Components.server.format.ping_suffix
                end
            end
            PushScaleformMovieFunctionParameterString(infoText)
            PushScaleformMovieFunctionParameterBool(true)
            EndScaleformMovieMethod()

        else
            if isPauseMenu then
                isPauseMenu = false
            end
        end
    end
end)

-- Tab Customization Thread
Citizen.CreateThread(function()
    -- Wait for resource to fully start and themes to load
    Citizen.Wait(0)

    -- Load themes if not already loaded
    if not Themes then
        local themesContent = LoadResourceFile(GetCurrentResourceName(), 'themes.lua')
        if themesContent then
            local loadThemes, errorMsg = load(themesContent, 'themes.lua', 't')
            if loadThemes then
                local success, loadedThemes = pcall(loadThemes)
                if success then
                    Themes = loadedThemes
                else
                    print('^1ERROR: Failed to execute themes.lua: ' .. tostring(loadedThemes) .. '^7')
                    return
                end
            else
                print('^1ERROR: Failed to compile themes.lua: ' .. tostring(errorMsg) .. '^7')
                return
            end
        else
            print('^1ERROR: Could not load themes.lua file^7')
            return
        end
    end

    -- Helper function to add text entries
    local function AddTextEntry(key, value)
        Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
    end

    -- Get the appropriate color for a tab
    local function GetTabColor(tabName)
        if not Config.Tabs.enabled then return '' end
        if not Config.Tabs.useThemeColors then return Config.Tabs.customColor end
        
        local selectedTheme = Themes.Colors[Config.Theme.colorScheme] or Themes.Colors.modern_dark
        return selectedTheme.tabs[tabName] or '~w~'
    end

    while true do
        if Config.Tabs.enabled then
            -- Map tab
            AddTextEntry('PM_SCR_MAP', GetTabColor('map') .. Config.Tabs.names.map)
            
            -- Status tab
            AddTextEntry('PM_SCR_STA', GetTabColor('status') .. Config.Tabs.names.status)
            
            -- Game tab
            AddTextEntry('PM_SCR_GAM', GetTabColor('game') .. Config.Tabs.names.game)
            
            -- Info tab
            AddTextEntry('PM_SCR_INF', GetTabColor('info') .. Config.Tabs.names.info)
            
            -- Settings tab
            AddTextEntry('PM_SCR_SET', GetTabColor('settings') .. Config.Tabs.names.settings)
            
            -- R* Editor tab
            AddTextEntry('PM_SCR_RPL', GetTabColor('editor') .. Config.Tabs.names.editor)
            
            -- Gallery tab
            AddTextEntry('PM_SCR_GAL', GetTabColor('gallery') .. Config.Tabs.names.gallery)
        end
        
        Citizen.Wait(1000) -- Update every second
    end
end)

-- Update Stats Thread
Citizen.CreateThread(function()
    while true do
        if IsPauseMenuActive() then
            -- Only update components that are in the layout
            local function isInLayout(component)
                for _, v in ipairs(Config.Layout.order) do
                    if v == component then
                        return true
                    end
                end
                return false
            end

            if (Config.Components.money.enabled and isInLayout('money')) or 
               (Config.Components.job.enabled and isInLayout('job')) or 
               (Config.Components.player.enabled and isInLayout('player')) then
                UpdatePlayerData()
            end
            if Config.Components.datetime.enabled and isInLayout('datetime') then
                UpdateTimeDate()
            end
            if Config.Components.server.enabled and isInLayout('server') then
                UpdateServerInfo()
            end
        end
        Citizen.Wait(Config.UpdateIntervals.stats)
    end
end)