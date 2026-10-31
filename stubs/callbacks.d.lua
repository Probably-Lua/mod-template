---@meta _

---Value supported by saved item tags. Passing nil to set_tag removes the tag.
---@alias LuaTagValue string|number|boolean|nil

---Lifecycle callback for a live item instance.
---@alias LuaItemLifecycleCallback fun(item: LuaItemView)

---Callback receiving the item and the inventory it entered or left.
---@alias LuaItemInventoryCallback fun(item: LuaItemView, inventory: LuaInventoryView)
