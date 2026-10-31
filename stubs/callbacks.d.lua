---@meta _

---Value supported by saved item tags. Passing nil to set_tag removes the tag.
---@alias LuaTagValue string|number|boolean|nil

---Runtime callbacks execute synchronously and cannot yield.
---There is no global instruction-count or callback-nesting limit; an endless loop can stall the game.

---Lifecycle callback for a live item instance.
---@alias LuaItemLifecycleCallback fun(item: LuaItemView)

---Callback receiving the item and the inventory it entered or left.
---@alias LuaItemInventoryCallback fun(item: LuaItemView, inventory: LuaInventoryView)
