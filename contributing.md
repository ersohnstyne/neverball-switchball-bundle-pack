# Contributing

## Prerequisites

:crown: *Pennyball WGCL is recommended for the best experiences, but requires signed in with the role "Lead Member" or "Mapper".*

Either Pennyball latest version (with checkpoints) or Neverball 1.7.0a with branch [final-buffed](https://github.com/ersohnstyne/neverball/tree/final-buffed) (no checkpoints). Git CLI is the excellent way.

**Make sure your level maps from Switchball Classic or HD is prepared.**

If you don't currently have a Switchball Classic or HD yet, but plan to get one in the future, you can choose to upload your level maps or sets to the backup. Please keep in mind that all of your level maps and replays may not be fully compatible with Neverball.

When you do have your Full Game Switchball, you can download your backup again to use your level sets.

## Compiling levels

:warning: *Compiling levels with official campaign may cause additional cost of structural lumps by your entities.*

To compile maps for levels prior testing, there are two options:

* To compile levels prior to official campaign, that is already installed from Pennyball WGCL, run:
  ```
  mapc.exe .\data\map-sb\yourlevelmap.map .\data --data .\data_campaign --campaign
  ```
* To compile levels with levels sets only, run:
  ```
  mapc.exe .\data\map-sb\yourlevelmap.map .\data
  ```

## Testing levels

:warning: *Some reported incidents from Pennyball, including challenge modes, was sent to the WGCL server, if there's failure attempts or time-outs associated. Standalone mode won't being affected.*

To test the new level, there are two options:

* Place the map folder "map-sb*" only, if there was new SOL file. SOLX only works with latest Pennyball version.
* Simply run with the classic Neverball CLI (works only for Windows 11):
  ```
  neverball.exe .\data\map-sb\yourlevelmap.sol
  ```

## Finish contributed level creations

:warning: *Some level maps may not be fully compatible with Neverball. For more information visit [Pennyball + Neverball Entity design specifications](https://pennyball.stynegame.de/docs/internal/makeandplay/entitiesdesignspecifications).*

1. **Fork the repository**: Click the "Fork" button at the top of the repository page.
2. **Create new branch**:
   ```
   git checkout -b feature/my-new-feature
   ```
3. **Make your changes**: Newer, implement, feature, fix or improvement.
4. **Commit your changes**:
   ```
   git commit -m "Feature request my new feature"
   ```
5. **Push to your fork**:
   ```
   git push origin feature/my-feature-request
   ```
6. **Create pull request**: Go to the original repository to create PR with clear description.

## Support

Need help? We'll get in there!

* Here's how to use the new [entity design specifications](https://pennyball.stynegame.de/docs/internal/makeandplay/entitiesdesignspecifications).
* Join [Discord](https://discord.gg/qnJR263Hm2) and support channel, however, response times may be longer than that.
