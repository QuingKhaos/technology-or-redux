local util = require("__core__/lualib/util")

---@param event EventData.on_research_finished
local function research_finished(event)
	for tech_name, tech in pairs(event.research.successors) do
		if util.string_starts_with(tech_name, "OR-") then
			tech.enabled = true
			tech.researched = true
		end
	end
end

local function reevaluate()
	for _, force in pairs(game.forces) do
		for tech_name, tech in pairs(force.technologies) do
			if util.string_starts_with(tech_name, "OR-") then
				local any_researched = false
				local none_checked = true

				for _, prerequisite in pairs(tech.prerequisites) do
					none_checked = false

					if prerequisite.enabled and prerequisite.researched then
						tech.researched = true
						any_researched = true

						break
					end
				end

				if none_checked then
					tech.researched = true
					any_researched = true
				end

				if not any_researched then
					tech.researched = false
					tech.enabled = false
				end
			end
		end
	end
end

script.on_event(defines.events.on_research_finished, research_finished)
script.on_configuration_changed(reevaluate)
script.on_init(reevaluate)
