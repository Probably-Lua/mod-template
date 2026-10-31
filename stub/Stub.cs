// Probably Stolen requires every mod to contain an IMod assembly.
// The mod's actual behavior is implemented in lua/init.lua.
public sealed class StubLuaModDLLStub : IMod
{
    public void Init(ModManifest manifest) { }
    public void OnEnable() { }
    public void OnDisable() { }
}
