require( GetScriptDirectory().."/locations/locations" )
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- Enchantress Radiant Mid
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
function ThinkLvlupAbility()
    local viper = GetBot();
	--print("Try to LevelUp Ability");
    enchantress:Action_LevelAbility("enchantress_untouchable");
end


function MoveToRadiantSecretShop()
	local viper = GetBot();
	viper:Action_MoveToLocation(RADIANT_SECRET_SHOP_POS);
end

function MoveToRadiantBountyRuneTop()
	local viper = GetBot();
	viper:Action_MoveToLocation(RADIANT_BOUNTY_TOP_POS);
end

function MoveToRadiantMidT1()
	local viper = GetBot();
	viper:Action_MoveToLocation(Vector(0,0,0));
end

function PreGameRadiantThink()
	local viper = GetBot();
	if DotaTime()<-10 then
		Move1();
	elseif DotaTime()<0 then
		Move2();
	elseif DotaTime()>=0 and DotaTime()<=1 then
		viper:Action_PickUpRune(viper);
	else
		MoveToRadiantMidT1();
	end
end

function RadiantThink()
	if DotaTime<=1 then
		PreGameRadiantThink();
	end
end

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

function Think()
	if ( GetTeam() == TEAM_RADIANT )
	then
		RadiantThink();
	end
end