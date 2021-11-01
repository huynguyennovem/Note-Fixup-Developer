### How To Fix Unable To Locate ADB
1. Go to sdk folder. Eg: `/Users/eriknguyen/Library/Android/sdk`. Then delete `platform-tools` dir
3. Open Android Studio > SDK Manager > SDK Tool tab > Check on `Android SDK Platform-Tools` > OK (to install it)
4. Go to `File` from Android Studio menu > Project Structure. From Project Settings > Project, select Project SDK to `Android API XX Platform (XX is version you have, for me it's 30) > OK
5. Then try opening Emulator again.