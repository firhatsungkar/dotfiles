--[[ VIM Options Config ]]
local options = {
	backup = false,                                -- creates a backup file
	clipboard = "unnamedplus",                     -- allows neovim to access the system clipboard
	cmdheight = 2,                                 -- more space in the neovim command line for displaying messages
	conceallevel = 0,                              -- so that `` is visible in markdown files
	cursorline = true,                             -- highlight the current line
	encoding = "UTF-8",                            -- default encoding
	errorbells = false,                            -- no bell notification
	expandtab = true,                              -- convert tabs to spaces
	fileencoding = "utf-8",                        -- the encoding written to a file
	guifont = "monospace:h17",                     -- the font used in graphical neovim applications
	hidden = true,                                 -- navigate buffers without losing unsaved work
	hlsearch = false,                              -- highlight all matches on previous search pattern
	ignorecase = true,                             -- ignore casehttps://id.linkedin.com/in/firhatsungkar in search patterns
	incsearch = true,                              -- Highlights the matched text pattern when searching
	list = true,                                   -- enable list mode
	mouse = "a",                                   -- allow the mouse to be used in neovim
	number = true,                                 -- set numbered lines
	numberwidth = 4,                               -- set number column width to 2 {default 4}
	pumheight = 10,                                -- pop up menu height
	relativenumber = true,                         -- set relative numbered lines
	scrolloff = 8,                                 -- start scrolling when 8 lines from top or bottom
	shiftwidth = 2,                                -- the number of spaces inserted for each indentation
	showmode = false,                              -- we don't need to see things like -- INSERT -- anymore
	showtabline = 0,                               -- always show tabs
	sidescrolloff = 8,                             -- The minimal number of screen columns to keep of cursor
	signcolumn = "yes",                            -- always show the sign column, otherwise it would shift the text each time
	smartcase = true,                              -- smart case
	smartindent = true,                            -- make indenting smarter again
	softtabstop = 0,                               -- Number of spaces in a <Tab>
	splitbelow = true,                             -- force all horizontal splits to go below current window
	splitright = true,                             -- force all vertical splits to go to the right of current window
	swapfile = false,                              -- creates a swapfile
	tabstop = 2,                                   -- insert 2 spaces for a tab
	termguicolors = true,                          -- set term gui colors (most terminals support this)
	timeoutlen = 1000,                             -- time to wait for a mapped sequence to complete (in milliseconds)
	undodir = os.getenv("HOME") .. "/.vim/undodir", -- set where undo file
	undofile = true,                               -- enable persistent undo
	updatetime = 50,                               -- faster completion (4000ms default)
	wrap = false,                                  -- display lines as one long line
	writebackup = false,                           -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}


vim.opt.shortmess:append "c"
vim.opt.isfname:append("@-@")

for k, v in pairs(options) do
	vim.opt[k] = v
end
