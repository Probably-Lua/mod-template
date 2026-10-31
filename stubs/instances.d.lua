---@meta _

---A live item in the world (not an [item definition](lua://LuaItemDefinition)).
---Properties are read-only; changes must use the methods below.
---A destroyed item only supports checking .destroyed and .id.
---@class LuaItemView
---
--- **Identity and state**
---@field id string Qualified ID, including base: for vanilla items.
---@field unique_id integer Native instance ID, distinct from the definition ID.
---@field destroyed boolean
---@field owned boolean
---@field stolen boolean
---@field locked boolean
---
--- **Display**
---@field name string
---@field description string
---@field long_description string
---@field flavor string
---
--- **Quantity and properties**
---@field amount integer
---@field value integer
---@field weight integer
---@field durability integer
---@field max_durability integer
---
--- **Contents**
---@field has_container boolean
local Item = {}

-- Inspection: types and tags --------------------------------------------------

---@param type_name string
---@return boolean
function Item:has_type(type_name) end
---@param key string
---@return boolean
function Item:has_tag(key) end
---@param key string
---@return string
function Item:tag_string(key) end
---@param key string
---@return number
function Item:tag_number(key) end
---@param key string
---@return integer
function Item:tag_int(key) end
---@param key string
---@return boolean
function Item:tag_bool(key) end
-- Editing saved tags and native types ----------------------------------------

---@param key string
---@param value LuaTagValue
function Item:set_tag(key, value) end
---@param key string
function Item:remove_tag(key) end
---@param type_name string
function Item:add_type(type_name) end
---@param type_name string
function Item:remove_type(type_name) end
-- Presentation and item state -------------------------------------------------

---@param value string
function Item:set_name(value) end
---@param text string
function Item:set_description(text) end
---@param text string
function Item:set_long_description(text) end
---@param text string
function Item:set_flavor(text) end
---@param value boolean
function Item:set_owned(value) end
---@param value boolean
function Item:set_stolen(value) end
---@param value integer
function Item:set_weight(value) end
---Requires native durability support on this item.
---@param value integer 0..max_durability.
function Item:set_durability(value) end
---@param key string
function Item:set_sprite(key) end
---@param value integer
function Item:set_value(value) end
---@param amount integer
function Item:set_amount(amount) end
---@param level ContrabandLevelValue
function Item:set_contraband(level) end
-- Lifecycle -------------------------------------------------------------------

---@return boolean unlocked False if the item is not currently locked.
function Item:unlock() end
function Item:destroy() end
-- Inventory contents and sounds -----------------------------------------------

---Spawn one item using its definition's default amount. Unplaced remainder is discarded.
---True means the whole amount was inserted. False can mean partial insertion of a stack.
---Locked containers may be filled only within their on_spawn/on_loaded callback.
---@param id string
---@return boolean placed
function Item:add_content(id) end
---@param id string Local sound key or base:<sound>.
---@return boolean played
function Item:play_sound(id) end
-- Read-only snapshots and inventory navigation --------------------------------

---@return string[] Snapshot of native item types.
function Item:types() end
---@return string[] Snapshot of enabled saved tag keys.
function Item:tag_keys() end
---@return LuaInventoryView? Own content inventory; nil without a container.
function Item:container() end
---@return LuaInventoryView? Current parent inventory; nil if unplaced.
function Item:inventory() end
---@return LuaItemView? Nearest containing item; nil for a top-level store inventory.
function Item:parent() end
---@param recursive? boolean Default false; content inventories only.
---@return LuaItemView[] Snapshot; empty without a container.
function Item:contents(recursive) end
-- Moving, splitting, and consuming --------------------------------------------

---@param destination LuaInventoryView
---@param amount? integer All units if omitted.
---@return integer moved Number of units actually moved; remainder is preserved.
function Item:move_to(destination, amount) end
---Creates an unplaced stack without on_spawn, preserving independent tags/text/value.
---Caller must place or destroy it. Containers and examination windows cannot split.
---@param amount integer 1..self.amount-1.
---@return LuaItemView
function Item:split(amount) end
---@param amount? integer Default 1.
---@return boolean
function Item:can_consume(amount) end
---Consumes only the requested units. Destroys the item when its last unit is consumed.
---@param amount? integer Default 1.
---@return boolean consumed False if quantity or native removal rules do not allow it.
function Item:consume(amount) end
