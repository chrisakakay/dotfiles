local function getLen(str, start_pos)
  local byte = string.byte(str, start_pos)
  if not byte then
    return nil
  end
  return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
end

local function colorize(_header, _header_color_map, _colors)
  for letter, color in pairs(_colors) do
    local color_name = 'FoxNordColor' .. letter
    vim.api.nvim_set_hl(0, color_name, color)
    _colors[letter] = color_name
  end

  local colorized = {}

  for i, line in ipairs(_header_color_map) do
    local colorized_line = {}
    local pos = 0

    for j = 1, #line do
      local start = pos
      pos = pos + getLen(_header[i], start + 1)

      local color_name = _colors[line:sub(j, j)]
      if color_name then
        table.insert(colorized_line, { color_name, start, pos })
      end
    end

    table.insert(colorized, colorized_line)
  end

  return colorized
end

return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local header = {
      '   █████          ███  █████████████████████████████████████████████████     ',
      ' ███████████████████████████████████████████████████████████████████████████ ',
      '█████████████████████████████████████████████████████████████████████████████',
      '█████████████████████████████████████████████████████████████████████████████',
      '█████████████████████████████████████████████████████████████████████████████',
      '█████████████████████████████████████████████████████████████████████████████',
      ' ████████████████████████████████████████████████████████████████████████████',
      ' ███████████████████████████████████████████████████████████████████████████ ',
      ' ███████████████████████████████████████████████████████████████████████████ ',
      ' ███████████████████████████████████████████████████████████████████████████ ',
      ' ███████████████████████████████████████████████████████████████████████████ ',
      ' ███████████████████████████████████████████████████████████████████████████ ',
      '  ██████████████████████████████████████████████████████████████████████████ ',
      '  ██████████████████████████████████████████████████████████████████████████ ',
      '  ███████████████████████████████████████████████████████████████████████████',
      ' ████████████████████████████████████████████████████████████████████████████',
      ' ████████████████████████████████████████████████████████████████████████████',
      ' ████████████████████████████████████████████████████████████████████████████',
      '  ██████████████████████████████████████████████████████████████████████████ ',
      '   █████████████████████████████████████████     ██████████████    ████████  ',
    }
    local color_map = {
      '---BBBBB----------BBB--BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB-----',
      '-BBBYYYYBBBBBBBBBB...BB..........BBDDDPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPBPPBBBB-',
      'BBBYYYYYYYYYYBPBB................BDDDPPPPBPPPBBBBBBBBBBBBBBBBBBBBBBPPBBPPPPBB',
      'BBBYYYYYYYYYYYBB..................BBPPPPPPPBB......................BBPPPPPPBB',
      'BBBYYYYYYYYYYYYYBBBBBBBB............BBPPPPB..BBB..B...BBB.BBB.B..B...BPPPPPBB',
      'BBBYYYYYYYYYYYYYYYYYYYYYBB...BBBB....BPPPB...B..B.B...B...B...B..B....BPPPPBB',
      '-BBYYYYYYYYYYYYYYBBBBBBYYYBBB....B...BDPBB...BBB..B...BBB.BBB.BBBB.....BPPBBB',
      '-BBBYYYYYYYYYYYBB......BBYYYB.BB.B.BBDDDB....B..B.B...B...B...B..B.....BPPBB-',
      '-BBBB...YYYYYYB.....BBB..BBYB....B.BDDDDBB...BBB..BBB.BBB.BBB.B..B...BBPPPBB-',
      '-BBPB....YYYYYBB........BBBBBBBBB.BDDDBB...........................BBPPPPPBB-',
      '-BBPPB..........BBBBBBBBB..B....B..BBDDBBBBBBBBBBB...........BBBBBBPPPPPPPBB-',
      '-BBBBB...........BB..BB.BBBBB...B....BDDPPPPPPPPPPBBBBBBBBBBBPPPPPPPPPPPPPBB-',
      '--BB..............B.BBBBBBBBBB..B..BBBDDDPPPPBPPPPPPPPPPPPPPPPPPBBBPPPPPPPBB-',
      '--BBB............B----------B..B..BDDDDDDPPPBBBPPPPPPPPPPPPPPPPPPBPPPPPPPPBB-',
      '--BBPB..........B.BBBBBBBBBB..B..BDDDDDDDPPPPBPPPPPPPPPPPPPPPPPPPPPPPPPPPPBBB',
      '-BBPPPBBB..................BBB...BDDDPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPBB',
      '-BBPPPPPPBBBB......BBBBBBBBDDDBBBDDDDPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPBB',
      '-BBPPPPPPPPBBBBBBBB..BGGGGBDDDDDPDDDDPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPBB',
      '--BBPPPPPPBBGGGGGGGBBGGGGGGBDDDDPPPPPPPPPPPPBBBBBPPPPPPPPPPPPPPBBBBPPPPPPPBB-',
      '---BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB-----BBBBBBBBBBBBBB----BBBBBBBB--',
    }
    local color_codes = {
      ['-'] = { fg = "#bf616a" }, -- Empty (Red)
      ['B'] = { fg = "#3b4252" },  -- Black
      ['G'] = { fg = "#434c5e" },  -- Gray (kind of)
      ['.'] = { fg = "#d8dee9" },  -- White
      ['Y'] = { fg = "#ebcb8b" }, -- Yellow
      ['P'] = { fg = "#b48ead" }, -- Puple
      ['D'] = { fg = "#5e81ac" }, -- Dark purple
    }

    -- dashboard.section.header.val = {}
    dashboard.section.header.val = header
    dashboard.section.header.opts = {
      hl = colorize(header, color_map, color_codes),
      position = 'center'
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "> New file", "<cmd>ene<CR>"),
      dashboard.button("SPC ff", "> Find file", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fr", "> Recent", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("SPC wr", "> Restore session", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", "> Quit", "<cmd>qa<CR>"),
    }

    alpha.setup(dashboard.opts)

    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end
}
