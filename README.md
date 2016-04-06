# CherryBlossom [![Build Status](https://travis-ci.org/JPMartha/CherryBlossom.svg?branch=master)](https://travis-ci.org/JPMartha/CherryBlossom)

**CherryBlossom** is _**UNOFFICIAL**_ development utilities for Swift.

- Installing Development Snapshot
- Managing Swift Environments
- Rebuilding The Swift Package Manager
- Testing The Swift Package Manager

<br />

> _**⚠️ PLEASE NOTE!**_
>
> _**NOT official.**_
>
> _**IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.**_

<img src="./Documentation/Images/CherryBlossom.png">
<img src="./Documentation/Images/set-swift-env.png">

## Getting Started

The first step to use **CherryBlossom** is to set the `TOOLCHAIN_VERSION` and the `SWIFTPM_DEVELOPMENT_DIRECTORY` variables in the `Makefile`.

- `TOOLCHAIN_VERSION`

  (e.g. `swift-DEVELOPMENT-SNAPSHOT-2016-03-24-a`)

- `SWIFTPM_DEVELOPMENT_DIRECTORY`

  (e.g. `$(HOME)/swift-package-manager`)

<br />

### Installing Development Snapshot

Download and install Swift from [Swift.org](https://swift.org).

```bash
$ make swift-install
```

For more information, see the [Download Swift](https://swift.org/download/#snapshots).

<br />

### Managing Swift Environments

```bash
$ cd <your-cherryblossom-directory>
$ . set-swift-env
```

For more information, see [https://github.com/apple/swift-package-manager/](https://github.com/apple/swift-package-manager/tree/swift-DEVELOPMENT-SNAPSHOT-2016-03-24-a#managing-swift-environments).

<br />

### Rebuilding The Swift Package Manager

Rebuild the Swift Package Manager itself with the bootstrap script.

```bash
$ make swiftpm-rebuild
```

<br />

> _**⚠️ PLEASE NOTE!**_
>
> _**OVERRIDE the `swift-build` and the `swift-test` in the `SWIFTPM_EXECUTIVE_DIRECTORY` which you set in the `Makefile`.**_

<br />

For more information, see [https://github.com/apple/swift-package-manager/](https://github.com/apple/swift-package-manager/tree/swift-DEVELOPMENT-SNAPSHOT-2016-03-24-a#development).

<br />

### Testing The Swift Package Manager

Test the Swift Package Manager itself with the bootstrap script after rebuilding.

```bash
$ make swiftpm-test
```

An error has occured without building.

```bash
error: unable to find 'swift-build-tool' tool for bootstrap build
```

For more information, see [https://github.com/apple/swift-package-manager/](https://github.com/apple/swift-package-manager/tree/swift-DEVELOPMENT-SNAPSHOT-2016-03-24-a#contributing).

<br />

## Options

If the current directory is not your CherryBlossom directory, set it with `-C` option.

Change to the directory before doing anything.

```bash
$ make swiftpm-rebuild -C <your-cherryblossom-directory>
```

<br />

## License

Licensed under [MIT License](LICENSE).
