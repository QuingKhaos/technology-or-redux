[![The Foundry](https://img.shields.io/badge/foundrygg-4a1402?style=for-the-badge&logo=vercel&logoColor=white)](https://foundrygg.com/) [![Discord community](https://img.shields.io/badge/Discord-%235865F2.svg?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/SYmkaDjFCt) [![Factorio mod portal](https://img.shields.io/factorio-mod-portal/dt/technology-or-redux?style=for-the-badge&logo=data%3Aimage%2Fx-icon%3Bbase64%2CAAABAAEAEBAAAAEACABoBQAAFgAAACgAAAAQAAAAIAAAAAEACAAAAAAAAAEAAAAAAAAAAAAAAAEAAAAAAAAAAAAALzAtABIVFwBBOSwAISYpAB0iJACTfFQAICQnAEk%2FLAAcICIAsZZlADs4MABsXUIAd2hMAINzVgChi2QAPTozAIt6WwAWGhsAs5prABwgIwC1nG4AKSglAEpGOwBhVDwAGx4hAGJUPABoXkkAMiwiAGleSQCwmW8AtJpsALigdABnXEcAi3ZPAFhNOACDb0sAIicqAEtCLwAxMzEAEhQWAE1EMgAgJSgAISUoAJV%2FWACrkmQAHyMmAIFwUgAbHyEAsJVkAG5gRgAXGxwAHSEkAKCKYwCzmWoAsJhtACIhHAAbHyIAeWtRADo3MACxmnAAtZttACMoKgAaHSAAPzcoABYZGwASFRYAX1ZEAINwTABKRTsAIygrAJqDWABoXUkAHyQmAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADExMTExEyAgEzExMTExADExMRMVCi8EBC8KFTYxMTExMT0OGx5DJSVDHkgRHzExMTEyB0YnRiUlPidGBw0xMTExGi5GJS4JOS4lRkkpMTExHzcrRi4SHEBBLkYrNxUKMTpFRiUURDExRAklRhchLTE%2FKyU%2BCzExMTE7JSUqGSwxAj8qRgEVCgoVEEYqPwIGMSQMSUYlHTw8HSVGSQwiMTExDwclJSVGRiUlPgc1MTExMQMwNBQuJSUuFAU5IzExMTEiOEImFklJFiYCKCQxMTExMUckMRgzMxgxJCIxMTExMTExMTEiCAgiMTExMTExADExMTExMTExMTExMTExAIABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIABAAA%3D&color=orange&labelColor=rgb(111,148,173))](https://mods.factorio.com/mod/technology-or-redux) [![Crowdin translate](https://img.shields.io/badge/Crowdin-Translate-cornflowerblue?style=for-the-badge&logo=crowdin)](https://crowdin.com/project/factorio-mods-localization) [![GitHub release status: Factorio 2.0](https://img.shields.io/github/actions/workflow/status/QuingKhaos/technology-or-redux/qa-release.yml?branch=1.x&label=Factorio%202.0&style=for-the-badge&logo=github)](https://github.com/QuingKhaos/technology-or-redux/actions/workflows/qa-release.yml) [![GitHub release status: Factorio 2.1](https://img.shields.io/github/actions/workflow/status/QuingKhaos/technology-or-redux/qa-release.yml?branch=2.x&label=Factorio%202.1&style=for-the-badge&logo=github)](https://github.com/QuingKhaos/technology-or-redux/actions/workflows/qa-release.yml) [![GitHub issues: bugs](https://img.shields.io/github/issues/QuingKhaos/technology-or-redux/bug?label=Bug%20Reports&style=for-the-badge&logo=github)](https://github.com/QuingKhaos/technology-or-redux/issues?q=is%3Aissue%20state%3Aopen%20label%3Abug) [![GitHub pull requests](https://img.shields.io/github/issues-pr/QuingKhaos/technology-or-redux?label=Pull%20Requests&style=for-the-badge&logo=github)](https://github.com/QuingKhaos/technology-or-redux/pulls)

# Technology: OR (Redux)

Provides logical OR operation in the technology tree for other mods. An OR-node can be used as prerequisite for other technologies, so they become available for research, as soon as one of the prerequisite technologies is researched.

## Usage

Example:

```lua
local technology_or = require("__technology-or-redux__.technology-or")

local tech = technology_or.OR({"automation", "logistics"})
data.raw["technology"]["automobilism"].prerequisites = {tech.name}

data:extend({tech})
```

The `technology_or.OR` function takes a list of technology names and returns a new `TechnologyPrototype` object, which can be used as prerequisite for other technologies. The new technology will be automatically unlocked, as soon as one of the given predecessor technologies is researched.

## Caveats

- I couldn't find any nice OR gate icon, so the OR technology node uses the thumbnail as placeholder icon. If you can create a nice looking OR gate icon, please submit a pull request or contact me on Discord.

## Credits

Re-implementation of the original [Technology Tree: logical OR operator](https://mods.factorio.com/mod/technology_or) mod by [Pithlit](https://mods.factorio.com/user/Pithlit) for Factorio 2.0+. I omitted the `DEPEND_ON` function, as that has nothing to do with the OR operation and may be re-implemented in a separate mod.
