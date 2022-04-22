local wezterm = require("wezterm")
local utils = require("utils")

---------------------------------------------------------------
--- keybinds
---------------------------------------------------------------

local default_keybinds = {
    {key = "x", mods = "CMD", action = "ShowDebugOverlay"},
    {key = "b", mods = "CMD", action = "ActivateCopyMode"},
    {key = "c", mods = "CMD", action = wezterm.action({ CopyTo = "Clipboard" }) },
    {key = "v", mods = "CMD", action = wezterm.action({ PasteFrom = "Clipboard" }) },
    {key = "c", mods = "CMD|SHIFT", action = wezterm.action({ CopyTo = "PrimarySelection" }) },
    {key = "v", mods = "CMD|SHIFT", action = wezterm.action({ PasteFrom = "PrimarySelection" }) },
    {key = " ", mods = "CMD|SHIFT", action = "QuickSelect"},
    {key = "=", mods = "CMD", action = "ResetFontSize"},
    {key = "+", mods = "CMD", action = "IncreaseFontSize"},
    {key = "-", mods = "CMD", action = "DecreaseFontSize"},
    {key = "r", mods = "CMD", action = "ReloadConfiguration"},
    {key = "f", mods = "CMD", action = wezterm.action({Search = {CaseSensitiveString = ""}})},
    {key = "w", mods = "CMD", action = wezterm.action({CloseCurrentPane = {confirm = false}})},
    {key = "b", mods = "CTRL", action = wezterm.action({ScrollByPage = -1})},
    {key = "f", mods = "CTRL", action = wezterm.action({ScrollByPage = 1})},
    {key = "[", mods = "CTRL", action = wezterm.action({ActivateTabRelative = -1})},
    {key = "]", mods = "CTRL", action = wezterm.action({ActivateTabRelative = 1})},
    {key = "[", mods = "CTRL|SHIFT", action = wezterm.action({MoveTabRelative = -1})},
    {key = "]", mods = "CTRL|SHIFT", action = wezterm.action({ActivateTabRelative = 1})},
    {key = "e", mods = "CTRL", action = wezterm.action({EmitEvent = "trigger-nvim-with-scrollback"})},
    {key = "x", mods = "CTRL", action = wezterm.action({SpawnTab = "CurrentPaneDomain"})},
    {key = "d", mods = "CTRL", action = wezterm.action({CloseCurrentTab = {confirm = false}})},
    {key = "1", mods = "CTRL", action = wezterm.action({ActivateTab = 0})},
    {key = "2", mods = "CTRL", action = wezterm.action({ActivateTab = 1})},
    {key = "3", mods = "CTRL", action = wezterm.action({ActivateTab = 2})},
    {key = "4", mods = "CTRL", action = wezterm.action({ActivateTab = 3})},
    {key = "5", mods = "CTRL", action = wezterm.action({ActivateTab = 4})},
    {key = "6", mods = "CTRL", action = wezterm.action({ActivateTab = 5})},
    {key = "7", mods = "CTRL", action = wezterm.action({ActivateTab = 6})},
    {key = "8", mods = "CTRL", action = wezterm.action({ActivateTab = 7})},
    {key = "9", mods = "CTRL", action = wezterm.action({ActivateTab = 8})},
    {key = "-", mods = "CTRL", action = wezterm.action({SplitVertical = {domain = "CurrentPaneDomain"}})},
    {key = "\\", mods = "CTRL", action = wezterm.action({SplitHorizontal = {domain = "CurrentPaneDomain"}})},
    {key = "h", mods = "CTRL|SHIFT", action = wezterm.action({ActivatePaneDirection = "Left"})},
    {key = "l", mods = "CTRL|SHIFT", action = wezterm.action({ActivatePaneDirection = "Right"})},
    {key = "k", mods = "CTRL|SHIFT", action = wezterm.action({ActivatePaneDirection = "Up"})},
    {key = "j", mods = "CTRL|SHIFT", action = wezterm.action({ActivatePaneDirection = "Down"})},
    {key = "h", mods = "ALT|SHIFT|CMD", action = wezterm.action({AdjustPaneSize = {"Left", 1}})},
    {key = "l", mods = "ALT|SHIFT|CMD", action = wezterm.action({AdjustPaneSize = {"Right", 1}})},
    {key = "k", mods = "ALT|SHIFT|CMD", action = wezterm.action({AdjustPaneSize = {"Up", 1}})},
    {key = "j", mods = "ALT|SHIFT|CMD", action = wezterm.action({AdjustPaneSize = {"Down", 1}})}
}

