---@meta _

---Gameplay-facing shop operations. Not available during registration.
---@class ProbablyLuaShop
---@field day integer Read only; gameplay only.
---@field black_market_reputation integer Read only; gameplay only.
shop = {}
---Create an item through ItemSpawner and offer it on the front counter.
---False means the game rejected or could not place it; unplaced items are cleaned up.
---@param id string
---@param stolen? boolean
---@return boolean placed
function shop:offer(id, stolen) end
