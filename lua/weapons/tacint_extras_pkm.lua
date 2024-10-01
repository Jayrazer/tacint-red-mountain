SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "PKM"
SWEP.Category = "Tactical Intervention (Extras)"

SWEP.Description = "Heavy machine gun with a low rate of fire and high damage."

SWEP.ViewModel = "models/weapons/tacint_extras/v_pkm.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_pkm.mdl"

SWEP.Slot = 3

// "ballistics"

SWEP.Damage_Max = 100 / 3 // damage at minimum range
SWEP.Damage_Min = 100 / 10 // damage at maximum range
SWEP.Range_Min = 800 // distance for which to maintain maximum damage
SWEP.Range_Max = 1450 // distance at which we drop to minimum damage
SWEP.Penetration = 4 // units of metal this weapon can penetrate

// misc. shooting

SWEP.Firemode = 2

SWEP.RPM = 675

SWEP.Spread = 0.02

// Spread penalties are in spread units and are additive
SWEP.MoveSpreadPenalty = 0.024 // spread penalty while travelling at max. 250 u/s
SWEP.MidAirSpreadPenalty = 0.075 // spread penalty for being in the air
SWEP.HipFireSpreadPenalty = 0 // spread penalty for not being scoped in
SWEP.ScopedSpreadPenalty = -0.006
SWEP.BlindFireSpreadPenalty = 0.05 // spread penalty for blind firing
SWEP.CrouchSpreadPenalty = -0.004

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 10
SWEP.RecoilResetTime = 0.25 // time after you stop shooting for recoil to start dissipating
SWEP.RecoilDissipationRate = 80
SWEP.RecoilFirstShotMult = 2.5 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 0.25
SWEP.RecoilVisualShake = 0.4

SWEP.RecoilKick = 0.75

SWEP.RecoilSpreadPenalty = 0.004 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.8
SWEP.ShootingSpeedMult = 0.5 // slow down applied while shooting
SWEP.SightedSpeedMult = 0.6
SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2 // seconds to apply slow down for

SWEP.SprintToFireTime = 0.5 // multiplies how long it takes to recover from sprinting

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -4, -5)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -4, -3)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -2)

// reload

SWEP.ClipSize = 100
SWEP.Ammo = "ar2"

SWEP.ReloadTimeMult = 1.15
SWEP.DropMagazineModel = "models/weapons/tacint_extras/magazines/pkm.mdl"
SWEP.DropMagazineImpact = "metal"

SWEP.BulletBodygroups = {
    [1] = {5, 0},
    [2] = {5, 1},
    [3] = {5, 2},
    [4] = {5, 3},
    [5] = {5, 4},
    [6] = {5, 5},
    [7] = {5, 6},
}
SWEP.DefaultBodygroups = "000007"

// sounds

local path = "tacint_extras/pkm/pkm"

SWEP.Sound_Shoot = "^" .. path .. "-1.wav"
SWEP.Sound_Shoot_Silenced = "^" .. path .. "-1_silenced.wav"

SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_minimi"
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
    ["fire1"] = "fire1_M",
    ["fire2"] = "fire2_M",
    ["fire3"] = "fire3_M",
    ["fire4"] = "fire4_M",
    ["fire5"] = "fire5_M",
    ["melee"] = {"melee1", "melee2"}
}

// attachments

SWEP.AttachmentElements = {
    ["sights"] = {
        BGs_VM = {
            {3, 1}
        },
        BGs_WM = {
            {3, 1}
        },
    },
}

//ValveBiped.MG4_root

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium"},
        Bone = "ValveBiped.feed_cover",
        InstalledElements = {"sights"},
        AttachSound = "tacint/weapons/optic_on.wav",
        DetachSound = "tacint/weapons/optic_off.wav",
        VMScale = 1.2,
        Pos_VM = Vector(-1.85, 0, -0.2),
        Pos_WM = Vector(11, 1.15, -8),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, 0, 180),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped.MG4_root",
        AttachSound = "tacint/weapons/silencer_on.wav",
        DetachSound = "tacint/weapons/silencer_off.wav",
        Pos_VM = Vector(-5.1, -0.03, 43.5),
        Pos_WM = Vector(43.5, 1.3, -5.3),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, 0, 180),
    },
    [3] = {
        PrintName = "Tactical",
        Category = "tactical",
        Bone = "ValveBiped.MG4_root",
        AttachSound = "tacint/weapons/flashlight_on.wav",
        DetachSound = "tacint/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        Pos_VM = Vector(-5.25, -0.6, 25),
        Pos_WM = Vector(27.5, 1.6, -5.2),
        Ang_VM = Angle(90, 0, -90),
        Ang_WM = Angle(0, 0, 90),
    },
    [4] = {
        PrintName = "Perk",
        Category = {"perk", "perk_melee", "perk_shooting", "perk_reload", "extendedbelt"},
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

addsound("tacint_pkm.Clip_Out", path .. "_boxout.wav")
addsound("tacint_pkm.Clip_In", path .. "_boxin.wav")
addsound("tacint_pkm.bolt_release", path .. "bolt_release-1.wav")
addsound("tacint_pkm.bolt_back", path .. "_bolt.wav")
addsound("tacint_pkm.bolt_forward", path .. "_coversmack.wav")
addsound("tacint_pkm.feedcover_close", path .. "_coverdown.wav")
addsound("tacint_pkm.feedcover_open", path .. "_coverup.wav")
addsound("tacint_pkm.insertbullets", path .. "_chain.wav")
addsound("tacint_pkm.deploy", path .. "_cloth.wav")