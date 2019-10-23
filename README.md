A port of the Memoji editor from Xcode 11's iOS Simulator to macOS Catalyst.

![screenshot](screenshot.png)

## What works

- Launching the Memoji editor

## What's broken

- I can't build this into a working app yet; it only runs inside Xcode for now
- Massive lag when clicking on anything, as it tries to save the Memoji to a non-existant XPC service
- For some reason, the Memoji are extremely polygonal - it seems tesselation is broken or turned off?

## What will probably never work

- Face tracking isn't included in the simulator code, so that won't work. (Unless someone wants to reverse engineer and reimplement it?)

## How to try this

- Install Xcode 11.0 on macOS Catalina 10.15
- Install LLVM from [LLVM's releases page](https://releases.llvm.org/download.html#8.0.0)
- Install Python 3
- `cd CopyAvatarFrameworks`
- Create a `llvm_path.conf` file containing the path to your LLVM installation
- `./copy_avatar_frameworks.sh`
- open the project in Xcode
- Click `LaurelmojiCatalyst` -> "Edit Scheme" -> "Arguments" -> "Environment Variables"
- Add:
  - `DYLD_FORCE_FLAT_NAMESPACE` = `1`
  - `SIMULATOR_SHARED_RESOURCES_DIRECTORY` = `/tmp`
- Build and run in Xcode.

## Further information

See my blog for my previous research:

- [porting Memoji](https://worthdoingbadly.com/memoji2/)
- [extracting Metal shaders](https://worthdoingbadly.com/metalbitcode/)

## License

MIT.
