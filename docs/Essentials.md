# Switchball essentials
These essential template pack contains large gyrocopter, just like the air transport, and checkpoints, which came from Switchball and Switchball HD:

You can place only one player start and goal per level, but placing outside the gyrocopter are not allowed.

It is not possible to start with any location except test mode. Each player start and goal requires airport gates.

## Main essentials

### Start position
Requirements:
- Air transport must be facing **NORTH** in the NetRadiant (with positive Y). See [original documentation](https://github.com/ersohnstyne/neverball-docs/blob/master/Entities.md#info_player_start), how to use design specifications.

The entity decoration in the NetRadiant looks like this:

![template-airtransport-start](img/examples/airtransport-start.jpg)

### End position
Requirements:
- Radius must be set to "0.38".
- Roof protection must installed to prevent leaving outside the gyrocopter after finished the level.
- An ending route line like a file "template-depart.map" must be connected to the intersection.

The entity decoration in the NetRadiant looks like this:

![template-airtransport-end](img/examples/airtransport-end.jpg)

### Optional features
You can also rotate the goal transport instead, but don't use start position, otherwise may not work for it.

## Checkpoints

*This features is only for 1.7 and later.*

If you want to make the longest level or respawn from where you left off, you can install checkpoint rings.

To use the checkpoint, you need an small static platforms or wooden bridge, so the players can reach it.