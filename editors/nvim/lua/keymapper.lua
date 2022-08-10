local keymapper = {}
local opts = {}

function opts:new(instance)
  instance = instance
    or {
      options = {
        silent = false,
        nowait = false,
        expr = false,
        noremap = false,
      },
    }
  setmetatable(instance, self)
  self.__index = self
  return instance
end

function keymapper.silent(opt)
  return function()
    opt.silent = true
  end
end

function keymapper.noremap(opt)
  return function()
    opt.noremap = true
  end
end

function keymapper.expr(opt)
  return function()
    opt.expr = true
  end
end

function keymapper.remap(opt)
  return function()
    opt.remap = true
  end
end

function keymapper.nowait(opt)
  return function()
    opt.nowait = true
  end
end

function keymapper.new_opts(...)
  local args = { ... }
  local o = opts:new()

  if #args == 0 then
    return o.options
  end

  for _, arg in pairs(args) do
    if type(arg) == 'string' then
      o.options.desc = arg
    else
      arg(o.options)()
    end
  end
  return o.options
end

function keymapper.cmd(str)
  return '<cmd>' .. str .. '<CR>'
end

-- visual
function keymapper.cu(str)
  return '<C-u><cmd>' .. str .. '<CR>'
end

--@private
local keymapper_set = function(mode, tbl)
  vim.validate({
    tbl = { tbl, 'table' },
  })
  local len = #tbl
  if len < 2 then
    vim.notify('keymapmust has rhs')
    return
  end

  local options = len == 3 and tbl[3] or keymapper.new_opts()

  vim.keymap.set(mode, tbl[1], tbl[2], options)
end

local function map(mod)
  return function(tbl)
    vim.validate({
      tbl = { tbl, 'table' },
    })

    if type(tbl[1]) == 'table' and type(tbl[2]) == 'table' then
      for _, v in pairs(tbl) do
        keymapper_set(mod, v)
      end
    else
      keymapper_set(mod, tbl)
    end
  end
end

keymapper.nmap = map('n')
keymapper.imap = map('i')
keymapper.cmap = map('c')
keymapper.vmap = map('v')
keymapper.xmap = map('x')
keymapper.tmap = map('t')

return keymapper
