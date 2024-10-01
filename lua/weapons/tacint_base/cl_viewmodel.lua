function SWEP:ViewModelDrawn(vm)
    if IsValid(self.QuickNadeModel) then
        self.QuickNadeModel:DrawModel()
    end

    self:DrawCustomModel(false)
    self:DrawLasers()
end

function SWEP:DrawCustomModel(wm)

    if !wm and !IsValid(self:GetOwner()) then return end
    if !wm and self:GetOwner():IsNPC() then return end

    local mdl = self.VModel

    if wm then
        mdl = self.WModel
    end

    if !mdl then
        self:SetupModel(wm)
        return
    end

    local parentmdl = self

    if !wm then
        parentmdl = self:GetVM()
    end

    for _, model in pairs(mdl) do
        local slot = model.Slot
        local slottbl = self.Attachments[slot]
        local bone = slottbl.Bone
        local atttbl = TacInt.GetAttTable(self.Attachments[slot].Installed)

        if wm then
            bone = slottbl.WMBone or "ValveBiped.Bip01_R_Hand"
        end

        local offset_pos = slottbl.Pos_VM
        local offset_ang = slottbl.Ang_VM

        if wm then
            offset_pos = slottbl.Pos_WM
            offset_ang = slottbl.Ang_WM
        end

        local boneindex = parentmdl:LookupBone(bone)

        if !boneindex then continue end

        local bonemat = parentmdl:GetBoneMatrix(boneindex)
        if bonemat then
            bpos = bonemat:GetTranslation()
            bang = bonemat:GetAngles()
        end

        local apos, aang

        apos = bpos + bang:Forward() * offset_pos.x
        apos = apos + bang:Right() * offset_pos.y
        apos = apos + bang:Up() * offset_pos.z

        aang = Angle()
        aang:Set(bang)

        aang:RotateAroundAxis(aang:Right(), offset_ang.p)
        aang:RotateAroundAxis(aang:Up(), offset_ang.y)
        aang:RotateAroundAxis(aang:Forward(), offset_ang.r)

        local moffset = (atttbl.ModelOffset or Vector(0, 0, 0)) * (slottbl.VMScale or 1)

        apos = apos + aang:Forward() * moffset.x
        apos = apos + aang:Right() * moffset.y
        apos = apos + aang:Up() * moffset.z

        model:SetPos(apos)
        model:SetAngles(aang)
        model:SetRenderOrigin(apos)
        model:SetRenderAngles(aang)

        model:DrawModel()
    end

    if !wm then
        self:DrawFlashlightsVM()
    end
end

function SWEP:PreDrawViewModel()
    if self:GetValue("ScopeHideWeapon") and wpn:GetScopeLevel() > 0 then
        render.SetBlend(0)

    end

    -- cam.Start3D(nil, nil, 70)

    --cam.Start3D(nil, nil, self.ViewModelFOV, nil, nil, nil, nil, 0.1, nil)
    cam.IgnoreZ(true)
    -- self:DrawEjectedShells()
end

function SWEP:PostDrawViewModel()
    --cam.End3D()
    cam.IgnoreZ(false)

    if self:GetValue("ScopeHideWeapon") and wpn:GetScopeLevel() > 0 then
        render.SetBlend(1)
    end
end
