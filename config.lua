--[[ 
    Nexure Pausemenu Configuration
    
    IMPORTANT NOTES:
    - Do not modify the structure of this file
    - All settings are customizable
    - Use the debug mode if you encounter issues
    - Make sure to restart the resource after changes
]]

-- Load and validate themes
local themesContent = LoadResourceFile(GetCurrentResourceName(), 'themes.lua')
if not themesContent then
    print('^1ERROR: Could not load themes.lua file^7')
    return
end

local loadThemes, errorMsg = load(themesContent, 'themes.lua', 't')
if not loadThemes then
    print('^1ERROR: Failed to compile themes.lua: ' .. tostring(errorMsg) .. '^7')
    return
end

local success, Themes = pcall(loadThemes)
if not success then
    print('^1ERROR: Failed to execute themes.lua: ' .. tostring(Themes) .. '^7')
    return
end

Config = {}

--[[ FRAMEWORK CONFIGURATION ]]
-- Options: 
-- 'auto'   - Automatically detect ESX or QBCore
-- 'esx'    - Force ESX framework
-- 'qbcore' - Force QBCore framework
Config.Framework = 'auto'

-- Enable debug mode for troubleshooting
-- Will print detailed information to the console
Config.Debug = false

--[[ THEME CONFIGURATION ]]
Config.Theme = {
    -- Color scheme selection
    -- Options:
    -- 'modern_dark'  - Sleek dark UI with accent colors
    -- 'cyberpunk'    - Vibrant colors with cyber aesthetic
    -- 'professional' - Clean and professional look
    -- 'minimalist'   - Clean and simple design
    -- 'warm'         - Warm and inviting colors
    colorScheme = 'warm',

    -- Layout selection
    -- Options:
    -- 'modern'    - Clean and spacious layout
    -- 'compact'   - Minimal space usage
    -- 'minimal'   - Bare essentials only
    -- 'centered'  - Balanced design
    -- 'extended'  - Full information spread
    layout = 'extended'
}

--[[ MENU DISPLAY SETTINGS ]]
Config.Title = 'Nexure Store'        -- Main title in the pause menu
Config.Subtitle = 'Welcome!'         -- Subtitle text

--[[ COMPONENT CONFIGURATION ]]
Config.Components = {
    -- Player Information Component
    player = {
        enabled = true,              -- Master switch for player info
        show = {
            name = true,             -- Show player name
            id = true               -- Show player ID
        },
        format = {
            id_prefix = 'ID:',       -- Text before player ID
            separator = '|'          -- Separator between elements
        }
    },

    -- Money Display Component
    money = {
        enabled = true,              -- Master switch for money display
        show = {
            cash = true,             -- Show cash balance
            bank = true             -- Show bank balance
        },
        format = {
            currency = '$',          -- Currency symbol
            separator = ','          -- Thousand separator
        }
    },

    -- Job Information Component
    job = {
        enabled = true,              -- Master switch for job info
        show = {
            label = true,            -- Show job name
            grade = true            -- Show job grade/rank
        },
        format = {
            separator = '-'          -- Separator between job and grade
        }
    },

    -- Time and Date Component
    datetime = {
        enabled = true,              -- Master switch for time/date
        show = {
            time = true,             -- Show current time
            date = true             -- Show current date
        },
        format = {
            -- Time format options:
            -- %H - Hours (24-hour)
            -- %I - Hours (12-hour)
            -- %M - Minutes
            -- %S - Seconds
            -- %p - AM/PM
            time = '%H:%M:%S',       

            -- Date format options:
            -- %Y - Year (four digits)
            -- %y - Year (two digits)
            -- %m - Month (number)
            -- %B - Month (full name)
            -- %b - Month (abbreviated)
            -- %d - Day of month
            date = '%Y-%m-%d'        
        }
    },

    -- Server Information Component
    server = {
        enabled = true,              -- Master switch for server info
        show = {
            players = true,          -- Show player count
            ping = true             -- Show ping
        },
        format = {
            separator = '|',         -- Separator between elements
            ping_suffix = 'ms'       -- Suffix for ping display
        }
    }
}

--[[ UPDATE INTERVALS ]]
-- All values are in milliseconds (1000 ms = 1 second)
-- Increase values to improve performance
-- Decrease values for more frequent updates
Config.UpdateIntervals = {
    stats = 1000,     -- General stats update (1 second)
    money = 5000,     -- Money update (5 seconds)
    job = 10000,      -- Job update (10 seconds)
    datetime = 1000,  -- Time/date update (1 second)
    server = 2000     -- Server info update (2 seconds)
}

-- Apply theme colors and layout
local selectedTheme = Themes.Colors[Config.Theme.colorScheme] or Themes.Colors.modern_dark
local selectedLayout = Themes.Layouts[Config.Theme.layout] or Themes.Layouts.modern

-- Apply colors from theme
for component, colors in pairs(selectedTheme) do
    if Config.Components[component] then
        Config.Components[component].colors = colors
    end
end

-- Apply layout settings
Config.Layout = selectedLayout

return Config 