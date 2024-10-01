function SWEP:DoBodygroups(wm)
    if !wm and !IsValid(self:GetOwner()) then return end
    if !wm and self:GetOwner():IsNPC() then return end

    local dbg = self:GetValue("DefaultBodygroups")

    local mdl

    if wm then
        mdl = self
        dbg = self:GetValue("DefaultWMBodygroups")
    else
        mdl = self:GetVM()
    end

    if !IsValid(mdl) then return end

    mdl:SetBodyGroups(dbg or "")
	if self:GetValue("DefaultSkin") then
		mdl:SetSkin(self:GetValue("DefaultSkin"))
	end

    for i, k in pairs(self:GetElements()) do
        if wm then
            for _, j in pairs(k.BGs_WM or {}) do
                mdl:SetBodygroup(j[1], j[2])
            end
        else
            for _, j in pairs(k.BGs_VM or {}) do
                mdl:SetBodygroup(j[1], j[2])
            end
        end
    end

    local bbg = self:GetValue("BulletBodygroups")

    if bbg then
        local amt = self:Clip1()

        if self:GetReloading() then
            amt = self:GetLoadedRounds()
        end

        for c, bgs in pairs(bbg) do
            if amt < c then
                mdl:SetBodygroup(bgs[1], bgs[2])
                break
            end
        end
    end
end

function SWEP:GetElements()
    local eles = {}

    for i, k in pairs(self.Attachments) do
        if k.Installed then
            table.Add(eles, k.InstalledElements or {})

            local atttbl = TacInt.GetAttTable(k.Installed)

            table.Add(eles, atttbl.InstalledElements or {})
        else
            table.Add(eles, k.UnInstalledElements or {})
        end
    end

    local eleatts = {}

    for i, k in pairs(eles) do
        if self.AttachmentElements then
            table.insert(eleatts, self.AttachmentElements[k])
        end
    end

    return eleatts
end

function SWEP:DoBulletBodygroups()
    self:DoBodygroups(false)
end