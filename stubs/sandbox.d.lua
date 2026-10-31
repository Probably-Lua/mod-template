---@meta _

---@param ... any
function print(...) end

---@param value any
---@return string
function tostring(value) end

---@param value any
---@return number?
function tonumber(value) end

---@param value any
---@return string
function type(value) end

---@param value any
---@param message? string
---@return any
function assert(value, message) end

---@param message any
---@param level? integer
function error(message, level) end

---@param index integer|string
---@param ... any
---@return any
function select(index, ...) end

---@param t table
---@return function
function pairs(t) end

---@param t table
---@return function
function ipairs(t) end

---@param t table
---@param index? any
---@return any, any
function next(t, index) end

---@param operation? string
---@param arg? integer
---@return integer
function collectgarbage(operation, arg) end

---@type table
_G = {}

---@type string
_VERSION = ""

---@type table
_MOONSHARP = {}

---Initialize another source file inside this mod's lua/ directory.
---Only regular .lua files are accepted; links and escaping paths are rejected.
---Unavailable after initialization. Load once, then keep returned functions.
---@param path string Relative to lua/.
---@return any
function dofile(path) end
