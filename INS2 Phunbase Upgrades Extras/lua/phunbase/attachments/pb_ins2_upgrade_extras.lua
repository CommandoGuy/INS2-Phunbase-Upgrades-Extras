local att = {}
att.name = "pb_ins2_att_optic_pkas2"
att.menuName = "PK-AS x2"

function att:attachCallback()
	if CLIENT then
		local velement = self:getVElementByName(att.name)
		if velement then
			self.RTScope_Entity = velement
		end
	end
	self.RTScope_Reticle = Material("models/weapons/gmod4phun_ins2/upgrades/pkas2/pkas_reticle")
end

function att:detachCallback()
	if CLIENT then
		self.RTScope_Entity = self.VM
	end
	self:_restoreOrigValue("RTScope_Reticle")
end

function att:think()
	if CLIENT then
		local velement = self:getVElementByName(att.name)
		if velement then
			if self:GetIron() then
				velement:SetSequence(1)
			else
				velement:SetSequence(2)
			end
		end
	end
end
PHUNBASE:registerAttachment(att)


