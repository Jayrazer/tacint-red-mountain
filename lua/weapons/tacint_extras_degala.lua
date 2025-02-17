SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Desert Eagle"
SWEP.Category = "Tactical Intervention (Extras)"

SWEP.Description = "Large magnum pistol. Unwieldly, impractical, but extremely powerful."

SWEP.ViewModel = "models/weapons/tacint_extras/v_deagle.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_deagle.mdl"

SWEP.Slot = 1

// "ballistics"

SWEP.Damage_Max = 100 / 2 // damage at minimum range
SWEP.Damage_Min = 100 / 7 // damage at maximum range
SWEP.Range_Min = 570 // distance for which to maintain maximum damage
SWEP.Range_Max = 800 // distance at which we drop to minimum damage
SWEP.Penetration = 1 // units of metal this weapon can penetrate

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 2,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 1,
    [HITGROUP_RIGHTLEG] = 1,
    [HITGROUP_GEAR] = 1
}

// misc. shooting

SWEP.Firemode = 1

SWEP.RPM = 300

SWEP.Spread = 0

// Spread penalties are in spread units and are additive
SWEP.MoveSpreadPenalty = 0.025 // spread penalty while travelling at max. 250 u/s
SWEP.MidAirSpreadPenalty = 0.065 // spread penalty for being in the air
SWEP.HipFireSpreadPenalty = 0.01 // spread penalty for not being scoped in
SWEP.ScopedSpreadPenalty = 0.01
SWEP.BlindFireSpreadPenalty = 0 // spread penalty for blind firing
SWEP.CrouchSpreadPenalty = -0.006

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 7
SWEP.RecoilResetTime = 0.3 // time after you stop shooting for recoil to start dissipating
SWEP.RecoilDissipationRate = 80
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 0.05
SWEP.RecoilVisualShake = 0.85

SWEP.RecoilKick = 1

SWEP.RecoilSpreadPenalty = 0.01 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 1
SWEP.ShootingSpeedMult = 1 // slow down applied while shooting
SWEP.SightedSpeedMult = 0.8
SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2 // seconds to apply slow down for

SWEP.SprintToFireTime = 0.25

// hold types

SWEP.HoldType = "revolver"
SWEP.HoldTypeSprint = "normal"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -2, -5)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -5)

SWEP.SprintAng = Angle(0, 30, 0)
SWEP.SprintPos = Vector(2, 0, -12)

// reload

SWEP.ClipSize = 7
SWEP.Ammo = "357"

SWEP.ReloadTimeMult = 1.2

SWEP.DropMagazineModel = "models/weapons/tacint/magazines/gsr1911.mdl"
SWEP.DropMagazineImpact = "pistol"

// sounds

local path = "tacint_extras/degala/"
local path1 = "tacint/weapons/gsr1911/"

SWEP.Sound_Shoot = path .. "deagle-1.wav"

SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 4

SWEP.MuzzleEffect = "muzzleflash_shotgun"

// anims

// VM:
// idle
// fire
// fire1, fire2...
// dryfire
// melee
// reload
// midreload
// prime_grenade
// throw_grenade
// throw_grenade_underhand
// deploy
// blind_idle
// blind_fire
// blind_fire1, blind_fire2...
// blind_dryfire

// WM:
// attack1
SWEP.AnimationTranslationTable = {
    ["deploy"] = "draw",
    ["fire"] = {"shoot1", "shoot2", "shoot3"},
    ["blind_fire"] = {"blind_shoot1", "blind_shoot2", "blind_shoot3"},
    ["melee"] = {"melee1", "melee2"}
}

SWEP.LastShot = true

// attachments

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_smg", "optic_cqb"}, 
        Bone = "ValveBiped.GSR1911_rootbone",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/optic_on.wav",
        DetachSound = "tacint/weapons/optic_off.wav",
        VMScale = 0.9,
        WMScale = 1,
        Pos_VM = Vector(-3.8, 0, 5.55),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 4, -0.2),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Tactical",
        Category = "tactical",
        Bone = "ValveBiped.GSR1911_rootbone",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/flashlight_on.wav",
        DetachSound = "tacint/weapons/flashlight_off.wav",
        VMScale = 1.1,
        WMScale = 1.3,
        Pos_VM = Vector(-1.7, 0, 7),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(0, 5, -2.7),
        Ang_WM = Angle(0, -90, 180),
    },
    [3] = {
        PrintName = "Perk",
        Category = {"perk", "perk_melee", "perk_shooting", "perk_reload", "acc_quickdraw"},
        AttachSound = "tacint/weapons/flashlight_on.wav",
        DetachSound = "tacint/weapons/flashlight_off.wav",
    },
}

local function addsound(name, spath)
    sound.Add({
        name = name,
        channel = 16,
        volume = 1.0,
        sound = spath
    })
end

addsound("tacint_degala.clip_in", path .. "Deagle Mag In.wav")
addsound("tacint_degala.clip_in-mid", path .. "Deagle Mag In.wav")
addsound("tacint_degala.clip_out", path .. "Deagle Mag Out.wav")
addsound("tacint_degala.slide_action", path1 .. "gsr1911_slide_action.wav")
addsound("tacint_degala.slide_shut", path1 .. "gsr1911_slide_shut.wav")
addsound("tacint_degala.cock_hammer", path1 .. "gsr1911_cockhammer.wav")
