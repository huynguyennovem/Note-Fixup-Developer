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

### RenderFlex children have non-zero flex but incoming height constraints are unbounded.

-> Wrap your `Column` inside an `Expanded`, `Flexible` or `SizedBox`:

```
Expanded(
  child: Column()
)
```

### Debug native Android and iOS code inside Flutter project
- iOS:
1. Open ios project inside Flutter project (Remember to choose `Runner.xcworkspace` instead of `Runner.xcodeproj`)
2. From project folder navigation on the left:
> Go to Pods > Development Pods > (select one of native plugin project you want to debug, for eg: flutter_downloader) > Keep go inside ... until see source code class which end with `.m` > Open file
3. Set breakpoint anywhere you want to debug
4. Run app

### Fix flutter intl
```
Target of URI doesn't exist: 'package:flutter_gen/gen_l10n/app_localizations.dart'.
```

Go to `Dart Analysis` > `Restart Dart Analysis Server` (Reload red icon)

![Screen Shot 2021-12-28 at 1 18 50 PM](https://user-images.githubusercontent.com/29337364/147534796-12b141f1-9e75-40d3-baae-765262163d2c.png)

### Fix lỗi nhiều file Info.plist
- Bối cảnh: Xcode 13 dùng Info plist ở Targets > Runner > Info tab > Custom iOS target Properties chứ ko load ở Info.plist
Hoặc cách fix của [1] tạo ra 3 file Info plist thừa. 
-> Khiến cho mọi config trong file Info.plist chính không tác dụng

- Cách làm:
  - Xóa 3 file thừa Info (debug, profile, release)
  - Mở Xcode, chuột phải runner > Add Files to Runner > Sau đó chọn Info.plist duy nhất > Add
  - Từ navigation trái, chọn Targets > Runner > Build Settings > Search "info.plist" để filter 
  > Ở Packaging (Info.plist File), double click vào dòng đó và edit thành Runner/Info.plist
  - Sang tab Build Phases > Copy Bundle Resources > Nếu có Info.plist thì xóa
  - Sang tab Info, check lại config khớp với file Info.plist không, nếu có thì OK


Tham khảo thêm: 
1. https://stackoverflow.com/questions/56844012/xcode-backend-sh-no-such-file-or-directory-do-i-need-to-create-this-file
2. https://stackoverflow.com/questions/67896404/where-is-info-plist-in-xcode-13-missing-not-inside-project-navigator

### This widget has been unmounted, so the State no longer has a context (and should be considered defunct). 
- Usecase: After dimissed a Dialog, we use something that need a context (For eg: `AppLocalizations.of(context)`)
- Cause: When the Dialog showing, the current Widget is disposed, then it's unmounted due to loss context.
- How to fix:

Use bloc state management: 

```
//On Dialog
clickOKAction: () => blocCubit.emitOKActionState()
...

//On the bloc file
fun emitOKActionState(){
   emit(OKActionState());
}

//On Widget
listener: (context, state) async {
   if(state is OKActionState) {
        // HANDLE YOUR ACTION HERE
   }
}
```

### Bloc listener is not invoked even emitted new state
Make sure the widget is built. Delay some secs may help but not perfect.
Try this:

```
@override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await joiningCubit.checkServerDifference(widget.requestedToken, widget.incomingHost);
    });
  }
```

### IntrinsicHeight

- Same as `wrap_content` in Android
- Set child's IntrinsicHeight to wrap_content by itself children height. For eg: http://woolha.com/tutorials/flutter-using-instrinsicheight-widget-examples


### Deploy Flutter web app to Firebase hosting

- cd <project_root_dir>
- firebase init hosting

```
? What do you want to use as your public directory? build/web
? Configure as a single-page app (rewrite all urls to /index.html)? Yes
? Set up automatic builds and deploys with GitHub? No
? File build/web/index.html already exists. Overwrite? Yes
✔  Wrote build/web/index.html

```

- firebase deploy --only hosting

