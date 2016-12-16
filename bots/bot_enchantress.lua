require( GetScriptDirectory().."/locations/locations" )
----------------------------------------------------------------------------------------
-- Locations
----------------------------------------------------------------------------------------
RADIANT_TOP_T1_POS = Vector(-6250.0,2000.0,0.0);

----------------------------------------------------------------------------------------
-- Game States
----------------------------------------------------------------------------------------
GAME_STATE_IDLE = "STATE_IDLE";
STATE_ATTACKING_CREEP = "STATE_ATTACKING_CREEP";
STATE_KILL = "STATE_KILL";
STATE_RETREAT = "STATE_RETREAT";
STATE_FARMING = "STATE_FARMING";
STATE_GOTO_COMFORT_POINT = "STATE_GOTO_COMFORT_POINT";

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- Enchantress Radiant Offlane
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
function ThinkLvlupAbility()
    local enchantress = GetBot();
	--print("Try to LevelUp Ability");
    enchantress:Action_LevelAbility("enchantress_untouchable");
end


function Move1()
	local enchantress = GetBot();
	enchantress:Action_MoveToLocation(RADIANT_SECRET_SHOP_POS);
end

function Move2()
	local enchantress = GetBot();
	enchantress:Action_MoveToLocation(RADIANT_BOUNTY_TOP_POS);
end

function Move3()
	local enchantress = GetBot();
	enchantress:Action_MoveToLocation(RADIANT_TOP_T1_POS);
end


function RadiantThink()
	local enchantress = GetBot();
	if DotaTime()<-10 then
		Move1();
	elseif DotaTime()<0 then
		Move2();
	elseif DotaTime()>=0 and DotaTime()<=1 then
		enchantress:Action_PickUpRune(enchantress);
	else
		Move3();
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