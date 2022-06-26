local is_available = astronvim.is_available
local map = vim.keymap.set

map("", "<Space>", "<Nop>") -- disable space because leader

-- Normal --
-- Standard Operations
-- map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "No Highlight" })
map("n", "<leader>u", function()
  astronvim.toggle_url_match()
end, { desc = "Toggle URL Highlights" })
-- map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "gx", function()
  astronvim.url_opener()
end, { desc = "Open the file under cursor with system app" })
map("n", "<C-A>", "<cmd>wa!<cr>", { desc = "Force write ALL" })
map("n", "<C-q>", "<cmd>q!<cr>", { desc = "Force quit" })
map("n", "Q", "<Nop>")


map("n", "<C-s>", "<ESC>:w!<cr>", { desc = "Force write" })
map("i", "<C-s>", "<ESC>:w!<cr>", { desc = "Force write" })
map("v", "<C-s>", "<ESC>:w!<cr>", { desc = "Force write" })

-- Packer
map("n", "<leader>pc", "<cmd>PackerCompile<cr>", { desc = "Packer Compile" })
map("n", "<leader>pi", "<cmd>PackerInstall<cr>", { desc = "Packer Install" })
map("n", "<leader>ps", "<cmd>PackerSync<cr>", { desc = "Packer Sync" })
map("n", "<leader>pS", "<cmd>PackerStatus<cr>", { desc = "Packer Status" })
map("n", "<leader>pu", "<cmd>PackerUpdate<cr>", { desc = "Packer Update" })

-- Bufdelete
if is_available "bufdelete.nvim" then
  map("n", "<leader>c", "<cmd>Bdelete!<cr>", { desc = "Close buffer" })
else
  map("n", "<leader>c", "<cmd>bdelete!<cr>", { desc = "Close buffer" })
end

