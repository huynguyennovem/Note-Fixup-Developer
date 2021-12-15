### Mac M1 - build iOS error by Ruby:

Error:
```
...
/Library/Ruby/Gems/2.6.0/gems/ffi-1.13.1/lib/ffi_c.bundle
...
```

1. Duplicate the Terminal application in the Utilities folder.
2. Right click on the app and choose Get Info.
3. Rename the other version of the app as you like.
4. Check the option "open with Rosetta".
5. Install Cocoapods with the command "sudo gem install cocoapods"
6. Type the command line "sudo gem install ffi" to fix the ffi bundle problem. Now you can do a "pod install" without problem.

cd iOS
sudo arch -x86_64 gem install ffi
arch -x86_64 pod install

Note: Try delete podfile.lock if it not work then do again all steps

- Lỗi về multiple google plist json: 
https://stackoverflow.com/a/64984210/5921933
1. Open your iOS workspace in Xcode
2. Tap Runner project in project navigator (left panel with files)
3. Tap Runner in TARGETS list
4. Go to Build Phases tab
5. Expand Copy Bundle Resources
6. Remove GoogleService-Info.plist from Bundle Resources



### Mac M1 - NDK error:

```
org.gradle.process.internal.ExecException: A problem occurred starting process 'command '/Users/eriknguyen/Library/Android/sdk/ndk/21.0.6113669/toolchains/llvm/prebuilt/darwin-x86_64/bin/llvm-strip''
```

-> Go to `android > local.properties`, add/update ndk config:

```
ndk.dir=/Users/eriknguyen/Library/Android/sdk/ndk/20.0.5594570
```

(back to version 20.x.x)

Refer: https://github.com/flutter/flutter/issues/76393#issuecomment-784224162
