-- Function to print the hello message
local M = {}

function M.is_watson_enabled(callback)
	vim.system({ "bash", "-c", "watson status" }, { text = true }, function(result)
		local output = result.stdout or ""
		output = output:gsub("\n$", "")
		if output == "No project started." then
			callback()
		end
	end)
end
function M.stop()
	if M._timer and not M._timer:is_closing() then
		M._timer:stop()
		M._timer:close()
		M._timer = nil

		vim.notify("Watson checker is disabled!", vim.log.levels.INFO)
	end
end

function M.setup(opts)
	opts = opts or {}
	local start_delay_in_ms = opts.start_delay_in_ms or (1000 * 60 * 10)
	local recheck_delay_in_ms = opts.start_delay_in_ms or (1000 * 60 * 1)

	vim.api.nvim_create_user_command("WatsonStop", M.stop, {})

	vim.api.nvim_create_autocmd("VimEnter", {
		once = true,
		callback = function()
			M._timer = vim.uv.new_timer()
			M._timer:start(start_delay_in_ms, recheck_delay_in_ms, function()
				M.is_watson_enabled(function()
					vim.notify("Enable watson tracker!", vim.log.levels.WARN, {
						timeout = 5000,
					})
				end)
			end)
		end,
	})
end

return M