local function create_keybinds()
    return default_keybinds
end

---------------------------------------------------------------
--- wezterm on
---------------------------------------------------------------
wezterm.on(
        "format-tab-title",
        function(tab, tabs, panes, config, hover, max_width)
            local user_title = tab.active_pane.user_vars.panetitle
            if user_title ~= nil and #user_title > 0 then
                return {
                    {Text = tab.tab_index + 1 .. ":" .. user_title}
                }
            end

            local title = wezterm.truncate_right(utils.basename(tab.active_pane.foreground_process_name), max_width)
            if title == "" then
                local uri = utils.convert_home_dir(tab.active_pane.current_working_dir)
                local basename = utils.basename(uri)
                if basename == "" then
                    basename = uri
                end
                title = wezterm.truncate_right(basename, max_width)
            end
            return {
                {Text = tab.tab_index + 1 .. ":" .. title}
            }
        end
)

local function update_tmux_style_tab(window, pane)
    local cwd_uri = pane:get_current_working_dir()
    local cwd = ""
    local hostname = ""
    if cwd_uri then
        cwd_uri = cwd_uri:sub(8)
        local slash = cwd_uri:find("/")
        if slash then
            hostname = cwd_uri:sub(1, slash - 1)
            -- Remove the domain name portion of the hostname
            local dot = hostname:find("[.]")
            if dot then
                hostname = hostname:sub(1, dot - 1)
            end
            if hostname ~= "" then
                hostname = "@" .. hostname
            end
            -- and extract the cwd from the uri
            cwd = utils.convert_home_dir(cwd)
        end
    end
    window:set_right_status(
            wezterm.format(
                    {
                        {Attribute = {Underline = "Single"}},
                        {Attribute = {Italic = true}},
                        {Text = cwd .. hostname}
                    }
            )
    )
end

wezterm.on(
        "update-right-status",
        function(window, pane)
            update_tmux_style_tab(window, pane)
        end
)

wezterm.on(
        "window-config-reloaded",
        function(window, pane)
            window:toast_notification("wezterm", "configuration reloaded!", nil, 4000)
        end
)

local io = require("io")
local os = require("os")

wezterm.on(
        "trigger-nvim-with-scrollback",
        function(window, pane)
            local scrollback = pane:get_lines_as_text()
            local name = os.tmpname()
            local f = io.open(name, "w+")
            f:write(scrollback)
            f:flush()
            f:close()
            window:perform_action(
                    wezterm.action(
                            {
                                SpawnCommandInNewTab = {
                                    args = {"nvim", name}
                                }
                            }
                    ),
                    pane
            )
            wezterm.sleep_ms(1000)
            os.remove(name)
        end
)

---------------------------------------------------------------
--- Config
---------------------------------------------------------------
local config = {
    font = wezterm.font("SF Mono Square"),
    font_size = 13.0,
    -- font_rules = {
    -- 	{
    -- 		italic = true,
    -- 		font = wezterm.font("Cica", { italic = true }),
    -- 	},
    -- 	{
    -- 		italic = true,
    -- 		intensity = "Bold",
    -- 		font = wezterm.font("Cica", { weight = "Bold", italic = true }),
    -- 	},
    -- },
    use_ime = true,
    color_scheme = "Duotone Dark",
    hide_tab_bar_if_only_one_tab = true,
    adjust_window_size_when_changing_font_size = false,
    selection_word_boundary = ' \t\n{}[]()"\'`,;:',
    window_padding = {
        left = 5,
        right = 5,
        top = 0,
        bottom = 0
    },
    tab_bar_at_bottom = true,
    disable_default_key_bindings = true,
    keys = default_keybinds,
    -- animation_fps = 10,
    -- enable_wayland = true,
    audible_bell = "Disabled",
    initial_cols = 160,
    initial_rows = 50
}

return config
