# Promise Sandbox

**Promise Sandbox** is an application made for iOS to which presents basic PromiseKit functionalities in Playgrounds. PromiseKit is extracted to Playgrounds threw **ApplicationFramework** (It's a Cocoa touch Framework based on normal application which allows to import all of the classes from the project including PromiseKit framework in playground)

## Tools & Requirements

* Tools:
        * Xcode 9.4 with latest iOS SDK (11.4)
        * [CocoaPods](https://github.com/CocoaPods/CocoaPods) 1.5.3 or higher

### Configuration

1. Clone repository:

```bash
# over https:
git clone https://github.com/warchal95/PromiseSandbox.git
# or over SSH:
git clone git@github.com:warchal95/PromiseSandbox.git
```

2. Install pods

```bash
pod install
```
3. Open `Promises.xcworkspace` file and build the project.

4. Open `PromisePlayground.playground` file, show the Assistant Editor and see the results
