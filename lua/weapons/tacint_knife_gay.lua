SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Jackal Knife"
SWEP.Category = "Tactical Intervention - Equipment"

SWEP.Description = "Fancy collectors knife, not meant for combat but looks pretty gangster."

SWEP.ViewModel = "models/weapons/tacint/v_knife2.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_knife2.mdl"

SWEP.NoRanger = true
SWEP.NoStatBox = true

SWEP.NPCUsable = false

SWEP.Slot = 0

SWEP.MeleeDamage = 60
SWEP.MeleeDelay = 0.70

// misc. shooting

SWEP.Ammo = ""
SWEP.ClipSize = -1

// handling
SWEP.Spread = 0.01
SWEP.MoveSpreadPenalty = 0
SWEP.MidAirSpreadPenalty = 0
SWEP.HipFireSpreadPenalty = 0
SWEP.ScopedSpreadPenalty = 0
SWEP.BlindFireSpreadPenalty = 0
SWEP.CrouchSpreadPenalty = 0

SWEP.MoveSpeedMult = 1

SWEP.PrimaryMelee = true
SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2 // seconds to apply slow down for

SWEP.SprintToFireTime = 0.15

SWEP.Scope = false

SWEP.FreeAim = false

SWEP.QuickNadeTimeMult = 0.75

// sounds

local path = "tacint/weapons/knife/"

SWEP.Sound_Shoot = {path .. "swing-1.wav", path .. "swing-2.wav", path .. "swing-3.wav", path .. "swing-4.wav", path .. "swing-5.wav", path .. "swing-6.wav"}

// hold types

SWEP.HoldType = "knife"
SWEP.HoldTypeSprint = "knife"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL
SWEP.GestureBash = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(2.5, -1, -4)

SWEP.SprintAng = Angle(0, -25, -10)
SWEP.SprintPos = Vector(3, 0, -2)

SWEP.SprintMidPoint = {
    Pos = Vector(0.25, 2, 1),
    Ang = Angle(0, -5, 10)
}

SWEP.AnimationTranslationTable = {
    ["deploy"] = "deploy",
    ["melee"] = {"slash_left1", "slash_left2", "slash_right1", "slash_right2", "slash_forward1", "slash_forward2"},
    ["idle"] = "idle"
}

SWEP.Sound_MeleeHit = {
    path .. "/scrape_metal-1.wav",
    path .. "/scrape_metal-2.wav",
    path .. "/scrape_metal-3.wav",
}

SWEP.Sound_MeleeHitBody = {
    path .. "/flesh_hit-1.wav",
    path .. "/flesh_hit-2.wav",
    path .. "/flesh_hit-3.wav",
    path .. "/flesh_hit-4.wav",
    path .. "/flesh_hit-5.wav",
}

SWEP.Sound_MeleeSwing = {
    path .. "swing-1.wav",
    path .. "swing-2.wav",
    path .. "swing-3.wav",
    path .. "swing-4.wav",
    path .. "swing-5.wav",
    path .. "swing-6.wav",
}

// attachments

SWEP.Attachments = {
    [1] = {
        PrintName = "Perk",
        Category = {"perk","perk_swing"},
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

addsound("tacint_knife.deploy", path .. "open-1.wav")