local Themes = {}

-- Color Schemes
Themes.Colors = {
    -- Modern Dark theme (sleek dark UI with accent colors)
    modern_dark = {
        player = {
            name = '~b~',     -- Blue
            id = '~c~',       -- Grey
            separator = '~s~'  -- Default
        },
        money = {
            cash = '~b~',     -- Blue
            bank = '~b~',     -- Blue
            currency = '~w~',  -- White
            separator = '~s~', -- Default
            text = '~w~'      -- White
        },
        tabs = {
            map = '~b~',      -- Blue
            status = '~b~',   -- Blue
            game = '~b~',     -- Blue
            info = '~b~',     -- Blue
            settings = '~b~',  -- Blue
            editor = '~c~',   -- Grey
            gallery = '~b~'   -- Blue
        },
        job = {
            label = '~b~',     -- Blue
            grade = '~c~',     -- Grey
            separator = '~s~',  -- Default
            unemployed = '~c~', -- Grey
            employed = '~b~'    -- Blue
        },
        datetime = {
            time = '~b~',     -- Blue
            date = '~c~',     -- Grey
            separator = '~s~'  -- Default
        },
        server = {
            players = '~b~',   -- Blue
            separator = '~s~', -- Default
            ping = {
                good = '~b~',   -- Blue
                medium = '~c~', -- Grey
                bad = '~r~'    -- Red
            }
        }
    },

    -- Neon Cyberpunk theme (vibrant colors with cyber aesthetic)
    cyberpunk = {
        player = {
            name = '~p~',     -- Purple
            id = '~b~',       -- Blue
            separator = '~p~'  -- Purple
        },
        money = {
            cash = '~p~',     -- Purple
            bank = '~p~',     -- Purple
            currency = '~b~',  -- Blue
            separator = '~p~', -- Purple
            text = '~b~'      -- Blue
        },
        tabs = {
            map = '~p~',      -- Purple
            status = '~b~',   -- Blue
            game = '~p~',     -- Purple
            info = '~b~',     -- Blue
            settings = '~p~',  -- Purple
            editor = '~b~',   -- Blue
            gallery = '~p~'   -- Purple
        },
        job = {
            label = '~p~',     -- Purple
            grade = '~b~',     -- Blue
            separator = '~p~',  -- Purple
            unemployed = '~r~', -- Red
            employed = '~p~'    -- Purple
        },
        datetime = {
            time = '~p~',     -- Purple
            date = '~b~',     -- Blue
            separator = '~p~'  -- Purple
        },
        server = {
            players = '~p~',   -- Purple
            separator = '~p~', -- Purple
            ping = {
                good = '~p~',   -- Purple
                medium = '~b~', -- Blue
                bad = '~r~'    -- Red
            }
        }
    },

    -- Professional Light theme (clean and professional look)
    professional = {
        player = {
            name = '~s~',     -- Default
            id = '~c~',       -- Grey
            separator = '~c~'  -- Grey
        },
        money = {
            cash = '~s~',     -- Default
            bank = '~s~',     -- Default
            currency = '~s~',  -- Default
            separator = '~c~', -- Grey
            text = '~s~'      -- Default
        },
        tabs = {
            map = '~s~',      -- Default
            status = '~s~',   -- Default
            game = '~s~',     -- Default
            info = '~s~',     -- Default
            settings = '~s~',  -- Default
            editor = '~c~',   -- Grey
            gallery = '~s~'   -- Default
        },
        job = {
            label = '~s~',     -- Default
            grade = '~c~',     -- Grey
            separator = '~c~',  -- Grey
            unemployed = '~c~', -- Grey
            employed = '~s~'    -- Default
        },
        datetime = {
            time = '~s~',     -- Default
            date = '~c~',     -- Grey
            separator = '~c~'  -- Grey
        },
        server = {
            players = '~s~',   -- Default
            separator = '~c~', -- Grey
            ping = {
                good = '~s~',   -- Default
                medium = '~c~', -- Grey
                bad = '~r~'    -- Red
            }
        }
    },

    -- Minimalist theme (clean and simple)
    minimalist = {
        player = {
            name = '~w~',     -- White
            id = '~c~',       -- Grey
            separator = '~c~'  -- Grey
        },
        money = {
            cash = '~w~',     -- White
            bank = '~w~',     -- White
            currency = '~w~',  -- White
            separator = '~c~', -- Grey
            text = '~w~'      -- White
        },
        tabs = {
            map = '~w~',      -- White
            status = '~w~',   -- White
            game = '~w~',     -- White
            info = '~w~',     -- White
            settings = '~w~',  -- White
            editor = '~c~',   -- Grey
            gallery = '~w~'   -- White
        },
        job = {
            label = '~w~',     -- White
            grade = '~c~',     -- Grey
            separator = '~c~',  -- Grey
            unemployed = '~c~', -- Grey
            employed = '~w~'    -- White
        },
        datetime = {
            time = '~w~',     -- White
            date = '~c~',     -- Grey
            separator = '~c~'  -- Grey
        },
        server = {
            players = '~w~',   -- White
            separator = '~c~', -- Grey
            ping = {
                good = '~w~',   -- White
                medium = '~c~', -- Grey
                bad = '~c~'    -- Grey
            }
        }
    },

    -- Warm theme (warm and inviting colors)
    warm = {
        player = {
            name = '~o~',     -- Orange
            id = '~y~',       -- Yellow
            separator = '~o~'  -- Orange
        },
        money = {
            cash = '~o~',     -- Orange
            bank = '~o~',     -- Orange
            currency = '~o~',  -- Orange
            separator = '~o~', -- Orange
            text = '~y~'      -- Yellow
        },
        tabs = {
            map = '~o~',      -- Orange
            status = '~y~',   -- Yellow
            game = '~o~',     -- Orange
            info = '~y~',     -- Yellow
            settings = '~o~',  -- Orange
            editor = '~y~',   -- Yellow
            gallery = '~o~'   -- Orange
        },
        job = {
            label = '~o~',     -- Orange
            grade = '~y~',     -- Yellow
            separator = '~o~',  -- Orange
            unemployed = '~r~', -- Red
            employed = '~o~'    -- Orange
        },
        datetime = {
            time = '~o~',     -- Orange
            date = '~y~',     -- Yellow
            separator = '~o~'  -- Orange
        },
        server = {
            players = '~o~',   -- Orange
            separator = '~o~', -- Orange
            ping = {
                good = '~o~',   -- Orange
                medium = '~y~', -- Yellow
                bad = '~r~'    -- Red
            }
        }
    }
}

