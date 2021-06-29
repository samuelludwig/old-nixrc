local _2afile_2a = "/home/dot/.config/nvim/fnl/mappings.fnl"
local _0_0
do
  local name_0_ = "dotfiles.mapping"
  local module_0_
  do
    local x_0_ = package.loaded[name_0_]
    if ("table" == type(x_0_)) then
      module_0_ = x_0_
    else
      module_0_ = {}
    end
  end
  module_0_["aniseed/module"] = name_0_
  module_0_["aniseed/locals"] = ((module_0_)["aniseed/locals"] or {})
  module_0_["aniseed/local-fns"] = ((module_0_)["aniseed/local-fns"] or {})
  package.loaded[name_0_] = module_0_
  _0_0 = module_0_
end
local autoload = (require("aniseed.autoload")).autoload
local function _1_(...)
  local ok_3f_0_, val_0_ = nil, nil
  local function _1_()
    return {autoload("aniseed.core"), autoload("aniseed.nvim.util"), autoload("aniseed.nvim")}
  end
  ok_3f_0_, val_0_ = pcall(_1_)
  if ok_3f_0_ then
    _0_0["aniseed/local-fns"] = {autoload = {core = "aniseed.core", nu = "aniseed.nvim.util", nvim = "aniseed.nvim"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _1_(...)
local core = _local_0_[1]
local nu = _local_0_[2]
local nvim = _local_0_[3]
local _2amodule_2a = _0_0
local _2amodule_name_2a = "dotfiles.mapping"
do local _ = ({nil, _0_0, nil, {{}, nil, nil, nil}})[2] end
local noremap
do
  local v_0_
  local function noremap0(mode, from, to)
    return nvim.set_keymap(mode, from, to, {noremap = true})
  end
  v_0_ = noremap0
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["noremap"] = v_0_
  noremap = v_0_
end
local nnoremap
do
  local v_0_
  local function nnoremap0(from, to)
    return noremap("n", from, to)
  end
  v_0_ = nnoremap0
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["nnoremap"] = v_0_
  nnoremap = v_0_
end
local inoremap
do
  local v_0_
  local function inoremap0(from, to)
    return noremap("i", from, to)
  end
  v_0_ = inoremap0
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["inoremap"] = v_0_
  inoremap = v_0_
end
local vnoremap
do
  local v_0_
  local function vnoremap0(from, to)
    return noremap("v", from, to)
  end
  v_0_ = vnoremap0
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["vnoremap"] = v_0_
  vnoremap = v_0_
end
local toggle_background
do
  local v_0_
  local function toggle_background0()
    local current_background = nvim.nvim_get_var("background")
    if (current_background == "dark") then
      nvim.g.background = "light"
      return nil
    else
      nvim.g.background = "dark"
      return nil
    end
  end
  v_0_ = toggle_background0
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["toggle-background"] = v_0_
  toggle_background = v_0_
end
nnoremap("<space>", "<nop>")
nvim.g.mapleader = " "
nvim.g.maplocalleader = ","
inoremap("<C-C>", "<C-X><C-O>")
nnoremap("<Leader>b", toggle_background())
local telescope_cmd
do
  local v_0_
  local function telescope_cmd0(command)
    return core.concat({"<cmd>Telescope ", command, "<cr>"})
  end
  v_0_ = telescope_cmd0
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["telescope-cmd"] = v_0_
  telescope_cmd = v_0_
end
nnoremap("<Leader>ff", telescope_cmd("find_files"))
nnoremap("<Leader>fg", telescope_cmd("live_grep"))
nnoremap("<Leader>fb", telescope_cmd("buffers"))
nnoremap("<Leader>fh", telescope_cmd("help_tags"))
nnoremap("<Leader>rs", "resize<cr>")
local get_char_from_user
do
  local v_0_
  local function get_char_from_user0()
    return nvim.command("getchar()")
  end
  v_0_ = get_char_from_user0
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["get-char-from-user"] = v_0_
  get_char_from_user = v_0_
end
local number_to_char
do
  local v_0_
  local function number_to_char0(n)
    return nvim.command(core.concat({"nr2char(", n, ")"}))
  end
  v_0_ = number_to_char0
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["number-to-char"] = v_0_
  number_to_char = v_0_
end
local get_symbol_from_user
do
  local v_0_
  local function get_symbol_from_user0()
    return number_to_char(get_char_from_user())
  end
  v_0_ = get_symbol_from_user0
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["get-symbol-from-user"] = v_0_
  get_symbol_from_user = v_0_
end
local run_commands
do
  local v_0_
  local function run_commands0(...)
    local cmd_list = ipairs(...)
    return __fnl_global__run_21(nvim.command, cmd_list)
  end
  v_0_ = run_commands0
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["run-commands"] = v_0_
  run_commands = v_0_
end
local show_marks
do
  local v_0_
  local function show_marks0()
    run_commands("marks", "echo('Mark: ')")
    local mark = get_symbol_from_user()
    local go_to_mark = core.concat({"execute \"normal! '\"", mark})
    return run_commands("redraw", go_to_mark())
  end
  v_0_ = show_marks0
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["show-marks"] = v_0_
  show_marks = v_0_
end
nnoremap("'", show_marks)
return nnoremap("<Leader>fc", a.println("we're real pog"))