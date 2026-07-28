local wezterm = require("wezterm")
local utils = require("utils")

---------------------------------------------------------------
--- keybinds
---------------------------------------------------------------

-- bell が鳴ったタブの記録。下のキーバインドのコールバックが参照するので、
-- local 宣言を default_keybinds より前に置く。後ろに置くとコールバック側は
-- 同名のグローバル変数 (nil) を見てしまう
local bell_tabs = {}

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
    {key = "b", mods = "ALT", action = wezterm.action({ScrollByPage = -1})},
    {key = "f", mods = "ALT", action = wezterm.action({ScrollByPage = 1})},
    {key = "[", mods = "CTRL", action = wezterm.action({ActivateTabRelative = -1})},
    {key = "]", mods = "CTRL", action = wezterm.action({ActivateTabRelative = 1})},
    {key = "[", mods = "CTRL|SHIFT", action = wezterm.action({MoveTabRelative = -1})},
    {key = "]", mods = "CTRL|SHIFT", action = wezterm.action({ActivateTabRelative = 1})},
--    {key = "e", mods = "CTRL", action = wezterm.action({EmitEvent = "trigger-nvim-with-scrollback"})},
    {key = "t", mods = "CMD", action = wezterm.action({SpawnTab = "CurrentPaneDomain"})},
    {key = "q", mods = "CTRL", action = wezterm.action({CloseCurrentTab = {confirm = false}})},
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
    {key = "j", mods = "ALT|SHIFT|CMD", action = wezterm.action({AdjustPaneSize = {"Down", 1}})},
    -- Jump to next bell (Claude Code response) tab
    {key = "n", mods = "CTRL|SHIFT", action = wezterm.action_callback(function(window, pane)
        for tab_id, _ in pairs(bell_tabs) do
            for _, t in ipairs(window:tabs()) do
                if tostring(t:tab_id()) == tab_id then
                    bell_tabs[tab_id] = nil
                    t:activate()
                    return
                end
            end
        end
    end)},
    -- Open overlay: split current pane bottom 90% and zoom it
    {key = "o", mods = "CTRL|SHIFT", action = wezterm.action_callback(function(window, pane)
        local new_pane = pane:split({
            direction = "Bottom",
            size = {Percent = 90},
        })
        new_pane:activate()
        window:perform_action(wezterm.action.TogglePaneZoomState, new_pane)
    end)},
}

local function create_keybinds()
    return default_keybinds
end

---------------------------------------------------------------
--- wezterm on
---------------------------------------------------------------

wezterm.on("bell", function(window, pane)
    local tab = pane:tab()
    if tab then
        bell_tabs[tostring(tab:tab_id())] = true
    end
end)

wezterm.on(
        "format-tab-title",
        function(tab, tabs, panes, config, hover, max_width)
            local tab_id = tostring(tab.tab_id)

            -- Clear bell marker when tab becomes active
            if tab.is_active then
                bell_tabs[tab_id] = nil
            end

            local user_title = tab.active_pane.user_vars.panetitle
            if user_title ~= nil and #user_title > 0 then
                local marker = bell_tabs[tab_id] and "● " or ""
                return {
                    {Text = marker .. (tab.tab_index + 1) .. ":" .. user_title}
                }
            end

            local cwd = tab.active_pane.current_working_dir
            local title = ""
            if cwd then
                local path = tostring(cwd):gsub("^file://[^/]*", "")
                title = wezterm.truncate_right(utils.basename(path), max_width)
            end
            if title == "" then
                title = wezterm.truncate_right(utils.basename(tab.active_pane.foreground_process_name), max_width)
            end

            local marker = bell_tabs[tab_id] and "● " or ""
            return {
                {Text = marker .. (tab.tab_index + 1) .. ":" .. title}
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
    -- フォント未導入の環境でも読めるよう、標準フォントへ順に落とす
    font = wezterm.font_with_fallback({"UDEV Gothic NF", "Menlo", "Monaco"}),
    font_size = 13,
    use_ime = true,
    color_scheme = "Duotone Dark",
    -- ラベンダー文字 (#b7a1ff) に対し、紫を避けた寒色スレート背景で調和させる
    colors = {
        foreground = "#b7a1ff",
        background = "#171a21",
    },
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
    audible_bell = "Disabled",
    initial_cols = 160,
    window_close_confirmation = 'NeverPrompt',
    initial_rows = 50
}

-- agent-deck は未導入の環境もあるので、読み込めたときだけ適用する
local agent_deck_path = os.getenv("HOME") .. '/.config/wezterm/plugins/wezterm-agent-deck/plugin/init.lua'
local agent_deck_ok, agent_deck = pcall(dofile, agent_deck_path)

if agent_deck_ok and type(agent_deck) == "table" and type(agent_deck.apply_to_config) == "function" then
    agent_deck.apply_to_config(config, {
        update_interval = 500,  -- ms between status checks

        colors = {
            working = '#A6E22E',   -- green: agent processing
            waiting = '#E6DB74',   -- yellow: needs input
            idle = '#66D9EF',      -- blue: ready
            inactive = '#888888',  -- gray: no agent
        },

        icons = {
            style = 'unicode',  -- or 'nerd', 'emoji'
            unicode = { working = '●', waiting = '◔', idle = '○', inactive = '◌' },
        },

        notifications = {
            enabled = true,
            on_waiting = true,
            backend = 'terminal-notifier',  -- or 'native' (default)
            terminal_notifier = {
                sound = 'default',  -- or 'Ping', 'Glass', 'Funk', etc.
                title = 'WezTerm Agent Deck',  -- notification title
                activate = true,  -- focus WezTerm when notification clicked
            },
        },
    })
end

return config
