ITEM.name = "Plant pot"
ITEM.model = Model("models/the_weed/the_weed_pot.mdl")
ITEM.description = "A ceramic pot for plants."

ITEM.functions.Place = {
    OnRun = function(itemTable)
	local client = itemTable.player
local ply = client 
local tr = ply:GetEyeTrace() 
local ent = ents.Create("weed_pot")
ent:SetPos(tr.HitPos)
ent:Spawn()
ply:ChatNotify("You placed a pot")
end
}