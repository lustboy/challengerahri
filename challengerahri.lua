if GetObjectName(GetMyHero()) == "Ahri" then
-- Menu
Config = scriptConfig("IAhri", "Ahri")
Config.addParam("Q", "Use Ahri Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use Ahri E", SCRIPT_PARAM_ONOFF, true)
-- Start
OnLoop(function(myHero)
local unit = GetCurrentTarget()
if ValidTarget(unit, 1100) then
if IWalkConfig.Harass then

-- Ahri Q
	-- GetPredictionForPlayer(startPosition, targetUnit, targetUnitMoveSpeed, spellTravelSpeed, spellDelay, spellRange, spellWidth, collision, addHitBox)
local QPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),2500,250,1000,100,false,true)
	if Config.Q then
		if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
	CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
		end
	end
-- Ahri E
		-- GetPredictionForPlayer(startPosition, targetUnit, targetUnitMoveSpeed, spellTravelSpeed, spellDelay, spellRange, spellWidth, collision, addHitBox)
local EPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),1550,250,1000,60,true,true)
	if Config.E then
		if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 then
	CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
		end
	end

end
end
end)
end
