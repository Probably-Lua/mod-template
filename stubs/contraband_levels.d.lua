---@diagnostic disable: missing-fields
---@meta _

---Game-defined contraband severity, stored in CONTRABAND_LEVEL.
---This is separate from the CONTRABAND / RESTRICTED_* item types.
---@alias ContrabandLevelValue
---| 'CONTRABAND_LEVEL_NONE'
---| 'CONTRABAND_LEVEL_LOW'
---| 'CONTRABAND_LEVEL_MID'
---| 'CONTRABAND_LEVEL_HIGH'
---| 'CONTRABAND_LEVEL_CRITICAL'

---@class ProbablyLuaContrabandLevels
---@field None "CONTRABAND_LEVEL_NONE" Not contraband.
---@field Low "CONTRABAND_LEVEL_LOW"
---@field Mid "CONTRABAND_LEVEL_MID"
---@field High "CONTRABAND_LEVEL_HIGH"
---@field Critical "CONTRABAND_LEVEL_CRITICAL"

---@type ProbablyLuaContrabandLevels
ContrabandLevel = {}