-- Navigate buffers
if is_available "bufferline.nvim" then
  map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer tab" })
  map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer tab" })
  map("n", ">b", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer tab right" })
  map("n", "<b", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer tab left" })
else
  map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
  map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
end

-- Comment
if is_available "Comment.nvim" then
  map("n", "<leader>/", function()
    require("Comment.api").toggle_current_linewise()
  end, { desc = "Comment line" })
  map(
    "v",
    "<leader>/",
    "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>",
    { desc = "Toggle comment line" }
  )
end

-- GitSigns
if is_available "gitsigns.nvim" then
  map("n", "<leader>Gj", function()
    require("gitsigns").next_hunk()
  end, { desc = "Next git hunk" })
  map("n", "<leader>Gk", function()
    require("gitsigns").prev_hunk()
  end, { desc = "Previous git hunk" })
  map("n", "<leader>Gl", function()
    require("gitsigns").blame_line()
  end, { desc = "View git blame" })
  map("n", "<leader>Gp", function()
    require("gitsigns").preview_hunk()
  end, { desc = "Preview git hunk" })
  map("n", "<leader>Gh", function()
    require("gitsigns").reset_hunk()
  end, { desc = "Reset git hunk" })
  map("n", "<leader>Gr", function()
    require("gitsigns").reset_buffer()
  end, { desc = "Reset git buffer" })
  map("n", "<leader>Gs", function()
    require("gitsigns").stage_hunk()
  end, { desc = "Stage git hunk" })
  map("n", "<leader>Gu", function()
    require("gitsigns").undo_stage_hunk()
  end, { desc = "Unstage git hunk" })
  map("n", "<leader>Gd", function()
    require("gitsigns").diffthis()
  end, { desc = "View git diff" })
end

-- NeoTree
if is_available "neo-tree.nvim" then
  map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Explorer" })
  map("n", "<leader>n", "<cmd>Neotree focus<cr>", { desc = "Focus Explorer" })
end

-- -- Session Manager
-- if is_available "neovim-session-manager" then
--   map("n", "<leader>Sl", "<cmd>SessionManager! load_last_session<cr>", { desc = "Load last session" })
--   map("n", "<leader>Ss", "<cmd>SessionManager! save_current_session<cr>", { desc = "Save this session" })
--   map("n", "<leader>Sd", "<cmd>SessionManager! delete_session<cr>", { desc = "Delete session" })
--   map("n", "<leader>Sf", "<cmd>SessionManager! load_session<cr>", { desc = "Search sessions" })
--   map(
--     "n",
--     "<leader>S.",
--     "<cmd>SessionManager! load_current_dir_session<cr>",
--     { desc = "Load current directory session" }
--   )
-- end

-- LSP Installer
if is_available "nvim-lsp-installer" then
  vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP information" })
  vim.keymap.set("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", { desc = "LSP installer" })
end

-- Smart Splits
if is_available "smart-splits.nvim" then
  -- Better window navigation
  map("n", "<C-h>", function()
    require("smart-splits").move_cursor_left()
  end, { desc = "Move to left split" })
  map("n", "<C-j>", function()
    require("smart-splits").move_cursor_down()
  end, { desc = "Move to below split" })
  map("n", "<C-k>", function()
    require("smart-splits").move_cursor_up()
  end, { desc = "Move to above split" })
  map("n", "<C-l>", function()
    require("smart-splits").move_cursor_right()
  end, { desc = "Move to right split" })

  -- Resize with arrows
  map("n", "<C-Up>", function()
    require("smart-splits").resize_up()
  end, { desc = "Resize split up" })
  map("n", "<C-Down>", function()
    require("smart-splits").resize_down()
  end, { desc = "Resize split down" })
  map("n", "<C-Left>", function()
    require("smart-splits").resize_left()
  end, { desc = "Resize split left" })
  map("n", "<C-Right>", function()
    require("smart-splits").resize_right()
  end, { desc = "Resize split right" })
else
  map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
  map("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
  map("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
  map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
  map("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Resize split up" })
  map("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Resize split down" })
  map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize split left" })
  map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize split right" })
end

-- SymbolsOutline
if is_available "aerial.nvim" then
  map("n", "<F2>", "<cmd>AerialToggle<cr>", { desc = "Symbols outline" })
end

--Harpoon
  map("n", "<A-e>", function()
    require("harpoon.ui").toggle_quick_menu()
  end, { desc = "Search files" })
  map("n", "<A-a>", function()
    require("harpoon.mark").add_file()
  end, { desc = "Add file" })

  map("n", "<A-1>", function()
    require("harpoon.ui").nav_file(1)  
  end, { desc = "To File 1" })
  map("n", "<A-2>", function()
    require("harpoon.ui").nav_file(2)  
  end, { desc = "To File 2" })
  map("n", "<A-3>", function()
    require("harpoon.ui").nav_file(3)  
  end, { desc = "To File 3" })
  map("n", "<A-4>", function()
    require("harpoon.ui").nav_file(4)  
  end, { desc = "To File 4" })

    -- Dev Maps
  -- map("n", "<A-o>", function()
  --   dev.teste()
  -- end, { desc = "to file 1" })
  map("i", "<A-o>", "<ESC>o" , { desc = "New line in INSERT mode" })
  map("i", "<A-u>", "<ESC>u" , { desc = "Undo in INSERT mode" })
  
  map("n", "<A-y>", "yy" , { desc = "Yank Line" })
  map("n", "<A-y>", "yy" , { desc = "Yank Line" })
  map("n", "<y>", "yy" , { desc = "Yank Line" })
  
  -- Zen Mode
  map("n", "<leader>z", ":ZenMode<CR>" , { desc = "Yank Line" })
  
  map('v', '<C-c>', 'y', {desc = "Basic Yank"})
  
  map("n", "<A-d>", "<ESC>yyp" , { desc = "Duplicate Line" })
  map("i", "<A-d>", "<ESC>yyp" , { desc = "Duplicate Line" })
  map("v", "<A-d>", "<ESC>yyp" , { desc = "Duplicate Line" })

  map("n", "<A-r>", "<Plug>RestNvim", { desc = "Rest"})

  -- EdgeMotion
  map("n", "<A-j>", "<Plug>(edgemotion-j)", { desc = "Motion J" })
  map("n", "<A-k>", "<Plug>(edgemotion-k)", { desc = "Motion K" })
  map("v", "<A-j>", "<Plug>(edgemotion-j)", { desc = "Motion J" })
  map("v", "<A-k>", "<Plug>(edgemotion-k)", { desc = "Motion K" })


  map("i", "<A-w>", "<C-o>w<ESC>", { desc = "Edit Next Word" })
  map("i", "<A-b>", "<C-o>b", { desc = "Edit Next Word" })

  map("i", "<A-h>", "<C-o>h", { desc = "" })
  map("i", "<A-l>", "<C-o>l", { desc = "" })

  -- BarBar
  map("n", "<Tab>", "<cmd>:BufferNext<CR>", { desc = "" })
  map("n", "<S-Tab>", "<cmd>:BufferPrevious<CR>", { desc = "" })
  map("n", "<A-,>", ":BufferMovePrevious<CR>", { desc = "" })
  map("n", "<A-.>", ":BufferMoveNext<CR>", { desc = "" })
  map("n", "<A-P>", ":BufferPin<CR>", { desc = "" })
  map("n", "<A-c>", ":BufferClose<CR>", { desc = "" })

  map("n", "<A-p>", "<cmd>:vsplit<CR><cmd>:Telescope find_files<CR>", { desc = "" })

  map('n', '<leader><leader>db', ':DB sqlite:prisma/data.db select * from ', {desc = ""})

  map('n', '<F1>', ':TroubleToggle<CR>', {desc = ""})
  map("n", "<F2>", "<cmd>AerialToggle<cr>", { desc = "Symbols outline" })
  map('n', '<F3>', ':tab DBUI<CR>', {desc = ""})
  map('n', '<F4>', ':', {desc = ""})
  map('n', '<F5>', '<ESC><cmd>RustRun<cr>', {desc = ""})
  map('n', '<F6>', ':e /home/noh/brain/_workingOn.md<CR>', {desc = ""})
  map('n', '<F7>', ':source<cr>', {desc = ""})

  map('n', '<leader>t', '0i* [ ] <ESC><S-a>', {desc = ""})
  
  -- map('n', '<ESC>', '', {desc = ""})
  -- map('i', '<ESC>', '', {desc = ""})
  -- map('v', '<ESC>', '', {desc = ""})
 

  map('n', '<C-a>', 'ggVG', {desc = ""})
  
  map('n', '\\', '<ESC>', {desc = ""})
  map('v', '\\', '<ESC>', {desc = ""})


  --Very Complex Mappings to avoi ESC use
  
  -- Hop
  map("n", "<leader>r", ':HopWord<CR>', { desc = "" })
  -- map("i", "<A-l>", "<C-o>l", { desc = "" })

-- Telescope
if is_available "telescope.nvim" then
  map("n", "<leader>w", function()
    require("telescope.builtin").live_grep()
  end, { desc = "Search words" })
  map("n", "<leader>f", function()
    require("telescope.builtin").find_files()
  end, { desc = "Search files" })
  map("n", "<leader>b", function()
    require("telescope.builtin").buffers()
  end, { desc = "Search buffers" })
  map("n", "<leader>h", function()
    require("telescope.builtin").help_tags()
  end, { desc = "Search help" })
  map("n", "<leader>m", function()
    require("telescope.builtin").marks()
  end, { desc = "Search marks" })
  map("n", "<leader>o", function()
    require("telescope.builtin").oldfiles()
  end, { desc = "Search history" })
  map("n", "<leader>gt", function()
    require("telescope.builtin").git_status()
  end, { desc = "Git status" })
  map("n", "<leader>gb", function()
    require("telescope.builtin").git_branches()
  end, { desc = "Git branchs" })
  map("n", "<leader>gc", function()
    require("telescope.builtin").git_commits()
  end, { desc = "Git commits" })
  map("n", "<C-p>", function()
    require("telescope.builtin").find_files()
  end, { desc = "Search files" })
  map("n", "<leader>sb", function()
    require("telescope.builtin").git_branches()
  end, { desc = "Git branchs" })
  map("n", "<leader>sh", function()
    require("telescope.builtin").help_tags()
  end, { desc = "Search help" })
  map("n", "<leader>sm", function()
    require("telescope.builtin").man_pages()
  end, { desc = "Search man" })
  map("n", "<leader>sn", function()
    require("telescope").extensions.notify.notify()
  end, { desc = "Search notifications" })
  map("n", "<leader>sr", function()
    require("telescope.builtin").registers()
  end, { desc = "Search registers" })
  map("n", "<leader>sk", function()
    require("telescope.builtin").keymaps()
  end, { desc = "Search keymaps" })
  map("n", "<leader>sc", function()
    require("telescope.builtin").commands()
  end, { desc = "Search commands" })
  map("n", "<leader>ls", function()
    local aerial_avail, _ = pcall(require, "aerial")
    if aerial_avail then
      require("telescope").extensions.aerial.aerial()
    else
      require("telescope.builtin").lsp_document_symbols()
    end
  end, { desc = "Search symbols" })
  map("n", "<leader>lR", function()
    require("telescope.builtin").lsp_references()
  end, { desc = "Search references" })
  map("n", "<leader>lD", function()
    require("telescope.builtin").diagnostics()
  end, { desc = "Search diagnostics" })
end

-- Terminal
if is_available "nvim-toggleterm.lua" then
  local toggle_term_cmd = astronvim.toggle_term_cmd
  map("n", "<C-\\>", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
  -- map("n", "<leader>gg", function()
  --   toggle_term_cmd "lazygit"
  -- end, { desc = "ToggleTerm lazygit" })
  -- map("n", "<leader>tn", function()
  --   toggle_term_cmd "node"
  -- end, { desc = "ToggleTerm node" })
  -- map("n", "<leader>tu", function()
  --   toggle_term_cmd "ncdu"
  -- end, { desc = "ToggleTerm NCDU" })
  -- map("n", "<leader>tt", function()
  --   toggle_term_cmd "htop"
  -- end, { desc = "ToggleTerm htop" })
  -- map("n", "<leader>tp", function()
  --   toggle_term_cmd "python"
  -- end, { desc = "ToggleTerm python" })
  -- map("n", "<leader>tl", function()
  --   toggle_term_cmd "lazygit"
  -- end, { desc = "ToggleTerm lazygit" })
  -- map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "ToggleTerm float" })
  -- map("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "ToggleTerm horizontal split" })
  -- map("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "ToggleTerm vertical split" })
end

-- Stay in indent mode
map("v", "<", "<gv", { desc = "unindent line" })
map("v", ">", ">gv", { desc = "indent line" })

--Format
map('n', '<leader>p', ':Neoformat<CR>', opts)

--Trouble Mappings
map('n', '<leader>H', ':TroubleToggle<CR>', opts)
map('v', '<leader>H', ':TroubleToggle<CR>', opts)

-- Splits
map('n', '<leader>v', ':vsplit<CR>', opts)
-- map('n', '<leader>s', ':split<CR>', opts)
map('n', 'ss', ':vsplit<CR>', opts)
map('n', 'sv', ':split<CR>', opts)


-- Improved Terminal Mappings
map("t", "<esc>", "<C-\\><C-n>", { desc = "Terminal normal mode" })
map("t", "jk", "<C-\\><C-n>", { desc = "Terminal normal mode" })
map("t", "<C-h>", "<c-\\><c-n><c-w>h", { desc = "Terminal left window navigation" })
map("t", "<C-j>", "<c-\\><c-n><c-w>j", { desc = "Terminal down window navigation" })
map("t", "<C-k>", "<c-\\><c-n><c-w>k", { desc = "Terminal up window navigation" })
map("t", "<C-l>", "<c-\\><c-n><c-w>l", { desc = "Terminal right window naviation" })


-- Dap
map('n', '<leader>dc', '<cmd>lua require"dap".continue()<CR>') 
map('n', '<leader>dsv', '<cmd>lua require"dap".step_over()<CR>') 
map('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>') 
map('n', '<leader>dso', '<cmd>lua require"dap".step_out()<CR>') 
map('n', '<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>') 
map('n', '<leader>dsbr', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>') 
map('n', '<leader>dsbm', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>') 
map('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>') 
map('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>') 
-- Dap Telescope
map('n', '<leader>dcc', '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
map('n', '<leader>dco', '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
map('n', '<leader>dlb', '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
map('n', '<leader>dv', '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
map('n', '<leader>df', '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')


-- END
