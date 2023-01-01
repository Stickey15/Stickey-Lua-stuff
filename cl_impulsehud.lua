-- this was originally made for my 1942rp server, join it here :) https://discord.gg/fBbeubAbnw




	surface.CreateFont( "HUDFont69", {
	font = "Trebuchet24",
	extended = false,
	size = 22,
	weight = 1000,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = true,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = true,
})




local function hudPaint(ply, char)
 local x, y = 30, ScrH() - 20
 local localplayer = LocalPlayer()
 local char = localplayer:GetCharacter()
 
 
 
 
 
 
 
 	draw.RoundedBox(6, x - 20, y - 150, 365, 160, Color(25,25,25,235)) -- draw the frame and boxes
	draw.RoundedBox(6, x - 15, y - 145, 355, 22, Color(75,75,75,200))
	draw.RoundedBox(6, x - 15, y - 75, 355, 22, Color(75,75,75,200))
	draw.RoundedBox(6, x - 15, y - 110, 355, 22, Color(75,75,75,200))
		draw.RoundedBox(6, x - 15, y - 40, 355, 22, Color(75,75,75,200))
 
 	surface.SetDrawColor( 255, 255, 255, 255 ) 
	surface.SetMaterial(Material("icon16/heart.png")) 
	surface.DrawTexturedRect( x - 107 + (200 - 8) / 2, y - 75, 20, 20 ) 
	
	surface.SetMaterial(Material("icon16/user.png")) 
	surface.DrawTexturedRect( x - 107 + (200 - 8) / 2, y - 145, 20, 20 ) 
	
	surface.SetMaterial(Material("icon16/basket.png")) 
	surface.DrawTexturedRect( x - 107 + (200 - 8) / 2, y - 110, 20, 20 ) 
	
		surface.SetMaterial(Material("icon16/money.png")) 
	surface.DrawTexturedRect( x - 107 + (200 - 8) / 2, y - 40, 20, 20 ) 

 local health = localplayer:Health() -- only the most polished system ever
 if (health >= 100 ) then
 draw.DrawText("Health: Healthy", "HUDFont69", x - 85 + (200 - 8) / 2, y - 75, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT )
 elseif (health >= 80 ) then
 draw.DrawText("Health: Wounded", "HUDFont69", x - 85 + (200 - 8) / 2, y - 75, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT )
  elseif (health >= 60 ) then
 draw.DrawText("Health: Slightly Injured", "HUDFont69", x - 85 + (200 - 8) / 2, y - 75, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT )
  elseif (health >= 40 ) then
 draw.DrawText("Health: Injured", "HUDFont69", x - 85 + (200 - 8) / 2, y - 75, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT )
  elseif (health >= 20 ) then
 draw.DrawText("Health: Seriously Injured", "HUDFont69", x - 85 + (200 - 8) / 2, y - 75, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT )
 else
 draw.DrawText("Terminal Damage", "HUDFont69", x - 15 + (200 - 8) / 2, y - 75, Color(255, 0, 0, 255), TEXT_ALIGN_LEFT )
  draw.DrawText("Health:", "HUDFont69", x - 85 + (200 - 8) / 2, y - 75, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT )
 end
 
 

 draw.DrawText("Name: " .. localplayer:Nick(), "HUDFont69", x - 85 + (200 - 8) / 2, y - 145, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT )
 draw.DrawText("Occupation: " .. (ix.faction.Get(localplayer:Team()).name), "HUDFont69", x - 85 + (200 - 8) / 2, y - 110, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT )
   draw.DrawText("Money: " .. char:GetMoney(), "HUDFont69", x - 85 + (200 - 8) / 2, y - 40, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT )
 
 	Scrw, Scrh = ScrW(), ScrH()
	draw.DrawText( nick, "HUDFont69", 25+30, ScrH() - 190, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
	end

hook.Add("HUDPaint", "1942rpHUDpaint", hudPaint)

