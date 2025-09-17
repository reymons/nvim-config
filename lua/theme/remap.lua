function remap(mode, key, cmd, opts)
    vim.keymap.set(mode, key, cmd, opts)
end

function delete_buffer(buffer)
    vim.api.nvim_buf_delete(buffer, { force = false })
end

function delete_allowed_buffers()
    local current_buffer_name = vim.fn.bufname('%')
    local deleted_buffers = 0
    for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
        local buffer_name = vim.fn.bufname(buffer)
	    local is_terminal = string.match(buffer_name, "^term:")
        if (buffer_name ~= current_buffer_name) and not is_terminal then
            local deleted = pcall(function() delete_buffer(buffer) end)
            if deleted then
                deleted_buffers = deleted_buffers + 1
            end
        end
    end
    vim.cmd(string.format(":echo '%d buffers deleted'", deleted_buffers))
end

vim.g.mapleader = " "
remap("n", "<leader>pv", vim.cmd.Ex)
remap("n", "<leader>pv", vim.cmd.Ex)
remap("n", "<leader>st", vim.cmd.vsplit)
remap("n", "<leader>t", "<c-w><c-w>")
remap("n", "<leader>pb", function() vim.cmd(":e#") end)
remap("n", "<leader>b", ":b ")
remap("n", "<leader>db", function() vim.cmd(":bd") end)
remap("n", "<leader>ddb", delete_allowed_buffers)
remap({"n", "v"}, "d", '"_d')
remap("n", "<s-k>", function() vim.cmd(":m-2") end)
remap("n", "<s-j>", function() vim.cmd(":m+") end)
remap("n", "<leader>r", ":%s/")
remap("v", "<leader>r", ":s///g")
remap("n", "<leader>h", function() vim.cmd(":set hlsearch!") end)
remap("v", "a", "<s-i><tab><c-c>");
remap("n", "<leader>p", '"+p');
remap("v", "<leader>k", '"+y');
remap("n", "<leader>kyy", '"+yy');
remap("n", "stt", function() vim.cmd(":%s/^[ ]\\+/\\t/g") end)
remap("n", "<leader>di", function()
    vim.diagnostic.open_float(nil, { focus = true })
end)

vim.opt.swapfile = false
vim.opt.relativenumber = true;
vim.opt.number = true;
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = false
vim.cmd "colorscheme base16-tomorrow"
vim.cmd "set guicursor=n-v-c:block"
vim.cmd "set termguicolors"
vim.cmd "let g:netrw_banner=0"
vim.cmd "let g:netrw_list_hide='^./$'"
vim.cmd "let g:netrw_hide=1"
vim.cmd "set nohlsearch"
