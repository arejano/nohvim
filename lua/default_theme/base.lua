local base = {
  Normal = { fg = C.fg, bg = C.bg },
  Comment = { fg = C.grey_2, bg = C.none },
  Constant = { fg = C.yellow, bg = C.none },
  String = { fg = C.green, bg = C.none },
  Character = { fg = C.green, bg = C.none },
  Number = { fg = C.orange_2, bg = C.none},
  Boolean = { fg = C.blue, bg = C.none },
  Float = { fg = C.yellow, bg = C.none },
  Identifier = { fg = C.blue, bg = C.none },
  Function = { fg = C.yellow, bg = C.none },
  Statement = { fg = C.purple, bg = C.none },
  Conditional = { fg = C.black, bg = C.red_4},
  Repeat = { fg = C.purple, bg = C.none },
  Label = { fg = C.blue, bg = C.none },
  Operator = { fg = C.purple, bg = C.none },
  Keyword = { fg = C.purple, bg = C.none },
  Exception = { fg = C.purple, bg = C.none },
  Preproc = { fg = C.yellow, bg = C.none },
  Include = { fg = C.purple, bg = C.none },
  Define = { fg = C.purple, bg = C.none },
  Title = { fg = C.cyan, bg = C.none },
  Macro = { fg = C.purple, bg = C.none },
  PreCondit = { fg = C.blue, bg = C.none },
  Type = { fg = C.blue, bg = C.none },
  StorageClass = { fg = C.blue, bg = C.none },
  Structure = { fg = C.yellow, bg = C.none },
  Typedef = { fg = C.yellow, bg = C.none },
  Special = { fg = C.blue, bg = C.none },
  SpecialComment = { fg = C.grey, bg = C.none },
  Error = { fg = C.red, bg = C.none },
  Todo = { fg = C.purple, bg = C.none },
  Underlined = { fg = C.cyan, bg = C.none },
  Cursor = { fg = C.none, bg = C.none },
  ColorColumn = { fg = C.none, bg = C.grey_4 },
  CursorLineNr = { fg = C.white, bg = C.grey_1},
  Conceal = { fg = C.grey, bg = C.none },
  CursorColumn = { fg = C.none, bg = C.cursorLine},
  CursorLine = { fg = C.none, bg = C.cursorLine},
  Directory = { fg = C.blue, bg = C.none },
  DiffAdd = { fg = C.grey_3, bg = C.green },
  DiffChange = { fg = C.yellow, bg = C.none },
  DiffDelete = { fg = C.grey_3, bg = C.red },
  DiffText = { fg = C.grey_3, bg = C.yellow },
  ErrorMsg = { fg = C.red, bg = C.none },
  VertSplit = { fg = C.split_line, bg = C.none },
  Folded = { fg = C.grey, bg = C.none },
  FoldColumn = { fg = C.none, bg = C.none },
  IncSearch = { fg = C.yellow, bg = C.grey },
  LineNr = { fg = C.fg, bg = C.bg},
  NonText = { fg = C.grey_1, bg = C.none },
  Pmenu = { fg = C.fg, bg = C.black_1 },
  PmenuSel = { fg = C.none, bg = C.grey_4 },
  PmenuSbar = { fg = C.none, bg = C.grey_3 },
  PmenuThumb = { fg = C.none, bg = C.fg },
  Question = { fg = C.purple, bg = C.none },
  QuickFixLine = { fg = C.grey_3, bg = C.yellow },
  Search = { fg = C.grey_3, bg = C.yellow },
  SignColumn = { fg = C.none, bg = C.none },
  SpecialKey = { fg = C.grey_1, bg = C.none },
  SpellBad = { fg = C.red, bg = C.none },
  SpellCap = { fg = C.yellow, bg = C.none },
  SpellLocal = { fg = C.yellow, bg = C.none },
  SpellRare = { fg = C.yellow, bg = C.none },
  StatusLine = { fg = C.white, bg = C.cursorLine},
  StatusLineNC = { fg = C.grey, bg = C.none },
  StatusLineTerm = { fg = C.fg, bg = C.grey_4 },
  StatusLineTermNC = { fg = C.grey_4, bg = C.none },
  TabLine = { fg = C.grey, bg = C.none },
  TabLineSel = { fg = C.fg, bg = C.none },
  TabLineFill = { fg = C.none, bg = C.coal},
  Terminal = { fg = C.fg, bg = C.grey_3 },
  Visual = { fg = C.none, bg = C.grey_5 },
  VisualNOS = { fg = C.grey_5, bg = C.none },
  WarningMsg = { fg = C.yellow, bg = C.none },
  WildMenu = { fg = C.grey_3, bg = C.blue },
  EndOfBuffer = { fg = C.bg, bg = C.none },
  CmpItemAbbrDefault = { fg = C.fg },
  CmpItemAbbrDeprecatedDefault = { fg = C.grey_2 },
  CmpItemAbbrMatchDefault = { fg = C.white },
  CmpItemAbbrMatchFuzzyDefault = { fg = C.white },
  CmpItemKind = { fg = C.yellow },
  CmpItemAbbr = { fg = C.fg },
  CmpItemMenuDefault = { fg = C.fg },
  FloatBorder = { bg = C.none },
  MatchParen = { fg = C.none, bg = C.grey_5 },
}

return base