local Config = require("lazy.core.config")
local Util = require("lazy.util")

local M = {}

function M.index(plugin)
  if Config.options.readme.skip_if_doc_exists and vim.loop.fs_stat(plugin.dir .. "/doc") then
    return {}
  end
  ---@type table<string,{file:string, tag:string, line:string}>
  local tags = {}
  for _, file in ipairs(Config.options.readme.files) do
    file = plugin.dir .. "/" .. file
    if vim.loop.fs_stat(file) then
      local lines = vim.split(Util.read_file(file), "\n")
      for _, line in ipairs(lines) do
        local title = line:match("^#+%s*(.*)")
        if title then
          local tag = plugin.name .. "-" .. title:lower():gsub("%W+", "-")
          tag = tag:gsub("%-+", "-"):gsub("%-$", "")
          tags[tag] = { tag = tag, line = line, file = plugin.name .. ".md" }
        end
      end
      table.insert(lines, [[<!-- vim: set ft=markdown: -->]])
      Util.write_file(Config.options.readme.root .. "/doc/" .. plugin.name .. ".md", table.concat(lines, "\n"))
    end
  end
  return tags
end

function M.update()
  vim.cmd.helptags(Config.plugins["lazy.nvim"].dir .. "/doc")
  local docs = Config.options.readme.root .. "/doc"
  vim.fn.mkdir(docs, "p")

  Util.ls(docs, function(path, name, type)
    if type == "file" and name:sub(-2) == "md" then
      vim.loop.fs_unlink(path)
    end
  end)
  ---@type {file:string, tag:string, line:string}[]
  local tags = {}
  for _, plugin in pairs(Config.plugins) do
    for key, tag in pairs(M.index(plugin)) do
      tags[key] = tag
    end
  end
  local lines = { [[!_TAG_FILE_ENCODING	utf-8	//]] }
  Util.foreach(tags, function(_, tag)
    table.insert(lines, ("%s\t%s\t/%s"):format(tag.tag, tag.file, tag.line))
  end)
  Util.write_file(docs .. "/tags", table.concat(lines, "\n"))
end

return M
