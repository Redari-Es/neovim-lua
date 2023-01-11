--
--

local file = io.open("$HOME/.local/share/nvim/",r)

if file then
  print('plug-init')
else print('noexit')
end

