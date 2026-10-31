---@diagnostic disable: missing-fields
---@meta _

---@alias LangCodeValue
---| 'en'
---| 'fr'
---| 'de'
---| 'ru'
---| 'zh'
---| 'ja'
---| 'es'
---| 'ptBR'
---| 'ko'
---| 'it'
---| 'pl'

---@class ProbablyLuaLangCodes
---@field English "en"
---@field French "fr"
---@field German "de"
---@field Russian "ru"
---@field Chinese "zh"
---@field Japanese "ja"
---@field Spanish "es"
---@field Portuguese_Brazil "ptBR"
---@field Korean "ko"
---@field Italian "it"
---@field Polish "pl"

---@type ProbablyLuaLangCodes
LangCode = {}

---@class ProbablyLuaLang
lang = {}

---Merge translations. The latest update wins, including keys from other mods.
---Keys: "type.id.field" or "mod_id:type.id.field".
---Use "action.inspect.name" for item:add_action("inspect", callback) labels.
---@param code LangCodeValue
---@param translations table<string, string>
function lang.update(code, translations) end

---Resolve using: ProbablyLua current language -> game current language ->
---ProbablyLua English -> game English -> explicit fallback/key.
---Mod CSV translations are obtained from the game's already-loaded dictionaries,
---not by reading localization files from Lua.
---@param key string
---@param fallback? string
---@return string
function lang.get(key, fallback) end
