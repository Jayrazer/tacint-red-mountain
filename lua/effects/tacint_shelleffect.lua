EFFECT.Type = 1

EFFECT.Pitch = 100

EFFECT.Model = "models/shells/shell_57.mdl"

EFFECT.AlreadyPlayedSound = false
EFFECT.ShellTime = 1
EFFECT.SpawnTime = 0

EFFECT.TypeSettings = {
    [1] = {
        Model = "models/tacint/shells/pistol_shell.mdl",
        Sounds = {
            "tacint/shells/shell_drop-1.wav",
            "tacint/shells/shell_drop-2.wav",
            "tacint/shells/shell_drop-3.wav",
            "tacint/shells/shell_drop-4.wav",
            "tacint/shells/shell_drop-5.wav",
        }
    },
    [2] = {
        Model = "models/tacint/shells/rifle_shell.mdl",
        Sounds = {
            "tacint/shells/shell_drop-1.wav",
            "tacint/shells/shell_drop-2.wav",
            "tacint/shells/shell_drop-3.wav",
            "tacint/shells/shell_drop-4.wav",
            "tacint/shells/shell_drop-5.wav",
        }
    },
    [3] = {
        Model = "models/tacint/shells/shotgun_shell.mdl",
        Sounds = {
            "tacint/shells/shotshell_drop-1.wav",
            "tacint/shells/shotshell_drop-2.wav",
            "tacint/shells/shotshell_drop-3.wav",
            "tacint/shells/shotshell_drop-4.wav",
            "tacint/shells/shotshell_drop-5.wav",
        }
    },
}

function EFFECT:Init(data)

    local att = data:GetAttachment()
    local ent = data:GetEntity()
    local type = data:GetFlags()

    self.Type = type or self.Type

    local typetbl = self.TypeSettings[self.Type]

    if !IsValid(ent) then self:Remove() return end
    if !IsValid(ent:GetOwner()) then self:Remove() return end

        local origin, ang, dir

    if ent:GetOwner() == LocalPlayer() and ent:GetValue("ScopeHideWeapon") and ent:GetScopeLevel() > 0 then
		self:Remove()
    elseif LocalPlayer():ShouldDrawLocalPlayer() or ent:GetOwner() != LocalPlayer() then
        mdl = ent
        att = 2
    else
        mdl = LocalPlayer():GetViewModel()
    end

    if !IsValid(ent) then self:Remove() return end
    if !mdl or !IsValid(mdl) then self:Remove() return end
    if !mdl:GetAttachment(att) then self:Remove() return end
    if !typetbl then return end

    local origin, ang = mdl:GetAttachment(att).Pos, mdl:GetAttachment(att).Ang

    -- ang:RotateAroundAxis(ang:Up(), -90)

    -- ang:RotateAroundAxis(ang:Right(), (ent.ShellRotateAngle or Angle(0, 0, 0))[1])
    -- ang:RotateAroundAxis(ang:Up(), (ent.ShellRotateAngle or Angle(0, 0, 0))[2])
    -- ang:RotateAroundAxis(ang:Forward(), (ent.ShellRotateAngle or Angle(0, 0, 0))[3])

    local dir = ang:Forward()

    ang:RotateAroundAxis(ang:Forward(), 90)
    ang:RotateAroundAxis(ang:Up(), 180)

    self:SetPos(origin)
    self:SetModel(typetbl.Model)
    self:DrawShadow(true)
    self:SetAngles(ang)

    self.Sounds = typetbl.Sounds

    local pb_vert = 2
    local pb_hor = 0.25

    local mag = 150

    self:PhysicsInitBox(Vector(-pb_vert,-pb_hor,-pb_hor), Vector(pb_vert,pb_hor,pb_hor))

    self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE_DEBRIS)

    local phys = self:GetPhysicsObject()

    local plyvel = Vector(0, 0, 0)

    if IsValid(ent.Owner) then
        plyvel = ent.Owner:GetAbsVelocity()
    end

    phys:Wake()
    phys:SetDamping(0, 0)
    phys:SetMass(1)
    phys:SetMaterial("gmod_silent")

    phys:SetVelocity((dir * mag * math.Rand(1, 2)) + plyvel)

    phys:AddAngleVelocity(VectorRand() * 100)
    phys:AddAngleVelocity(ang:Up() * 2500 * math.Rand(0.75, 1.25))

    -- local emitter = ParticleEmitter(origin)

    -- for i = 1, 3 do
    --     local particle = emitter:Add("particles/smokey", origin + (dir * 2))

    --     if (particle) then
    --         particle:SetVelocity(VectorRand() * 10 + (dir * i * math.Rand(48, 64)) + plyvel)
    --         particle:SetLifeTime(0)
    --         particle:SetDieTime(math.Rand(0.05, 0.15))
    --         particle:SetStartAlpha(math.Rand(40, 60))
    --         particle:SetEndAlpha(0)
    --         particle:SetStartSize(0)
    --         particle:SetEndSize(math.Rand(18, 24))
    --         particle:SetRoll(math.rad(math.Rand(0, 360)))
    --         particle:SetRollDelta(math.Rand(-1, 1))
    --         particle:SetLighting(true)
    --         particle:SetAirResistance(96)
    --         particle:SetGravity(Vector(-7, 3, 20))
    --         particle:SetColor(150, 150, 150)
    --     end
    -- end

    self.SpawnTime = CurTime()
end

function EFFECT:PhysicsCollide()
    if self.AlreadyPlayedSound then return end

    sound.Play(self.Sounds[math.random(#self.Sounds)], self:GetPos(), 65, 100, 1)

    self.AlreadyPlayedSound = true
end

function EFFECT:Think()
    if (self.SpawnTime + self.ShellTime) <= CurTime() then
        if !IsValid(self) then return end
        self:SetRenderFX( kRenderFxFadeFast )
        if (self.SpawnTime + self.ShellTime + 1) <= CurTime() then
            if !IsValid(self:GetPhysicsObject()) then return end
            self:GetPhysicsObject():EnableMotion(false)
            if (self.SpawnTime + self.ShellTime + 1.5) <= CurTime() then
                self:Remove()
                return
            end
        end
    end
    return true
end

function EFFECT:Render()
    if !IsValid(self) then return end
    self:DrawModel()
end