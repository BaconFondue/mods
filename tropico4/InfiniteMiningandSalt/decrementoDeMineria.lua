function ProductionDropBM()
    BoreholeMine.ProductionDrop = 0
end

local FiredOnce = false
OnMsg.UASetMode = function(actions,mode)
    if not FiredOnce then
        if(mode == "Boot") then
            FiredOnce = true
            CreateRealTimeThread(function()
                ProductionDropBM()
            end)
        end
    end
end