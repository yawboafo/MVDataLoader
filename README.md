#  MVDataLoader
A simple Network Layer for requesting  multiple distinct resources in parallel;

## Installation
- - - -
## CocoaPods
 [CocoaPods](http://cocoapods.org/) is a dependency manager for Cocoa projects. You can install it with the following command:

```shell
$ gem install cocoapods
```

To integrate MVDataLoader into your Xcode project using CocoaPods, specify it to a target in your  `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target 'MyApp' do
  # your other pod
  # ...
  pod 'MVDataLoader', '~> 1.4'
end

```

Then, run the following command:
```shell
$ pod install

```

You should open the `{Project}.xcworkspace` instead of the `{Project}.xcodeproj` after you installed anything from CocoaPods.
For more information about how to use CocoaPods, I suggest [this tutorial](http://www.raywenderlich.com/64546/introduction-to-cocoapods-2) .

## Manually
It is not recommended to install the framework manually, but if you prefer not to use either of the aforementioned dependency managers, you can integrate MVDataLoader into your project manually. A regular way to use MVDataLoader in your project would be using the Embedded Framework.

* Add MVDataLoader as a [submodule](http://git-scm.com/docs/git-submodule) . In your favourite terminal,`cd` into your top-level project directory, and entering the following command:

```shell
$ git submodule add https://github.com/yawboafo/MVDataLoader.git
```

* Open the `MVDataLoader` folder, and drag `MVDataLoader.xcodeproj` into the file navigator of your app project, under your app project.
* In Xcode, navigate to the target configuration window by clicking on the blue project icon, and selecting the application target under the “Targets” heading in the sidebar.
* In the tab bar at the top of that window, open the “Build Phases” panel.
* Expand the “Target Dependencies” group, and add `MVDataLoader.framework`.
* Click on the+button at the top left of “Build Phases” panel and select “New Copy Files Phase”. Rename this new phase to “Copy Frameworks”, set the “Destination” to “Frameworks”, and add `MVDataLoader.framework` of the platform you need.


## Next
- - - -
After installation, you could import MVDataLoader to your project by adding this:

```swift
import MVDataLoader
```


## Cheat Sheet
- - - -
**Configurable Cache  Maximum Capacity**

```swift
MVUrlCache.shared.configureMaxmemoryLimit(maxMemoryLimit: 9000)
```


**Setting image with a URL**
```swift
 
let placeHolder = UIImageView(named: "default")
 yourImageView.setImage(stringURL: "www.photos.com", placeHolder: placeHolder)

//Or

 yourImageView.setImage(stringURL: "www.photos.com")
    
```

**Get and control Data return  type to either image , Json , xml etc**

```swift

private let dataLoader = MVOperationManager()

 dataLoader.loadData(url: stringURL) { (data) in
           //Data is here 
           //Do error checks and get final data from `MVDataResponse()`
          print(data.data)
        
         
   }
```

**Date Response Type**
Data returned from this Operation is   a struct which contains an `error: AnyObject`, `data: Data`,`response: AnyObject`

```swift
let data = MVDataResponse(error, data , urlresponse )
```

