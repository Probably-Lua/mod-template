---@diagnostic disable: missing-fields
---@meta _

---Bare IDs resolve to the current mod; vanilla IDs require base:.
---Weights are relative (not percentages); positive values must be <= 1e9.
---Initialization edits are staged until commit, but a failing commit is not transactional.
---The game does not serialize these edits into saves; scripts reapply them each session.
---There is no fixed entry-count limit per call or per-mod edit-operation quota.
---@class ProbablyLuaLoot
local Loot = {}
-- Registration and editing ----------------------------------------------------

---Create a new local table (or a group when called through loot.groups).
---@param id string
---@param entries table<string, number> Positive finite weights, up to 1e9.
function Loot.register(id, entries) end
---Insert entries or replace their weights, leaving unmentioned entries intact.
---@param id string
---@param entries table<string, number> Positive finite weights, up to 1e9.
function Loot.update(id, entries) end
---Clear and replace an existing table or group. An empty table clears it.
---@param id string
---@param entries table<string, number>
function Loot.replace(id, entries) end
---Change the weight of an existing entry. Zero disables its chance.
---@param id string
---@param entry_id string
---@param weight number Finite, from 0 through 1e9.
function Loot.set_weight(id, entry_id, weight) end
---@param id string
---@param entry_id string
function Loot.remove(id, entry_id) end
---@param id string
function Loot.clear(id) end
-- Reading and rolling ---------------------------------------------------------

---Read a detached copy after initialization. Use loot_ready for vanilla tables.
---@param id string
---@return table<string, number>
function Loot.entries(id) end
---A group roll returns an item ID, not a table ID. Empty tables return nil.
---@param id string
---@return string?
function Loot.roll(id) end
---@return string[] Qualified IDs of loaded tables/groups.
function Loot.ids() end

-- Main `loot` registry; `loot.groups` exposes the same methods for groups.
---@class ProbablyLuaLootRoot: ProbablyLuaLoot
---@field groups ProbablyLuaLoot Group entries are table IDs, not item IDs.
---@type ProbablyLuaLootRoot
loot = {}
