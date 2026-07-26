local technology_or = require("__technology-or-redux__.technology-or")

local tech = technology_or.OR({"automation", "logistics"})
data.raw["technology"]["automobilism"].prerequisites = {tech.name}

data:extend({tech})
