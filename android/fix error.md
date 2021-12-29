### How To Fix Unable To Locate ADB
1. Go to sdk folder. Eg: `/Users/eriknguyen/Library/Android/sdk`. Then delete `platform-tools` dir
3. Open Android Studio > SDK Manager > SDK Tool tab > Check on `Android SDK Platform-Tools` > OK (to install it)
4. Go to `File` from Android Studio menu > Project Structure. From Project Settings > Project, select Project SDK to `Android API XX Platform (XX is version you have, for me it's 30) > OK
5. Then try opening Emulator again.


### Mac M1 - java.lang.Exception: No native library is found for os.name=Mac and os.arch=aarch64. path=/org/sqlite/native/Mac/aarch64

```
Caused by: java.lang.ExceptionInInitializerError
	at androidx.room.processor.DatabaseProcessor.doProcess(DatabaseProcessor.kt:72)
	at androidx.room.processor.DatabaseProcessor.process(DatabaseProcessor.kt:51)
	at androidx.room.DatabaseProcessingStep.process(DatabaseProcessingStep.kt:47)
	at androidx.room.compiler.processing.JavacProcessingStepDelegate.process(XProcessingStep.kt:111)
	at com.google.auto.common.BasicAnnotationProcessor.process(BasicAnnotationProcessor.java:330)
	at com.google.auto.common.BasicAnnotationProcessor.process(BasicAnnotationProcessor.java:181)
	at org.jetbrains.kotlin.kapt3.base.incremental.IncrementalProcessor.process(incrementalProcessors.kt:90)
	at org.jetbrains.kotlin.kapt3.base.ProcessorWrapper.process(annotationProcessing.kt:188)
	at jdk.compiler/com.sun.tools.javac.processing.JavacProcessingEnvironment.callProcessor(JavacProcessingEnvironment.java:980)
	... 41 more
Caused by: java.lang.Exception: No native library is found for os.name=Mac and os.arch=aarch64. path=/org/sqlite/native/Mac/aarch64
	at org.sqlite.SQLiteJDBCLoader.loadSQLiteNativeLibrary(SQLiteJDBCLoader.java:333)
	at org.sqlite.SQLiteJDBCLoader.initialize(SQLiteJDBCLoader.java:64)
	at androidx.room.verifier.DatabaseVerifier.<clinit>(DatabaseVerifier.kt:71)
	... 50 more
```

> SOLUTION: Use Room Version: 2.4.0-alpha03 or later.

