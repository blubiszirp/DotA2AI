require( GetScriptDirectory().."/locations/locations" )

----------------------------------------------------------------------------------------
-- Ability
----------------------------------------------------------------------------------------
function ThinkLvlupAbility()
    local viper = GetBot();
	--print("Try to LevelUp Ability");
    --viper:Action_LevelAbility("enchantress_untouchable");
end

----------------------------------------------------------------------------------------
-- Variables
----------------------------------------------------------------------------------------
local STATE_PREGAME_RADIANT = "STATE_PREGAME_RADIANT";
local STATE_T1_FARMING_MID = "STATE_T1_FARMING_MID";
local STATE_RUN_AWAY = "STATE_RUN_AWAY";


----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- Viper Radiant Mid
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
local function MoveToRadiantSecretShop()
	local viper = GetBot();
	viper:Action_MoveToLocation(RADIANT_SECRET_SHOP_POS);
end

local function MoveToRadiantBountyRuneTop()
	local viper = GetBot();
	viper:Action_MoveToLocation(RADIANT_BOUNTY_RUNE_OFF_POS);
end

local function MoveToRadiantMidT1()
	local viper = GetBot();
	viper:Action_MoveToLocation(Vector(-1400,-1300,0));
end

local function PreGameRadiant(StateMachine)
	local viper = GetBot();
	if DotaTime()<-10 then
		MoveToRadiantSecretShop();
	elseif DotaTime()<0 then
		MoveToRadiantBountyRuneTop();
	elseif DotaTime()>=0 and DotaTime()<=1 then
		viper:Action_PickUpRune(viper);
	else
		MoveToRadiantMidT1();
		StateMachineState = STATE_T1_FARMING_MID;
	end
end

----------------------------------------------------------------------------------------
-- State Machine
----------------------------------------------------------------------------------------
local StateMachine = {};
StateMachine["State"] = STATE_PREGAME_RADIANT;
StateMachine[STATE_PREGAME_RADIANT] = PreGameRadiant;
StateMachine[STATE_T1_FARMING_MID] = PreGameRadiant;

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
local function RadiantThink()
	print("STATE: "..StateMachine.State);
	StateMachine[StateMachine.State](StateMachine);
end


function Think()
	if ( GetTeam() == TEAM_RADIANT )
	then
		RadiantThink();
	end
end