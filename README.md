# Nexure Pausemenu

A modern and highly customizable pause menu replacement for FiveM servers with support for both ESX and QBCore frameworks.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Version](https://img.shields.io/badge/version-1.0.0-green.svg)
![ESX](https://img.shields.io/badge/ESX-supported-brightgreen.svg)
![QBCore](https://img.shields.io/badge/QBCore-supported-brightgreen.svg)

## 🌟 Features

- **Framework Compatibility**
  - Automatic framework detection
  - Full support for ESX and QBCore
  - Seamless integration with existing server data

- **Real-Time Information Display**
  - Player information (Name, ID)
  - Money status (Cash, Bank)
  - Job details (Title, Grade)
  - Server information (Players, Ping)
  - Date and Time

- **Tab Customization**
  - Customizable tab names
  - Theme-based color schemes for tabs
  - Individual color control for each tab
  - Support for all pause menu tabs:
    - Map
    - Status
    - Game
    - Info
    - Settings
    - Gallery
    - R* Editor

- **Customization Options**
  - 5 Pre-built color themes
    - Modern Dark
    - Cyberpunk
    - Professional
    - Minimalist
    - Warm
  - 5 Layout presets
    - Modern
    - Compact
    - Minimal
    - Centered
    - Extended
  - Fully configurable components
  - Customizable update intervals

## 📋 Requirements
- ESX or QBCore Framework

## 💻 Installation

1. Download the latest release
2. Extract the `nxPausemenu` folder to your server's `resources` directory
3. Add `ensure nxPausemenu` to your `server.cfg`
4. Configure the script in `config.lua` to match your preferences
5. Restart your server

## ⚙️ Configuration Guide

### Framework Setup
```lua
-- Framework Configuration
Config.Framework = 'auto'  -- Options: 'auto', 'esx', 'qbcore'
Config.Debug = false      -- Enable for detailed debug information
```

### Theme and Layout
```lua
Config.Theme = {
    -- Color scheme options:
    -- 'modern_dark'  - Sleek dark UI with accent colors
    -- 'cyberpunk'    - Vibrant colors with cyber aesthetic
    -- 'professional' - Clean and professional look
    -- 'minimalist'   - Clean and simple design
    -- 'warm'         - Warm and inviting colors
    colorScheme = 'warm',    

    -- Layout options:
    -- 'modern'    - Clean and spacious
    -- 'compact'   - Minimal space usage
    -- 'minimal'   - Bare essentials
    -- 'centered'  - Balanced design
    -- 'extended'  - Full information spread
    layout = 'extended'      
}

-- Menu Display Settings
Config.Title = 'Nexure Store'        -- Main title displayed in the pause menu
Config.Subtitle = 'Welcome!'         -- Subtitle displayed below the main title

-- Tab Customization
Config.Tabs = {
    enabled = true,              -- Enable custom tab names and colors
    useThemeColors = true,       -- Use theme colors for tabs (if false, uses custom colors)
    customColor = '~w~',         -- Default color for all tabs if useThemeColors is false
    names = {
        map = 'Map',             -- Custom name for Map tab
        status = 'Status',       -- Custom name for Status tab
        game = 'Game',           -- Custom name for Game tab
        info = 'Info',           -- Custom name for Info tab
        settings = 'Settings',   -- Custom name for Settings tab
        editor = 'Editor',       -- Custom name for R* Editor tab
        gallery = 'Gallery'      -- Custom name for Gallery tab
    }
}
```

### Component Configuration
```lua
Config.Components = {
    -- Player Information Component
    player = {
        enabled = true,              -- Enable/disable the entire player component
        show = {
            name = true,             -- Show player name
            id = true               -- Show player ID
        },
        format = {
            id_prefix = 'ID:',       -- Prefix before player ID
            separator = '|'          -- Separator between elements
        }
    },

    -- Money Display Component
    money = {
        enabled = true,              -- Enable/disable money display
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
        enabled = true,              -- Enable/disable job display
        show = {
            label = true,            -- Show job label
            grade = true            -- Show job grade
        },
        format = {
            separator = '-'          -- Separator between job and grade
        }
    },

    -- Time and Date Component
    datetime = {
        enabled = true,              -- Enable/disable time/date display
        show = {
            time = true,             -- Show current time
            date = true             -- Show current date
        },
        format = {
            time = '%H:%M:%S',       -- Time format (24-hour)
            date = '%Y-%m-%d'        -- Date format (YYYY-MM-DD)
        }
    },

    -- Server Information Component
    server = {
        enabled = true,              -- Enable/disable server info
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
```

### Update Intervals
```lua
Config.UpdateIntervals = {
    stats = 1000,     -- General stats update (1 second)
    money = 5000,     -- Money update (5 seconds)
    job = 10000,      -- Job update (10 seconds)
    datetime = 1000,  -- Time/date update (1 second)
    server = 2000     -- Server info update (2 seconds)
}
```

### Color Customization
Each theme comes with predefined colors for both components and tabs. You can customize them in `themes.lua`:

```lua
-- Color Codes Available:
-- ~r~ = Red
-- ~g~ = Green
-- ~b~ = Blue
-- ~y~ = Yellow
-- ~p~ = Purple
-- ~o~ = Orange
-- ~c~ = Grey
-- ~w~ = White
-- ~s~ = Default

-- Example theme structure with tab colors:
modern_dark = {
    tabs = {
        map = '~b~',      -- Blue
        status = '~b~',   -- Blue
        game = '~b~',     -- Blue
        info = '~b~',     -- Blue
        settings = '~b~',  -- Blue
        editor = '~c~',   -- Grey
        gallery = '~b~'   -- Blue
    },
    -- ... other theme components
}
```

### Layout Customization
Each layout can be customized with the following properties:
```lua
{
    alignment = 'right',   -- Text alignment: 'left', 'center', 'right'
    spacing = 2.0,        -- Spacing between elements
    padding = {
        top = 25,         -- Top padding
        right = 30,       -- Right padding
        bottom = 25,      -- Bottom padding
        left = 30         -- Left padding
    }
}
```

## 🔧 Developer Notes

- The script uses native GTA V scaleform methods for UI rendering
- Automatic framework detection with fallback options
- Optimized update intervals to minimize resource usage
- Built-in error handling and debug options

## 📝 Performance Tips

1. **Update Intervals**: Adjust the update intervals based on your needs. Higher intervals mean less frequent updates but better performance.
2. **Component Management**: Disable components you don't need to reduce resource usage.
3. **Debug Mode**: Only enable debug mode when necessary for troubleshooting.

## ❗ Troubleshooting

1. **Framework Not Detected**
   - Ensure your framework (ESX/QBCore) is started before this resource
   - Check if the framework is properly installed
   - Try setting the framework manually in config

2. **UI Not Showing**
   - Verify the resource is started in your server.cfg
   - Check for script errors in server/client console
   - Ensure no other resources are conflicting with the pause menu

3. **Performance Issues**
   - Increase update intervals
   - Disable unused components
   - Check server performance metrics

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Support

For support, issues, or feature requests, please use the GitHub issue tracker.

## 🔄 Updates

Stay tuned for updates by watching this repository or following the releases page. 