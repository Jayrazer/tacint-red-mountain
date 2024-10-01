ATT.PrintName = "Burst"
ATT.FullName = "3-round Burst Firegroup"

ATT.AdminOnly = false
ATT.ShareInvAtt = ""
ATT.Free = false
ATT.Ignore = false

ATT.Icon = Material("entities/tacint_att_trigger_burst.png", "mips smooth")
ATT.Description = "Military FCG that enables the weapon to fire in 3-round bursts"
ATT.Pros = {"3-round burst", "Increased firerate"}
ATT.Cons = {"Increased spread", "Reduced recoil recovery"}

ATT.Category = "fcg_burst" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 0

// Stat modifications are completely automatically handled now.

// You can do Mult_ before a stat, e.g.:
// Mult_RPM
// Mult_Recoil
// Mult_ScopedSpreadPenalty
// In order to multiply the value.

// You can do Add_ in a similar way, which will add a value.

// There is also Override_, which works similarly.
// Override_Priority_ will do what you would expect.

ATT.Override_Firemode = -3
ATT.Mult_RPM = 1.25
ATT.Mult_RecoilSpreadPenalty = 2
ATT.Mult_RecoilResetTime = 2