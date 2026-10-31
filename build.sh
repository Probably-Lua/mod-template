#!/usr/bin/env bash
set -euo pipefail
root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
game="${1:-${PROBABLY_STOLEN_DIR:-$HOME/.local/share/Steam/steamapps/common/Probably Stolen}}"
managed="${GAME_MANAGED_DIR:-$game/Probably Stolen_Data/Managed}"
if [[ -f "$game/Assembly-CSharp.dll" ]]; then managed="$game"; fi
if ! command -v dotnet >/dev/null 2>&1; then
    echo 'Missing .NET SDK (dotnet).' >&2
    exit 1
fi
if [[ ! -f "$managed/Assembly-CSharp.dll" ]]; then
    echo "Game assembly not found: $managed/Assembly-CSharp.dll" >&2
    echo "Usage: $0 '/path/to/Probably Stolen'" >&2
    exit 1
fi
managed="$(cd -- "$managed" && pwd)"
dotnet build "$root/stub/Stub.csproj" -c Release "-p:GameManagedDir=$managed"
built="$root/stub/bin/Release/netstandard2.1/StubLuaModDLL.dll"
if [[ ! -s "$built" ]]; then
    echo "Built stub DLL not found: $built" >&2
    exit 1
fi
package="$root/dist/ProbablyLuaExample"
# Only this generated staging folder is replaced.
rm -rf -- "$package"
mkdir -p -- "$package"
cp -- "$root/manifest.xml" "$package/manifest.xml"
cp -- "$built" "$package/StubLuaModDLL.dll"
for directory in lua Textures Sounds Localization LootTables; do
    if [[ -d "$root/$directory" ]]; then
        cp -R -- "$root/$directory" "$package/$directory"
    fi
done
printf 'Packaged: %s\n' "$package"
