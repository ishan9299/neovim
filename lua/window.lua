local api = vim.api

local M = {}

function M.create_win(position, per_height, per_width, command)

	local t_height = vim.fn.nvim_win_get_height(0)
	local t_width  = vim.fn.nvim_win_get_width(0)

	api.nvim_command(position)

	-- Create the window and set the dimensions
	local win = api.nvim_get_current_win()

	if per_height ~= nil then
		local height = per_height * t_height
		height = math.ceil(height)
		vim.fn.nvim_win_set_height(win,height)
	end

	if per_width ~= nil then
		local width = per_width * t_width
		width = math.ceil(width)
		vim.fn.nvim_win_set_width(win,width)
	end

	-- Chech if you want to list the buffer
	local buf = api.nvim_create_buf(true,false)
	api.nvim_set_current_buf(buf)

	if command ~= nil then
		api.nvim_command(command)
	end

end

return M
