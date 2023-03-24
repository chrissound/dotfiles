function fzfInsertHaskellImport(opts)

  buf = vim.api.nvim_win_get_buf(0)
  pos = vim.api.nvim_win_get_cursor(0)[2]

  r,c = unpack(vim.api.nvim_win_get_cursor(0))
  r2 = r - 1

  local fzf = require('fzf-lua')
  opts = fzf.config.normalize_opts(opts, fzf.config.globals.git)

  if not fzf.path.git_root(opts) then return end
  opts.cmd = fzf.path.git_cwd('bash -c \' cat "$(git rev-parse --show-toplevel)/.haskellImports.txt" \'', opts)

  insertImport = function(sel) vim.api.nvim_buf_set_lines(buf,r2,r2, true, {sel[1]}) end

  opts.actions = {
    ['default'] = insertImport,
    ["ctrl-p"]  = { insertImport, fzf.actions.resume },
  }

  fzf.core.fzf_wrap(opts, opts.cmd, function(selected)
    if not selected then return end
    fzf.actions.act(opts.actions, selected, opts)
  end)()
end

function testWrite()
  local pos = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()

  local nline = line:sub(0, pos) .. 'hello' .. line:sub(pos + 1)
  local buf = vim.api.nvim_win_get_buf(0)

  print (nline)

  local r,c = unpack(vim.api.nvim_win_get_cursor(0))
  print(r, c)

  local r2 = r - 1

  -- vim.api.nvim_buf_set_lines(buf,r,r, false, {nline})
  -- vim.api.nvim_buf_set_lines(buf,r,r, true, {"hmmmmmmmm"})
  vim.api.nvim_buf_set_lines(buf,r2,r2, true, {"hmmmmmmmm"})
end

