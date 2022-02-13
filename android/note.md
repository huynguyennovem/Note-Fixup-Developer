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

### Hex color

```
100% — FF
95% — F2
90% — E6
85% — D9
80% — CC
75% — BF
70% — B3
65% — A6
60% — 99
55% — 8C
50% — 80
45% — 73
40% — 66
35% — 59
30% — 4D
25% — 40
20% — 33
15% — 26
10% — 1A
5%  — 0D
0% —  00
```

### Navigation component popUpTo with argument


https://stackoverflow.com/questions/56243119/pass-data-back-to-previous-fragment-using-android-navigation

- Fragment A:
```kotlin
val navController = findNavController();
navController.currentBackStackEntry?.savedStateHandle?.getLiveData<SourceScreen>(SOURCE_SCREEN)?.observe(
    viewLifecycleOwner) { result ->
    homeViewModel.sourceScreen.value = Event(result)
}
```

- Fragment B:
    - To send data back to previous fragment:

   ```kotlin
      findNavController().previousBackStackEntry?.savedStateHandle.set(HomeFragment.SOURCE_SCREEN, SourceScreen.Gallery)
      openFragmentByDirection(GalleryFragmentDirections.actionNavigationGalleryToNavigationHome())
   ```
    - To send data back to any other fragments:

   ```kotlin
      findNavController().getBackStackEntry(R.id.navigation_home).savedStateHandle.set(HomeFragment.SOURCE_SCREEN, SourceScreen.Gallery)
      openFragmentByDirection(GalleryFragmentDirections.actionNavigationGalleryToNavigationHome())
   ```
   
- navigation.xml

```xml
<fragment
	android:id="@+id/navigation_home"
	android:name=".HomeFragment"
	android:label="@string/title_home"
	tools:layout="@layout/fragment_home">

	<action
            android:id="@+id/action_navigation_home_to_navigation_gallery"
            app:destination="@id/navigation_gallery" />
			
</fragment>			

<fragment
        android:id="@+id/navigation_gallery"
        android:name=".GalleryFragment"
        android:label="@string/title_save_gallery"
        tools:layout="@layout/fragment_gallery">
     
        <action
            android:id="@+id/action_navigation_gallery_to_navigation_home"
            app:popUpTo="@id/navigation_home" />
</fragment>
```
