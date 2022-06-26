local M = {}

function M.config()
  local status_ok, cinnamon = pcall(require, "cinnamon")
  if status_ok then
    cinnamon.setup(astronvim.user_plugin_opts("plugins.cinnamon", {
      extra_keymaps = false,
      extended_keymaps = false,
      always_scroll = false,    -- Scroll the cursor even when the window hasn't scrolled.
      centered = true,          -- Keep cursor centered in window when using window scrolling.
      default_delay = 0,        -- The default delay (in ms) between each line when scrolling.
      horizontal_scroll = false, -- Enable smooth horizontal scrolling when view shifts left or right.
      scroll_limit = 150,       -- Max number of lines moved before scrolling is skipped.
    }))
  end
end

return M
