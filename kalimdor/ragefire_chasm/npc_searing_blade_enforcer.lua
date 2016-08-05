--[[
    EmuDevs <http://emudevs.com/forum.php>
    Eluna Lua Engine <https://github.com/ElunaLuaEngine/Eluna>
    Eluna Scripts <https://github.com/ElunaLuaEngine/Scripts>
    Eluna Wiki <http://wiki.emudevs.com/doku.php?id=eluna>

    -= Script Information =-
    * Script Type: Trash Mob
    * Npc: Searing Blade Enforcer <11323>
--]]

local NPC_SEARING_BLADE_ENFORCER = 11323
local SPELL_SHIELD_SLAM = 8242

function OnEnterCombat(event, creature, target)
    creature:RegisterEvent(CastShieldSlam, 8000, 0)
end

function CastShieldSlam(event, delay, pCall, creature)
    if (math.random(1, 100) <= 75) then
        creature:CastSpell(creature:GetVictim(), SPELL_SHIELD_SLAM)
    end
end

function Reset(event, creature)
    creature:RemoveEvents()
end

RegisterCreatureEvent(NPC_SEARING_BLADE_ENFORCER, 1, OnEnterCombat) -- OnEnterCombat
RegisterCreatureEvent(NPC_SEARING_BLADE_ENFORCER, 2, Reset) -- OnLeaveCombat
RegisterCreatureEvent(NPC_SEARING_BLADE_ENFORCER, 4, Reset) -- OnDied
