local notify = require'notify'
local neorg = require'neorg'

local custom = {}

function span_extensions_into_file(extensions, file)
    file_names = {}
    for k, ext in ipairs(extensions) do
        file_names[k] = file .. '.' .. ext
    end
    return file_names
end

function write_file(file, content)
    file_handler = io.open(file, "a+")
    io.output(file_handler)
    io.write(content)
    io.close(file_handler)
end

custom.neorg_latex_export = function()
    local f_name_with_extension = vim.fn.expand('%:t')
    local f_name, ext = f_name_with_extension:gmatch("(%w+).(%w+)")()   

    if ext ~= 'norg' then
        notify('File ' .. f_name_with_extension .. ' is not of a Norgmode file! Extension: ' .. ext, 'error', { title = 'Not compatible' })
        return
    end

    if not neorg.modules.is_module_loaded('core.export') then
        notify('Neorg export module not loaded', 'error', { title = 'Neorg Export missing' })
        return 
    end

    local export = neorg.modules.get_module('core.export')

    local bib, md, tex, pdf, log = unpack(span_extensions_into_file({'bib', 'md', 'tex', 'pdf', 'norglog'}, f_name))
    os.execute('rm ' .. md .. ' ' .. tex .. ' ' .. pdf .. ' 2> ' .. log)

    local md_content = export.export(0, 'markdown')
    write_file(md, md_content)

    local pandoc_command = 'pandoc --biblatex --filter pandoc-fignos --bibliography=' .. bib ..  ' -s ' .. md .. ' -o ' .. tex .. ' 2> ' .. log
    local latexmk_command = 'latexmk -bibtex -interaction=nonstopmode -f ' .. tex .. ' 2> ' .. log

    io.popen(pandoc_command .. ' && ' .. latexmk_command)
    notify('Finished running export! Checkout ' .. pdf, 'info', { title = 'Neorg Export --> PDF' })
end

return custom
