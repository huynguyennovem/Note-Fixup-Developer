### Fix Flutter build with M1, NDK error:

```
org.gradle.process.internal.ExecException: A problem occurred starting process 'command '/Users/eriknguyen/Library/Android/sdk/ndk/21.0.6113669/toolchains/llvm/prebuilt/darwin-x86_64/bin/llvm-strip''
```

-> Go to `android > local.properties`, add/update ndk config:

```
ndk.dir=/Users/eriknguyen/Library/Android/sdk/ndk/20.0.5594570
```

(back to version 20.x.x)

Refer: https://github.com/flutter/flutter/issues/76393#issuecomment-784224162
