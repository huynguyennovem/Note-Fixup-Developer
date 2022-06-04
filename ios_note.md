- Cocoapods: package manager for libraries. 
Others similar: 
  - `Carthage`: `Cartfile`
  - `Swift package manager`: `Package.swift`

- `pod init`: create `Pods` folder, `Podfile` + `Podfile.lock` and `.xcworkspace` file in project root dir

- `pod install`: Add a lib to Podfile

  For eg: Add `pod 'CLTypingLabel'`:

  ```
  # Uncomment the next line to define a global platform for your project
  platform :ios, '10.0'

  target 'Flash Chat iOS13' do
    # Comment the next line if you don't want to use dynamic frameworks
    use_frameworks!

    # Pods for Flash Chat iOS13
    pod 'CLTypingLabel'

  end
  ```

  Then execute `pod install` command.
  
- `pod update`: auto pull latest version and upgrade libs that are defined on `Podfile`
