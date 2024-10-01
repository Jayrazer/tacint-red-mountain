ATT.PrintName = "Auto"
ATT.FullName = "Fully-Automatic Firegroup"

ATT.AdminOnly = false
ATT.ShareInvAtt = ""
ATT.Free = false
ATT.Ignore = false

ATT.Icon = Material("entities/tacint_att_trigger_burstauto.png", "mips smooth")
ATT.Description = "Aftermarket FCG that converts the weapon to fully-automatic fire."
ATT.Pros = {"Full-auto fire"}
ATT.Cons = {"Increased recoil", "Increased spread"}

ATT.Category = "fcg_auto" // can be "string" or {"list", "of", "strings"}

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

ATT.Override_Firemode = 2
ATT.Mult_RecoilSpreadPenalty = 5