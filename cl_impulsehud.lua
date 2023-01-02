--made by stickey
-- no this is not stolen, i remade it
--for support contact me on discord Stickey#9866

-- of course you will need impulse content pack for the icons, rename the ones you are using to the following for each different icon materials/hud/money.png

	surface.CreateFont( "HUDFont69", {
	font = "Trebuchet24", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 27,
	weight = 1200,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = true,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

--[[---------------------------------------------------------------------------
The Custom HUD
only draws health
---------------------------------------------------------------------------]]
-- beware this entire hud was built with a single brain cell
-- it works but its not good lmao
local Health = 0
local function hudPaint()
    local x, y = 30, ScrH() - 20
    local localplayer = LocalPlayer()
	 local char = localplayer:GetCharacter()
    Health = math.min(100, (Health == localplayer:Health() and Health) or Lerp(0.1, Health, localplayer:Health()))

	--Health
					local hp = localplayer:Health()
	   if hp > 0 then
    local DrawHealth = math.Min(Health / GAMEMODE.Config.startinghealth, 1)
    local Border = math.Min(6, math.pow(2, math.Round(3 * DrawHealth)))
	draw.RoundedBox(6, x + 5, y - 175, 300, 180, Color(45,45,45,240))
    draw.RoundedBox(Border, x + 7, y - 30, 200 - 8, 20, Color(0,0,0,0)) --200 last value
    draw.RoundedBox(Border, x + 8, y - 29, (200 - 9) * DrawHealth, 18, Color(140,0,0,0)) --180 last vaue
	end
	
					local hp = localplayer:Health()
	   if hp > 0 then
	--icons
	surface.SetDrawColor( 255, 255, 255, 255 ) -- Set the drawing color
	surface.SetMaterial(Material("materials/hud/health.png")) 
	surface.DrawTexturedRect( x - 70 + (200 - 8) / 2, y - 112.5, 20, 20 ) 
	
	surface.SetDrawColor( 255, 255, 255, 255 ) -- Set the drawing color
	surface.SetMaterial(Material("materials/hud/hunger.png")) 
	surface.DrawTexturedRect( x - 70 + (200 - 8) / 2, y - 75, 20, 20 ) 
	
	surface.SetDrawColor( 255, 255, 255, 255 ) -- Set the drawing color
	surface.SetMaterial(Material("materials/hud/money.png")) 
	surface.DrawTexturedRect( x - 70 + (200 - 8) / 2, y - 40, 20, 20 ) 
	
	surface.SetDrawColor( 255, 255, 255, 255 ) -- Set the drawing color
	surface.SetMaterial(Material("materials/hud/xp.png")) 
	surface.DrawTexturedRect( x + 105 + (200 - 8) / 2, y - 168, 20, 20 ) 
	
    draw.DrawText("Health: " .. math.Max(0, math.Round(localplayer:Health())), "Trebuchet24", x - 45 + (200 - 8) / 2, y - 115, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT )

	draw.DrawText( "Money: " .. "T" .. char:GetMoney(), "Trebuchet24", x - 45 + (200 - 8) / 2, y - 40, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)

	local nick = localplayer:Nick()
	local plyteam = (team.GetName(localplayer:Team()))
	local teamcolor = team.GetColor
	
	Scrw, Scrh = ScrW(), ScrH()
	draw.DrawNonParsedText( nick, "HUDFont69", 25+30, ScrH() - 190, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
	

	
	draw.DrawText( (ix.faction.Get(localplayer:Team()).name), "HUDFont69", x - 37 + (200 - 8) / 2, y - 145, team.GetColor( LocalPlayer():Team() ), TEXT_ALIGN_LEFT )


       draw.DrawNonParsedSimpleText("Stamina: " .. char:GetLocalVar("stm", 0), "Trebuchet24", x - 45 + (200 - 8) / 2, y - 77, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT )

	
	-- enable if u have an xp plugin, originally made for darkrp so u will have to port it to whatever xp shit ur using
	--local xp = localplayer:getDarkRPVar("level")
	--draw.DrawText( "Level: " .. xp, "Trebuchet24", x + 165 + (200 - 8) / 2, y - 170, Color(255, 255, 255, 255), 1)

end
hook.Add("HUDPaint", "DarkRP_Mod_HUDPaint", hudPaint)



