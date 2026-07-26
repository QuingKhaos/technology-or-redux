local khaoslib_technology = require("__khaoslib__.prototypes.technology")

--- @class TechnologyOR
local technology_or = {}

-- If the localised name ends with a single number, split it before localisation and add after
-- @param localised_name data.LocalisedString
-- @return data.LocalisedString
local function locale_leveled_tech(localised_name)
	local idx = string.find(localised_name[1], "-%d+", #localised_name[1]-2)

	if idx ~= nil then
		return {"", {string.sub(localised_name[1], 0, idx-1)}, string.sub(localised_name[1], idx)}
	end

	return localised_name
end

--- @param new_tech khaoslib.TechnologyManipulator
--- @param predecessor_tech khaoslib.TechnologyManipulator
local function append_locale(new_tech, predecessor_tech)
  --- @diagnostic disable: param-type-mismatch
  local localised_name = new_tech:get().localised_name

  -- First one without comma
  if #localised_name == 2 then
    table.insert(localised_name, " ")
  else
    table.insert(localised_name, ", ")
  end

  local predecessor = predecessor_tech:get()
  local predecessor_name = predecessor.localised_name or {"technology-name." .. predecessor.name}

  predecessor_name = locale_leveled_tech(predecessor_name)
  table.insert(localised_name, predecessor_name)

  new_tech:unset("localised_name"):set{localised_name = localised_name}
  --- @diagnostic enable: param-type-mismatch
end

--- Creates a new technology prototype, which automatically unlocks if any of the given predecessor technologies is researched.
--- The returned prototype is not automatically added to the `data.raw` table, you must call `data:extend` manually.
--- This allows you to modify the prototype before it is added to the game.
--- @param predecessors data.TechnologyID[]
--- @return data.TechnologyPrototype
function technology_or.OR(predecessors)
  local new_tech = khaoslib_technology:load {
    type = "technology",
    name = "OR",
    localised_name = {"", {"technology-name.OR"}},
    localised_description = {"technology-description.OR"},
    enabled = false,
    visible_when_disabled = true,
  } :set_unit {
    time = 1,
    count = 1,
    ingredients = {
      {"technology-or-unlock", 1}
    },
  } :set_icons {{icon = "__technology-or-redux__/graphics/technology/placeholder.png", icon_size = 256}}

  for _, predecessor in pairs(predecessors) do
    local predecessor_tech = khaoslib_technology:load(predecessor)
    append_locale(new_tech, predecessor_tech)

    new_tech = new_tech:copy(new_tech:get().name .. "-" .. predecessor)
    new_tech:add_prerequisite(predecessor)
  end

  return new_tech:get()
end

return technology_or
