---@meta _

---A template registered during mod initialization, not an item in the world.
---Use `items.spawn()` to create a live [LuaItemView](lua://LuaItemView).
---@class LuaItemDefinition
---
--- **Identity and native types**
---@field id string Fully qualified ID, read only.
---@field base_item string? Vanilla template ID, read only.
---@field types string[]|nil Explicit native type additions; reading returns a snapshot. Assignment replaces additions, nil clears additions; template types remain unless removed via remove_type.
---
--- **Display and localization fallbacks**
---@field name string Fallback display name.
---@field sprite string Local sprite key or mod_id:key, without extension.
---@field description string Short description.
---@field long_description string Detailed description.
---@field flavor string Flavor text.
---
--- **Pricing and item mechanics**
---@field value integer Nonnegative value, at most 2^53 - 1.
---@field amount integer Initial count, 1..1000000. Does not enable stacking by itself.
---@field stack_limit integer Optional stack capacity, 1..1000000. Unset preserves a template's stacking rules.
---@field weight integer Optional native weight, 0..1000000.
---@field durability integer Optional maximum/initial native durability, 1..1000000.
---@field contraband_level ContrabandLevelValue
---@field nicotine integer 0..100; 0 disables the behavior; positive values use the game's nicotine consumable helper.
---
--- **Manufacturer, sounds, and container**
---@field manufacturer string|LuaManufacturer|nil Bare IDs are local; vanilla requires base:.
---@field manufacturers (string|LuaManufacturer)[]|nil
---@field sounds LuaItemSounds Read-only settings object; its fields are writable.
---@field sound_preset string SoundPreset.*; individual sound slots override it.
---@field container LuaItemContainer Read-only settings object; its fields are writable.
---
--- **Lifecycle hooks**
---@field on_spawn LuaItemLifecycleCallback? New directory/ItemSpawner/Lua spawns, after native cleanup; never save reconstruction or splitting.
---@field on_loaded LuaItemLifecycleCallback? Called by the game's item-load hook.
---@field on_second LuaItemLifecycleCallback? Native item one-second event.
---@field on_turn LuaItemLifecycleCallback? Native slot turn-end event.
---@field on_cycle LuaItemLifecycleCallback? Native slot cycle-end event.
---@field on_added LuaItemInventoryCallback? Queued until the next update.
---@field on_removed LuaItemInventoryCallback? Queued until the next update; skipped if destroyed.
---@field on_amount_changed LuaItemLifecycleCallback? Queued until the next update.
---@field on_unlocked LuaItemLifecycleCallback? After an actual unlock; not save-load restoration.
local Item = {}

-- Native item types -----------------------------------------------------------

---@param type_name string
function Item:add_type(type_name) end
---@param type_name string
function Item:remove_type(type_name) end
---Checks explicit type additions on this definition, not inherited template types.
---@param type_name string
---@return boolean
function Item:has_type(type_name) end
-- Persistent tags -------------------------------------------------------------

---@param key string
---@param value LuaTagValue
function Item:set_tag(key, value) end
---@param key string
function Item:remove_tag(key) end
-- Context menu actions and drag targets ---------------------------------------

---@param id string ItemAction.* or a declared local action ID.
---@param callback LuaImmediateAction|LuaTargetAction
---@param can_target? LuaCanTarget
function Item:add_action(id, callback, can_target) end
---@param id string
function Item:remove_action(id) end
---Register an independent drag-to-target handler. No menu entry is created.
---A later call replaces the handler; nil removes it. Native placement rules still apply.
---@param callback LuaTargetAction|nil
---@param can_target? LuaCanTarget
function Item:on_drop(callback, can_target) end
