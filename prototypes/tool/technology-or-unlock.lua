local khaoslib_item = require("__khaoslib__.prototypes.item")

khaoslib_item:load {
  type = "tool",
  name = "technology-or-unlock",
  subgroup = "other",
  stack_size = 100,
	infinite = true,
	hidden = true,
	hidden_in_factoriopedia = true,
} :set_icons {{icon = "__base__/graphics/icons/signal/signal-lock.png", icon_size = 64}}
  :commit()
