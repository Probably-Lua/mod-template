---@meta _

---@class LuaCustomerDefinition
---@field id string Read only.
---@field name string
---@field faction string Game faction ID; defaults to FACTION_BLACK_MARKET.
---@field sprite string Native sprite name or random:merc.
---@field dialogue string[] Introductory dialogue lines.
---@field on_trade fun()? Called after the last introductory line.

---Available only inside the `generate_customers` event.
---@class LuaCustomerPool
local Pool = {}
---Add a customer to this event. At most 32 additions per event.
---@param id string Local customer ID.
function Pool:add(id) end
