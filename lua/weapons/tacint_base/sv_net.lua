function SWEP:NetworkWeapon(sendto)
    net.Start("tacint_networkweapon")
    net.WriteEntity(self)

    for slot, slottbl in pairs(self.Attachments) do
        if !slottbl.Installed then net.WriteUInt(0, TacInt.Attachments_Bits) continue end

        local atttbl = TacInt.GetAttTable(slottbl.Installed)

        net.WriteUInt(atttbl.ID, TacInt.Attachments_Bits)
    end

    if sendto then
        net.Send(sendto)
    else
        net.SendPVS(self:GetPos())
    end

    self:DoBodygroups(true)
    self:DoBodygroups(false)
end

function SWEP:ReceivePreset()
    for slot, slottbl in pairs(self.Attachments) do
        local attid = net.ReadUInt(TacInt.Attachments_Bits)

        if attid == 0 then
            slottbl.Installed = nil
        else
            local att = TacInt.Attachments_Index[attid]
            local atttbl = TacInt.GetAttTable(att)

            if !atttbl then continue end

            if TacInt:PlayerGetAtts(self:GetOwner(), att) > 0 then
                slottbl.Installed = att
            end
        end
    end

    self:NetworkWeapon()

    self.StatCache = {}
    self.HookCache = {}

    self:SetBaseSettings()

    if self:GetValue("TryUnholster") then
        self:DoDeployAnimation()
    end

    self:RestoreClip(self.Primary.ClipSize)
end