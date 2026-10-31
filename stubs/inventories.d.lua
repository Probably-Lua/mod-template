---@meta _

---An opaque native inventory exposed through bounded, explicit operations.
---Views obtained from target filters remain read only, including their child items.
---Built-in inventory locations accepted by `items.inventory()`.
---@alias ProbablyLuaInventoryLocation
---| 'inventory'
---| 'front_counter'
---| 'back_counter'
---| 'display'
---| 'trash'
---| 'afterhours' 

---@class LuaInventoryView
local Inventory = {}

-- Query -----------------------------------------------------------------------

---@param recursive? boolean Default false; nested content inventories only.
---@return LuaItemView[] Detached array of live item views.
function Inventory:items(recursive) end

---Counts units, including stack quantities. Use #inventory:items() for item instances.
---@param id? string Optional qualified/local item ID filter.
---@param recursive? boolean Default false.
---@return integer
function Inventory:count(id, recursive) end

-- Mutation --------------------------------------------------------------------

---Whether at least one unit fits according to current native rules.
---@param item LuaItemView
---@return boolean
function Inventory:can_accept(item) end

---Move existing units. Refused/partial insertion preserves the caller's remainder.
---@param item LuaItemView
---@param amount? integer All units if omitted.
---@return integer moved
function Inventory:insert(item, amount) end

---Spawn and insert. Omitted amount uses the definition's count; unplaced remainder is discarded.
---@param id string
---@param amount? integer 1..1000000.
---@return integer inserted
function Inventory:add(id, amount) end
