local M = {}

M.test_win = nil
M.test_buf = nil

function M.setup(opts)
	opts = opts or {}

	vim.keymap.set("n", "<leader>ot", function()
		-- 1. Clean up previous test window/buffer if it exists
		if M.test_win and vim.api.nvim_win_is_valid(M.test_win) then
			vim.api.nvim_win_close(M.test_win, true)
		end
		if M.test_buf and vim.api.nvim_buf_is_valid(M.test_buf) then
			vim.api.nvim_buf_delete(M.test_buf, { force = true })
		end

		local filetype = vim.bo.filetype
		local file_path = vim.fn.expand("%")
		local file_dir = vim.fn.expand("%:h")

		local node = vim.treesitter.get_node()
		local func_name = nil
		local class_name = nil

		-- 2. Extract function/class names (Python & Go)
		if filetype == "python" then
			while node do
				if node:type() == "function_definition" and not func_name then
					local name_node = node:field("name")[1]
					if name_node then
						func_name = vim.treesitter.get_node_text(name_node, 0)
					end
				elseif node:type() == "class_definition" and not class_name then
					local name_node = node:field("name")[1]
					if name_node then
						class_name = vim.treesitter.get_node_text(name_node, 0)
					end
				end
				node = node:parent()
			end
		elseif filetype == "go" then
			while node do
				if node:type() == "function_declaration" and not func_name then
					local name_node = node:field("name")[1]
					if name_node then
						func_name = vim.treesitter.get_node_text(name_node, 0)
					end
				end
				node = node:parent()
			end
		end

		-- 3. Build the command
		local cmd = ""
		local title = " Tests "

		if filetype == "python" then
			title = " Python Tests "
			cmd = "docker compose exec web pytest --color=yes"
			if func_name then
				local target = file_path
				if class_name then
					target = target .. "::" .. class_name
				end
				target = target .. "::" .. func_name
				cmd = cmd .. " " .. target
			else
				cmd = cmd .. " " .. file_path
			end
		elseif filetype == "go" then
			title = " Go Tests "
			if func_name then
				cmd = string.format("cd %s && go test -v -run ^%s$", file_dir, func_name)
			else
				cmd = string.format("cd %s && go test -v", file_dir)
			end
		elseif
			filetype == "typescript"
			or filetype == "javascript"
			or filetype == "typescriptreact"
			or filetype == "javascriptreact"
		then
			title = " TS/JS Tests "
			cmd = "npx jest --colors " .. file_path
		else
			vim.notify("No test command for: " .. filetype, vim.log.levels.WARN)
			return
		end

		-- 4. Create fresh native floating window
		M.test_buf = vim.api.nvim_create_buf(false, true)

		local width = math.floor(vim.o.columns * 0.8)
		local height = math.floor(vim.o.lines * 0.8)

		M.test_win = vim.api.nvim_open_win(M.test_buf, true, {
			relative = "editor",
			width = width,
			height = height,
			col = math.floor((vim.o.columns - width) / 2),
			row = math.floor((vim.o.lines - height) / 2),
			style = "minimal",
			border = "rounded",
			title = " " .. title .. " ",
			title_pos = "center",
		})

		vim.fn.jobstart(cmd, { term = true })

		-- Force Normal mode
		vim.cmd("stopinsert")

		-- Map 'q' to close the window AND clean up the buffer
		vim.keymap.set("n", "q", function()
			if vim.api.nvim_win_is_valid(M.test_win) then
				vim.api.nvim_win_close(M.test_win, true)
			end
			if vim.api.nvim_buf_is_valid(M.test_buf) then
				vim.api.nvim_buf_delete(M.test_buf, { force = true })
			end
		end, { buffer = M.test_buf, nowait = true, desc = "Close test window" })
	end, { desc = "Run tests in docker" })
end

return M
