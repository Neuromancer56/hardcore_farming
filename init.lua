
local dpath = minetest.get_modpath("hardcore_farming") .. "/"

 replace_rate = tonumber(minetest.settings:get("eat_crops_delay"))
if not replace_rate then
	replace_rate = 15
	minetest.settings:set("eat_crops_delay", tostring(replace_rate))
end

 interval = tonumber(minetest.settings:get("spawn_pests_delay"))
if not interval then
	interval = 50
	minetest.settings:set("spawn_pests_delay", tostring(interval))
end

 chance = tonumber(minetest.settings:get("spawn_pests_probability"))
if not chance then
	chance = 10
	minetest.settings:set("spawn_pests_probability", tostring(chance))
end


function getNodesByGroup(group)
    --local nodes = {}
    for name, def in pairs(minetest.registered_nodes) do
        if def.groups and def.groups[group] then
           -- table.insert(nodes, name)
		   minetest.log("ToChat:", "group:" ..group .. " nodename:".. name)
        end
    end
    return nodes
end
local function addGroupToNode(modname, nodename, groupname)

    if minetest.get_modpath(modname) then
        local node_def = minetest.registered_nodes[modname .. ":" .. nodename]

        if node_def then
            node_def.groups[groupname] = 1
            minetest.override_item(modname .. ":" .. nodename, { groups = node_def.groups })
			--*********Log info about groups node belongs to. COMMENT THIS OUT **********
			-- minetest.log("nodeinfo:", "nodeinfo:" .. nodename)
			-- for group, value in pairs(node_def.groups) do
			-- -- Log each item using minetest.log()
			-- minetest.log("groups:", "group: " .. group .. ", value: " .. value)
			-- end
			--*********************************************************  
        end

	end
end

for i=1, 8 do
    addGroupToNode("farming", "wheat_"..i, "crop")
    addGroupToNode("x_farming", "corn_"..i, "crop")
    addGroupToNode("x_farming", "melon_"..i, "crop")
    addGroupToNode("x_farming", "barley_"..i, "crop")
    addGroupToNode("x_farming", "carrot_"..i, "crop")
    addGroupToNode("x_farming", "coffee_"..i, "crop")
    addGroupToNode("x_farming", "pumpkin_"..i, "crop")
    addGroupToNode("x_farming", "soybean_"..i, "crop")
    addGroupToNode("x_farming", "beetroot_"..i, "crop")
    addGroupToNode("x_farming", "strawberry_"..i, "crop")
    addGroupToNode("x_farming", "stevia_"..i, "crop")
    addGroupToNode("x_farming", "potato_"..i, "crop")
    addGroupToNode("x_farming", "rice_"..i, "crop")
end

for i=1, 2 do
    addGroupToNode("crops", "corn_base_"..i, "crop")
end


for i=1, 3 do
    addGroupToNode("crops", "corn_top_"..i, "crop")
end

for i=1, 4 do
    addGroupToNode("crops", "potato_plant_"..i, "crop")    
end

for i=1, 5 do
    addGroupToNode("crops", "tomato_plant_"..i, "crop") 
    addGroupToNode("crops", "pumpkin_plant_"..i, "crop")
    addGroupToNode("crops", "melon_plant_"..i, "crop")
end

addGroupToNode("x_farming", "melon_fruit", "crop")
addGroupToNode("x_farming", "corn"..9, "crop")
addGroupToNode("x_farming", "corn"..10, "crop")
addGroupToNode("crops", "corn_base_seed", "crop")
addGroupToNode("crops", "pumpkin_plant_5_attached", "crop")
addGroupToNode("crops", "melon_plant_5_attached", "crop")
addGroupToNode("crops", "pumpkin", "crop")
addGroupToNode("crops", "melon", "crop")
if minetest.get_modpath("x_farming") then
end
getNodesByGroup("crop")
dofile(dpath .. "locust.lua")
dofile(dpath .. "rat.lua")
dofile(dpath .. "crow.lua")


