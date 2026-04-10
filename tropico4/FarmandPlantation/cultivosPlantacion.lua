function cultivosDePlantacion()
	--options/opciones
	local trabajadores = 12--max num workers(integer > 0)
	local parcelas = 24--max num fields(integer > 0)
	--CODE/CODIGO
    Plantation["max_fields"] = parcelas
    Plantation["num_workers"] = trabajadores
    Plantation["modes"] = {
    {
      id = "Corn",
      name = "[[PlantFarm mode1_name][Corn][PlantFarm name]]",
      param1 = 230,
      param2 = 232,
      param3 = 80,
      rollover = "[[PlantFarm mode1_rollover][Corn is suited to almost all conditions][PlantFarm name]]"
    },
    {
      id = "Banana",
      name = "[[PlantFarm mode2_name][Banana][PlantFarm name]]",
      param1 = 330,
      param2 = 371,
      param3 = 80,
      rollover = "[[PlantFarm mode2_rollover][Bananas are a versatile crop that prefers relatively higher ground][WorkModeWrapper rollover]]"
    },
    {
      id = "Papaya",
      name = "[[PlantFarm mode3_name][Papaya][PlantFarm name]]",
      param1 = 330,
      param2 = 313,
      param3 = 80,
      rollover = "[[PlantFarm mode3_rollover][Papayas prefer humid areas][PlantFarm name]]"
    },
    {
      id = "Pineapple",
      name = "[[PlantFarm mode4_name][Pineapple][PlantFarm name]]",
      param1 = 360,
      param2 = 417,
      param3 = 80,
      rollover = "[[PlantFarm mode4_rollover][Pineapples grow best in humid areas][WorkModeWrapper rollover]]"
    },
    {
      id = "Coffee",
      name = "[[28119][Coffee][WorkModeWrapper name]]",
      param1 = 320,
      param2 = 452,
      param3 = 80,
      rollover = "[[28120][Coffee prefers high altitudes and high humidity.][WorkModeWrapper rollover]]"
    },
    {
      id = "Tobacco",
      name = "[[28121][Tobacco][WorkModeWrapper name]]",
      param1 = 340,
      param2 = 371,
      param3 = 80,
      rollover = "[[28122][Tobacco prefers high areas with low humidity][WorkModeWrapper rollover]]"
    },
    {
      id = "Sugar",
      name = "[[28123][Sugar][WorkModeWrapper name]]",
      param1 = 320,
      param2 = 440,
      param3 = 80,
      rollover = "[[28124][Sugar prefers low altitudes and high humidity][WorkModeWrapper rollover]]"
    }
  }
    Plantation["prod_output"] = {
    "Banana",
    "Coffee",
    "Corn",
    "Papaya",
    "Pineapple",
    "Sugar",
    "Tobacco"
  }
	Plantation["prod_output_qty"] = {80,80,80,80,80,80,80}
end


local FiredOnce = false
OnMsg.UASetMode = function(actions,mode)
    if not FiredOnce then
        if(mode == "Boot") then
            FiredOnce = true
            CreateRealTimeThread(function()
                cultivosDePlantacion()
            end)
        end
    end
end