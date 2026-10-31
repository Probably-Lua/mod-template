---@diagnostic disable: missing-fields
---@meta _

---Built-in context action IDs.
---@class ProbablyLuaItemActions
---@field Open "base:open"
---@field Use "base:use"
---@field Equip "base:equip"
---@field Activate "base:activate"
---@field Toggle "base:toggle"
---@field Unload "base:unload"
---@field Pin "base:pin"
---@type ProbablyLuaItemActions
ItemAction = {}

---How a custom action is invoked.
---@class ProbablyLuaActionTypes
---@field Immediate "immediate"
---@field Target "target"
---@field Equip "equip"
---@type ProbablyLuaActionTypes
ActionType = {}

---@alias ProbablyLuaActionKindValue
---| 'immediate'
---| 'target'
---| 'equip' 

---Called immediately when an action is selected.
---@alias LuaImmediateAction fun(source: LuaItemView)
---Called after a target item is selected.
---@alias LuaTargetAction fun(source: LuaItemView, target: LuaItemView)
---Filters must return a boolean. Item/inventory mutations, action binding edits and loot edits are blocked during filtering.
---Note: changing captured definition/customer/manufacturer settings is not yet fully guarded by the C# implementation.
---@alias LuaCanTarget fun(source: LuaItemView, target: LuaItemView): boolean
