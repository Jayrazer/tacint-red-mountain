SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Hécate II"
SWEP.Category = "Tactical Intervention (Extras)"

SWEP.Description = "Bolt-action anti-material rifle that offers great control given its high recoil."

SWEP.ViewModel = "models/weapons/tacint_extras/v_hecate.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_hecate.mdl"

SWEP.Slot = 3

// "ballistics"

SWEP.Damage_Max = 34 // damage at minimum range
SWEP.Damage_Min = 80 // damage at maximum range
SWEP.Range_Min = 1350 // distance for which to maintain maximum damage
SWEP.Range_Max = 2260 // distance at which we drop to minimum damage
SWEP.Penetration = 30 // units of metal this weapon can penetrate
SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 3, // --Nobody's surviving a headshot from any distance.
    [HITGROUP_CHEST] = 1.25,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
    [HITGROUP_GEAR] = 0.8
}
SWEP.MeleeDamage = 30 // --to be fair youre smacking someone with a 30 lbs gun that shits gotta hurt a lil more than usual

// misc. shooting

SWEP.Firemode = 1

SWEP.RPM = 37

SWEP.Spread = 0

SWEP.ShootSpeedMult = 1

// Spread penalties are in spread units and are additive
SWEP.MoveSpreadPenalty = 0.15 // spread penalty while travelling at max. 250 u/s
SWEP.MidAirSpreadPenalty = 0.25 // spread penalty for being in the air
SWEP.HipFireSpreadPenalty = 0.35 // spread penalty for not being scoped in
SWEP.ScopedSpreadPenalty = 0
SWEP.BlindFireSpreadPenalty = 0.05 // spread penalty for blind firing
SWEP.CrouchSpreadPenalty = -0.05

SWEP.RecoilPerShot = 1.2
SWEP.RecoilMaximum = 2
SWEP.RecoilResetTime = 0 // time after you stop shooting for recoil to start dissipating
SWEP.RecoilDissipationRate = 0.6
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 3
SWEP.RecoilVisualShake = 0.9

SWEP.RecoilKick = 6

SWEP.RecoilSpreadPenalty = 0.2 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.85
SWEP.ShootingSpeedMult = 0.75
SWEP.SightedSpeedMult = 0.5
SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2 // seconds to apply slow down for

SWEP.SprintToFireTime = 0.6

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(2, -2, -6)

SWEP.BlindFireAng = Angle(0, 15, -60)
SWEP.BlindFirePos = Vector(1, -2, -1)

SWEP.BlindFireCornerAng = Angle(75, 0, 0)
SWEP.BlindFireCornerPos = Vector(8, 10, -6)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -4)

// scope

SWEP.Scope = true
SWEP.ScopeOverlay = Material("tacint/scopes/sniper.png", "mips smooth") // Material("path/to/overlay")
SWEP.ScopeFOV = 90 / 15
SWEP.ScopeLevels = 1 // 2 = like CS:S

SWEP.QuickScopeSpreadPenalty = 0.25
SWEP.QuickScopeTime = 0.9 // amount of time over which to fade out the quickscope spread penalty

// reload

SWEP.ClipSize = 5
SWEP.Ammo = "sniperpenetratedround"

SWEP.ReloadTimeMult = 1.5
SWEP.DropMagazineImpact = "metal"
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/uratio.mdl"

// sounds

local path = "tacint_extras/hecate/ax308_"

SWEP.Sound_Shoot = {"^" .. path .. "fire_1.wav", "^" .. path .. "fire_2.wav", "^" .. path .. "fire_3.wav"}
SWEP.Sound_Shoot_Silenced = "tacint/weapons/ak47/ak47_fire_silenced-1.wav"

SWEP.Vol_Shoot = 130
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_1"
SWEP.EjectDelay = 0.9
SWEP.EjectEffect = 2

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
    ["deploy"] = "unholster",
    ["fire"] = {"shoot1", "shoot2"},
    ["blind_idle"] = "idle",
    ["blind_fire"] = "shoot1",
    ["reload"] = "reload",
}

// attachments

SWEP.AttachmentElements = {
    ["optic"] = {
        BGs_VM = {
            {1, 2}
        },
        BGs_WM = {
            {1, 2}
        },
		Mult_HipFireSpreadPenalty = 0.4,
		Mult_MoveSpreadPenalty = 0.6,
    },
    ["irons"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        },
        Mult_HipFireSpreadPenalty = 0.05,
        Mult_CrouchSpreadPenalty = -0.025,
        Mult_MoveSpreadPenalty = 4,
    },
    ["tactical"] = {
        BGs_VM = {
            {2, 1}
        },
        BGs_WM = {
            {2, 1}
        },
    },
}

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"ironsights", "optic_cqb", "optic_medium", "optic_sniper"},
        WMBone = "Box01",
        Bone = "ValveBiped.uratio_rootbone",
        AttachSound = "tacint/weapons/optic_on.wav",
        DetachSound = "tacint/weapons/optic_off.wav",
        InstalledElements = {"optic"},
        Pos_VM = Vector(-5.8, 0, 5),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 5.5, 2.2),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Tactical",
        Category = "tactical",
        WMBone = "Box01",
        Bone = "ValveBiped.uratio_rootbone",
        AttachSound = "tacint/weapons/flashlight_on.wav",
        DetachSound = "tacint/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        Pos_VM = Vector(-3.85, -1.5, 19.5),
        Ang_VM = Angle(90, 0, -90),
        Pos_WM = Vector(0, 23.75, -2),
        Ang_WM = Angle(0, -90, 180),
    },
    [3] = {
        PrintName = "Perk",
        Category = {"perk", "perk_melee", "perk_shooting", "perk_reload"},
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

addsound("tacint_extras_hecate.Clip_Out", path .. "magout.wav")
addsound("tacint_extras_hecate.Clip_In", path .. "magin.wav")
addsound("tacint_extras_hecate.Bolt_Back", path .. "boltrelease.wav")
addsound("tacint_extras_hecate.bolt_Forward", path .. "boltback.wav")
addsound("tacint_extras_hecate.Bolt_Up", path .. "boltup.wav")
addsound("tacint_extras_hecate.bolt_down", path .. "boltdown.wav")