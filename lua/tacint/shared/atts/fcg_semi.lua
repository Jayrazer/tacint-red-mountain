ATT.PrintName = "Semi"
ATT.FullName = "Semi-Automatic Firegroup"

ATT.AdminOnly = false
ATT.ShareInvAtt = ""
ATT.Free = false
ATT.Ignore = false

ATT.Icon = Material("entities/tacint_att_trigger_hair.png", "mips smooth")
ATT.Description = "Civilian-market FCG that converts the weapon to semi-automatic fire."
ATT.Pros = {"Reduced recoil", "Reduced spread"}
ATT.Cons = {"Semi-automatic only"}

ATT.Category = "fcg_semi" // can be "string" or {"list", "of", "strings"}

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

ATT.Override_Firemode = 1
ATT.Mult_RecoilKick = 0.8
ATT.Mult_RecoilSpreadPenalty = 0.5