-- Layout Presets
Themes.Layouts = {
    -- Modern layout (clean and spacious with full information)
    modern = {
        alignment = 'right',
        spacing = 2.0,
        padding = {
            top = 25,
            right = 30,
            bottom = 25,
            left = 30
        },
        order = {
            'datetime',
            'player',
            'money',
            'job',
            'server'
        }
    },

    -- Compact layout (condensed with essential info)
    compact = {
        alignment = 'left',
        spacing = 0.5,
        padding = {
            top = 2,
            right = 5,
            bottom = 2,
            left = 5
        },
        order = {
            'player',
            'money',
            'server'
        }
    },

    -- Minimal layout (bare essentials only)
    minimal = {
        alignment = 'right',
        spacing = 1.0,
        padding = {
            top = 10,
            right = 15,
            bottom = 10,
            left = 15
        },
        order = {
            'player',
            'money'
        }
    },

    -- Centered layout (balanced design with key info)
    centered = {
        alignment = 'center',
        spacing = 2.5,
        padding = {
            top = 35,
            right = 0,
            bottom = 35,
            left = 0
        },
        order = {
            'datetime',
            'player',
            'money',
            'server'
        }
    },

    -- Extended layout (comprehensive with all components)
    extended = {
        alignment = 'left',
        spacing = 1.8,
        padding = {
            top = 20,
            right = 40,
            bottom = 20,
            left = 40
        },
        order = {
            'datetime',
            'server',
            'player',
            'job',
            'money'
        }
    }
}

_G.Themes = Themes  -- Make Themes globally accessible
return Themes 