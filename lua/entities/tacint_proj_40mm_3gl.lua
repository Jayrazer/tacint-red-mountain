AddCSLuaFile()

ENT.Base                     = "tacint_proj_base"
ENT.PrintName                = "40mm 3GL"
ENT.Spawnable                = false

ENT.Model                    = "models/weapons/tacint/grenade_40mm.mdl"

ENT.IsRocket = false // projectile has a booster and will not drop.

ENT.InstantFuse = false // projectile is armed immediately after firing.
ENT.RemoteFuse = false // allow this projectile to be triggered by remote detonator.
ENT.ImpactFuse = true // projectile explodes on impact.

ENT.ExplodeOnDamage = false // projectile explodes when it takes damage.
ENT.ExplodeUnderwater = true

ENT.Delay = 0

ENT.ExplodeSounds = {
    "^tacint/weapons/grenade/40mm_explode-1.wav",
    "^tacint/weapons/grenade/40mm_explode-2.wav",
    "^tacint/weapons/grenade/40mm_explode-3.wav",
}

ENT.AudioLoop = "tacint/weapons/rpg7/rocket_flight-1.wav"

ENT.SmokeTrail = true

function ENT:Detonate()
    util.BlastDamage(self, self:GetOwner(), self:GetPos(), 160, 80)

    local fx = EffectData()
    fx:SetOrigin(self:GetPos())

    if self:WaterLevel() > 0 then
        util.Effect("WaterSurfaceExplosion", fx)
    else
        util.Effect("helicoptermegabomb", fx)
    end

    self:EmitSound(table.Random(self.ExplodeSounds), 125)

    self:Remove()
end