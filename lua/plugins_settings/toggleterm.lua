require("toggleterm").setup{
  function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-j>]],
  hide_numbers = true,
  autochdir = true,
  direction = 'horizontal',
  close_on_exit = true,
  auto_scroll = true,
  shell = vim.o.shell,
}
