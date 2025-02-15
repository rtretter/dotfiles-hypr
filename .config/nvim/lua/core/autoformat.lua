local format_grp = vim.api.nvim_create_augroup("AutoFormat", {})

vim.api.nvim_create_autocmd(
"BufWritePost",
{
    pattern = "*.go",
    group = format_grp,
    callback = function()
        vim.cmd('GoFmt')
    end,
}
)

vim.api.nvim_create_user_command('GoFmt', function()
    local filePath = vim.fn.expand('%')
    vim.cmd('w')  -- Save the current file
    vim.fn.system({ 'gofmt', '-w', filePath })  -- Run gofmt
    vim.cmd('silent! e!')  -- Reload current file
end, {})
