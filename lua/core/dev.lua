_G.dev = {}
local A = vim.api
local V = vim.fn

local Border = require("plenary.window.border")
local Window = require("plenary.window")

local popup = {}

popup._pos_map = {

}

function dev.createPopup(what)
  local bufnr
  local isN = isNumber(what)
  print(isN)
end

function isNumber(number)
  if type(number) == 'number' then
    return true
  else
    return false
  end
end

function dev.teste()
  local position = dev.get_position()
  print(vim.inspect(position))
end

function dev.commentAndClone()
  print("Comment and clonning running on dev")
  require("Comment.api").toggle_current_linewise(V.visualmode())
end

function dev.get_position()
  local row,col = unpack(A.nvim_win_get_cursor(0))
  local position = {
    col = col,
    row = row,
    sum = row + col,
  }
  return position
end


