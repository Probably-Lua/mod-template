---@meta _

---Events emitted by the Lua host.
---@alias ProbablyLuaEvent
---| 'game_loaded'
---| 'new_game_started'
---| 'generate_customers'
---| 'customer_trade'
---| 'loot_ready' 
---Callbacks run synchronously and cannot yield.
---@param event ProbablyLuaEvent
---@param callback function
---@overload fun(event: "game_loaded", callback: fun())
---@overload fun(event: "new_game_started", callback: fun(scenario_id: string))
---@overload fun(event: "generate_customers", callback: fun(pool: LuaCustomerPool))
---@overload fun(event: "customer_trade", callback: fun(customer_id: string))
---@overload fun(event: "loot_ready", callback: fun())
function on_event(event, callback) end
