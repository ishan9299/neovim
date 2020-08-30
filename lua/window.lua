local api = vim.api

local M = {}

function M.create_win(options)

	local t_height = vim.fn.nvim_win_get_height(0)
	local t_width  = vim.fn.nvim_win_get_width(0)
	api.nvim_command(options["position"])

	-- Create the window and set the dimensions
	local win = api.nvim_get_current_win()

	if options["height"] ~= nil then
		local height = options["height"] * t_height
		height = math.ceil(height)
		vim.fn.nvim_win_set_height(win,height)
	end

	if options["width"] ~= nil then
		local width = options["width"] * t_width
		width = math.ceil(width)
		vim.fn.nvim_win_set_width(win,width)
	end

	-- Chech if you want to list the buffer
	local buf = api.nvim_create_buf(true,false)
	api.nvim_set_current_buf(buf)

	if options["command"] ~= nil then
		api.nvim_command(options["command"])
	end

end

return M
