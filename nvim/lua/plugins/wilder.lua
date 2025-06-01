return {
	"gelguy/wilder.nvim",
	dependencies = {
	  "nvim-tree/nvim-web-devicons",
	  "romgrk/fzy-lua-native",
	},
	event = "CmdlineEnter",
	config = function()
	  local wilder = require("wilder")
	  
	  -- Basic setup with minimal configuration
	  wilder.setup({ modes = { ":", "/", "?" } })
	  
	  -- Enable fuzzy matching
	  wilder.set_option('pipeline', {
		wilder.branch(
		  wilder.cmdline_pipeline({
			fuzzy = 1,
		  }),
		  wilder.search_pipeline()
		),
	  })
	  
	  -- Simple renderer with fewer customizations to avoid errors
	  local wilder = require("wilder")
	  wilder.setup({ modes = { ":", "/", "?" } })
	  
	  wilder.set_option("renderer", wilder.renderer_mux({
		[":"] = wilder.wildmenu_renderer({
		  highlighter = wilder.basic_highlighter(),
		  separator = " · ",
		  left = { " ", wilder.wildmenu_spinner(), " " },
		  right = { " ", wilder.wildmenu_index() },
		}),
		["/"] = wilder.wildmenu_renderer(),
		["?"] = wilder.wildmenu_renderer(),
	  }))
	  
	  
	end,
  }