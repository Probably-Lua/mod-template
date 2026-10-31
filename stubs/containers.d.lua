---@meta _

---Configures a definition's native inventory.
---The settings object is read-only, but its fields can be changed during initialization.
---@class LuaItemContainer
---@field width integer 0 disables a container; otherwise 1..32.
---@field height integer 0 disables a container; otherwise 1..32.
---@field lock_id string Empty means unlocked.
---@field opened_sprite string Optional sprite used after unlocking.
