# Switchball essentials
These essential pack contains large gyrocopter, just like the air transport, and checkpoints, that will respawn the new one.
You can place only one ball and goal per level, but placing outside the gyrocopter are not allowed.

If you want to start with any location, you need to place over the normal intersection.

## Main essentials

### Start position
Requirements:
- Air transport must be facing **NORTH** (with positive Y). See [original documentation](https://github.com/ersohnstyne/neverball-docs/blob/master/Entities.md#info_player_start), how to use design specifications.

The model pattern looks like this:
![template-airtransport-start](img/examples/airtransport-start.jpg)

### End position
Requirements:
- Radius must be set to "0.38".
- Roof protection must installed to prevent topple over after finished the level.
- An ending route line like a file "template-depart.map" must be connected to the intersection.

The model pattern looks like this:
![template-airtransport-end](img/examples/airtransport-end.jpg)

### Optional features
You can also rotate the goal transport instead, but don't use start position, otherwise may not work for it.

## Checkpoints

*This features is available only for 1.7 and later.*

If you want to make the longest level or respawn from where you left off, you can install checkpoint rings.

To use the checkpoint, you need an small static platforms or wooden bridge, so the players can reach it.
