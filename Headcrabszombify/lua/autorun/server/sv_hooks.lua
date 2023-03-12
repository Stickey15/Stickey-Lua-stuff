hook.Add("EntityTakeDamage", "HeadcrabZombify", function(target, dmginfo)
-- Check if the target is a player, citizen, rebel, or combine
if target:IsNPC() and (target:GetClass() == "npc_citizen" or target:GetClass() == "npc_rebel" or target:GetClass() == "Refugee" or target:GetClass() == "npc_combine_s" or target:GetClass() == "npc_combine_e" or target:GetClass() == "CombinePrison" or target:GetClass() == "PrisonShotgunner" or target:GetClass() == "ShotgunSoldier") then
-- Check if the damage was caused by a headcrab or fast headcrab
local attacker = dmginfo:GetAttacker()
if attacker:GetClass() == "npc_headcrab" or attacker:GetClass() == "npc_headcrab_fast" then
-- Spawn a zombie at the target's position
local zombieClass = "npc_zombie"
if target:GetClass() == "npc_combine_s" or target:GetClass() == "npc_combine_e" or target:GetClass() == "CombinePrison" or target:GetClass() == "PrisonShotgunner" or target:GetClass() == "ShotgunSoldier" then
zombieClass = "npc_zombine"
end
local zombie = ents.Create(zombieClass)
if IsValid(zombie) then
zombie:SetPos(target:GetPos())
zombie:SetAngles(target:GetAngles())
zombie:Spawn()
end -- end of IsValid(zombie) check
if target:GetClass() == "npc_citizen" or target:GetClass() == "npc_rebel" or target:GetClass() == "Refugee" then
target:EmitSound("vo/npc/male01/pain09.wav")
elseif target:GetClass() == "npc_combine_s" or target:GetClass() == "npc_combine_e" or target:GetClass() == "CombinePrison" or target:GetClass() == "PrisonShotgunner" or target:GetClass() == "ShotgunSoldier" then
target:EmitSound("sound/npc/combine_soldier/die1.wav")
end
-- Remove the headcrab or fast headcrab
attacker:Remove()
-- Kill the target
if target:IsPlayer() then
target:Kill()
else
target:Fire("kill", "", 0)
end
end -- end of headcrab or fast headcrab check
end -- end of target class check
end) -- end of hook function