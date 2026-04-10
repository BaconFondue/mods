OnMsg.ClassesPreprocess = function()
	OilWellImpl.AddProduction = function(self, worker, worktime)
		if not self.resource then
			return
		end
		local performance = self:GetPerformance(worker)
		local output_modifier = performance + (self.prod_output_modifiers[1] or 0)
		local output_quantity = output_modifier > 0 and MulDivRound(self.prod_output_qty[1], output_modifier, 100) or 0
		local real_worktime = self:GetWorkTime()
		if real_worktime ~= worktime then
			output_quantity = MulDivRound(output_quantity, Min(worktime, real_worktime), real_worktime)
		end
		local taken = 0
		while output_quantity > taken do
			local pos, amount, idx = self.resource:ClosestSpot(self:GetPos())
			if not pos then
				break
			end
		local value = Min(amount, output_quantity)
		--value = self.resource:Remove(idx, value)
		taken = taken + value
		end
		local resource = self.prod_output[1]
		self.production_output[resource] = self.production_output[resource] + taken
		self:LogOutputProduction(taken, resource)
		self:UpdatePiles()
		if 0 >= self:GetResourceQuantity() then
			self:StartPumps(0)
		end
	end
end
