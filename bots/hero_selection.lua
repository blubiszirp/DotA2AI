

----------------------------------------------------------------------------------------------------

function Think()


	if ( GetTeam() == TEAM_RADIANT )
	then
		print( "selecting radiant" );
		SelectHero( 0, "npc_dota_hero_spirit_breaker" );
		SelectHero( 1, "npc_dota_hero_bristleback" );
		SelectHero( 2, "npc_dota_hero_enchantress" );
		SelectHero( 3, "npc_dota_hero_viper" );
		SelectHero( 4, "npc_dota_hero_shadow_shaman" );
	elseif ( GetTeam() == TEAM_DIRE )
	then
		print( "selecting dire" );
		SelectHero( 5, "npc_dota_hero_drow_ranger" );
		SelectHero( 6, "npc_dota_hero_earthshaker" );
		SelectHero( 7, "npc_dota_hero_juggernaut" );
		SelectHero( 8, "npc_dota_hero_mirana" );
		SelectHero( 9, "npc_dota_hero_nevermore" );
	end

end

----------------------------------------------------------------------------------------------------
