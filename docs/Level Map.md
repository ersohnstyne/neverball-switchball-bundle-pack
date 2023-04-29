# Switchball Level Map
Create new level first before you import templates.

## Level details
If you want to make some levels, ensure that your level details should follows:

Field name              | Notes
------------------------|--------------------------------------------------------------------------------------
Author                  | **Required:** Must specify the username to compile classic campaign levels.
Map description         | Optional: Players needs to show the map details. Level description can be revoked by the classic campaign.
Level music             | **Required:** Prefix names "-SB" must be insert after music name. Sky: track-SB1 / Ice: track-SB2 / Cave: track-SB3 / Cloud: track-SB4 / Lava: track-SB5
BG gradient             | **Required:** Prefix names "-SB" must be insert after gradient name: bgm/track-SB1.ogg = back/sky-SB.png
BG enviroments          | **Required:** Both filename for backgrounds must matched: back/sky-SB.png = map-back/sky-SB.sol
Time limit              | Optional: Level maps does not offer time limits for classic campaign. If this is not possible, place with different set ID prefix rather than "-sb".
Required coins          | Optional: Level maps offers also required coins for classic campaign's career mode.
Best time / Fast unlock | **Required:** At least three fields except optional most coins are required for classic campaign.

## Level versions
To use the map version, set the major value to 1 for the new map.

These version shemes should follows:
* X = Major, Y = Minor

If you want to update the level, you need increase the "Y" value. Using "X" may break your replay.
