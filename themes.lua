local Themes = {}

-- Color Schemes
Themes.Colors = {
    -- Modern Dark theme (sleek dark UI with accent colors)
    modern_dark = {
        player = {
            name = '~w~',     -- White
            id = '~c~',       -- Grey
            separator = '~s~'  -- Default
        },
        money = {
            cash = '~g~',     -- Green
            bank = '~b~',     -- Blue
            currency = '~w~',  -- White
            separator = '~s~', -- Default
            text = '~w~'      -- White
        },
        job = {
            label = '~w~',     -- White
            grade = '~c~',     -- Grey
            separator = '~s~',  -- Default
            unemployed = '~r~', -- Red
            employed = '~g~'    -- Green
        },
        datetime = {
            time = '~w~',     -- White
            date = '~c~',     -- Grey
            separator = '~s~'  -- Default
        },
        server = {
            players = '~w~',   -- White
            separator = '~s~', -- Default
            ping = {
                good = '~g~',  -- Green
                medium = '~y~', -- Yellow
                bad = '~r~'    -- Red
            }
        }
    },

    -- Neon Cyberpunk theme (vibrant colors with cyber aesthetic)
    cyberpunk = {
        player = {
            name = '~p~',     -- Purple
            id = '~b~',       -- Blue
            separator = '~y~'  -- Yellow
        },
        money = {
            cash = '~g~',     -- Green
            bank = '~b~',     -- Blue
            currency = '~y~',  -- Yellow
            separator = '~w~', -- White
            text = '~p~'      -- Purple
        },
        job = {
            label = '~b~',     -- Blue
            grade = '~p~',     -- Purple
            separator = '~y~',  -- Yellow
            unemployed = '~r~', -- Red
            employed = '~g~'    -- Green
        },
        datetime = {
            time = '~y~',     -- Yellow
            date = '~p~',     -- Purple
            separator = '~b~'  -- Blue
        },
        server = {
            players = '~p~',   -- Purple
            separator = '~y~', -- Yellow
            ping = {
                good = '~g~',  -- Green
                medium = '~y~', -- Yellow
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
            cash = '~g~',     -- Green
            bank = '~b~',     -- Blue
            currency = '~s~',  -- Default
            separator = '~c~', -- Grey
            text = '~s~'      -- Default
        },
        job = {
            label = '~s~',     -- Default
            grade = '~c~',     -- Grey
            separator = '~c~',  -- Grey
            unemployed = '~r~', -- Red
            employed = '~g~'    -- Green
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
                good = '~g~',  -- Green
                medium = '~y~', -- Yellow
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
            currency = '~c~',  -- Grey
            separator = '~c~', -- Grey
            text = '~c~'      -- Grey
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
                good = '~w~',  -- White
                medium = '~c~', -- Grey
                bad = '~r~'    -- Red
            }
        }
    },

    -- Warm theme (warm and inviting colors)
    warm = {
        player = {
            name = '~o~',     -- Orange
            id = '~y~',       -- Yellow
            separator = '~w~'  -- White
        },
        money = {
            cash = '~g~',     -- Green
            bank = '~b~',     -- Blue
            currency = '~o~',  -- Orange
            separator = '~w~', -- White
            text = '~y~'      -- Yellow
        },
        job = {
            label = '~o~',     -- Orange
            grade = '~y~',     -- Yellow
            separator = '~w~',  -- White
            unemployed = '~r~', -- Red
            employed = '~g~'    -- Green
        },
        datetime = {
            time = '~o~',     -- Orange
            date = '~y~',     -- Yellow
            separator = '~w~'  -- White
        },
        server = {
            players = '~o~',   -- Orange
            separator = '~w~', -- White
            ping = {
                good = '~g~',  -- Green
                medium = '~y~', -- Yellow
                bad = '~r~'    -- Red
            }
        }
    }
}

-- Layout Presets
Themes.Layouts = {
    -- Modern layout (clean and spacious)
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
            'player',
            'money',
            'job',
            'datetime',
            'server'
        }
    },

    -- Compact layout (minimal space usage)
    compact = {
        alignment = 'right',
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
            'job'
        }
    },

    -- Minimal layout (bare essentials)
    minimal = {
        alignment = 'right',
        spacing = 0.8,
        padding = {
            top = 5,
            right = 8,
            bottom = 5,
            left = 8
        },
        order = {
            'player',
            'money'
        }
    },

    -- Centered layout (balanced design)
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
            'money'
        }
    },

    -- Extended layout (full information spread)
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

return Themes 