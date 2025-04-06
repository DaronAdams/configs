-- Nightfox plugin
return {
	'EdenEast/nightfox.nvim',
	config = function()
		require('nightfox').setup({
			options = {
				styles = {
					comments = "italic",
					keywords = "bold",
				}
			}
		})
		
		-- Apply the colorscheme after setup
		vim.cmd("colorscheme dawnfox")
	end
	}
