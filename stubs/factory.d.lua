---@meta _

---Register definitions during mod initialization.
---Use local IDs unless a function explicitly supports a qualified `mod_id:id`.
---@class ProbablyLuaFactory
factory = {}
---@param id string Local item ID.
---@param base_item? string A vanilla template, e.g. base:screwdriver.
---@return LuaItemDefinition
function factory.item(id, base_item) end
---Bare manufacturer IDs belong to this mod.
---Use `base:pastel` to override a vanilla manufacturer; `pastel` creates a local one.
---@param id string
---@return LuaManufacturer
function factory.manufacturer(id) end
---Declare the kind of a custom action before attaching it to an item.
---@param id string Local action ID; vanilla actions already have predefined kinds.
---@param kind ProbablyLuaActionKindValue
function factory.action(id, kind) end
---@param id string
---@return LuaCustomerDefinition
function factory.customer(id) end
