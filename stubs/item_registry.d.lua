---@meta _

---Runtime access to registered definitions and item instances.
---@class ProbablyLuaItems
items = {}
---Gameplay only. Caller must place or destroy the returned item.
---@param id string Bare IDs are local; vanilla requires base:.
---@param amount? integer Overrides the definition's initial count after on_spawn; 1..1000000.
---@return LuaItemView
function items.spawn(id, amount) end
---@param id string
---@return boolean
function items.exists(id) end
---Snapshot of registered qualified IDs, including native prebuilt spawns.
---@return string[]
function items.ids() end
---@param location ProbablyLuaInventoryLocation
---@return LuaInventoryView
function items.inventory(location) end
