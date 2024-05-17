local trapsounds
if default.node_sound_metal_defaults then
	trapsounds = default.node_sound_metal_defaults()
else
	trapsounds = default.node_sound_stone_defaults()
end

minetest.register_craft({
    output = "hardcore_farming:rat_trap",
    recipe = {
        {"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
        {"default:steel_ingot", "", "default:steel_ingot"},
		{"default:wood", "default:wood", "default:wood"}        
    }
})

minetest.register_node("hardcore_farming:rat_trap", {
	description = ("Rat Trap"),
	_doc_items_longdesc = ("A rat trap captures rats in its vicinity."),
	paramtype = "light",
	tiles = {"rat_trap.png"},
	is_ground_content = false,
	drawtype = "allfaces",
	groups = {cracky=1,level=1},
	drop = "",
	on_construct = function(pos)
		-- 
	end,
	on_punch = function(pos)
		-- 
	end,
	on_destruct = function(pos)
		for  _,obj in ipairs(minetest.get_objects_inside_radius(pos, 0.5)) do
			if obj ~= nil and not obj:is_player() then
				--[[if obj:get_luaentity().name == "hardcore_farming:rat_trap" then
					obj:remove()	
				end]]
				local entity = obj:get_luaentity()
				if entity and entity.name == "hardcore_farming:rat" then
					obj:remove()
					minetest.sound_play(trapsounds.dug, {pos = pos, max_hear_distance = 30})
				end
			end
		end
	end,
	sounds = trapsounds,
})

minetest.register_abm({
    nodenames = {"hardcore_farming:rat_trap"},
    interval = 1,
    chance = 1,
    action = function(pos)
        for _, obj in ipairs(minetest.get_objects_inside_radius(pos, 0.9)) do
            if obj ~= nil and not obj:is_player() then
                local entity = obj:get_luaentity()
				if entity and (entity.name == "hardcore_farming:rat" or entity.name == "hardcore_farming:locust") then
					obj:remove()
					minetest.sound_play(trapsounds.dug, {pos = pos, max_hear_distance = 30})
				end
            end
        end
    end,
})