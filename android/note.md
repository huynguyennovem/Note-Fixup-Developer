### Show Debug key info on Android:
```
keytool -list -v -alias androiddebugkey -keystore $HOME/.android/debug.keystore
<Pass: android>
```

### ServiceLocator vs DI:

One of the downsides of using a service locator is that it is a shared singleton. In addition to needing to reset the state of the service locator when the test finishes, you cannot run tests in parallel.

This doesn't happen when you use dependency injection, which is one of the reasons to prefer constructor dependency injection when you can use it.

https://developer.android.com/codelabs/advanced-android-kotlin-training-testing-test-doubles#8
https://developer.android.com/training/dependency-injection#di-alternatives
