local split = function()
	vim.cmd("set splitbelow")
	vim.cmd("sp")
	vim.cmd("res -5")
end
local compileRun = function()
	vim.cmd("w")
	-- check file type
	local ft = vim.bo.filetype
	if ft == "dart" then
		vim.cmd(":FlutterRun -d " .. vim.g.flutter_default_device .. " " .. vim.g.flutter_run_args)
	elseif ft == "markdown" then
		-- vim.cmd(":InstantMarkdownPreview<CR>")
		vim.cmd(":MarkdownPreview")
	elseif ft == 'javascript' then
		split()
		vim.cmd("term node %")
	elseif ft == 'html' then
		split()
		vim.cmd("term webs %<.html &")
	elseif ft == 'python' then
		split()
		vim.cmd("term python3 % && time")
	elseif ft == 'go' then
		split()
		vim.cmd("term go run % && time")
	elseif ft == 'swift' then
		split()
		vim.cmd("term swift % && time")
	elseif ft == 'sh' then
		split()
		vim.cmd("term !time bash % && time")
	elseif ft == 'lua' then
		split()
		vim.cmd("term luajit %")
	elseif ft == 'c' then
		split()
		vim.cmd("exec '!gcc % -o %<'")
		vim.cmd("term ./%< && time")
	end
end

vim.keymap.set('n', 'r', compileRun, { silent = true })
