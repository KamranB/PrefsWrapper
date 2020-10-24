# PrefsWrapper
A wrapper for flutter shared preferences to make process simpler

## How to use
Simply, copy the **`prefs_wrapper.dart`** file in your project. After that you can declare `PrefsWrapper` object like this

`final userName = PrefsWrapper<String>("userName");`

then this object can be used to save user name like this

`userName.save("John Connor")`

and load it like this

`String name = await userName.load();`

I personally prefer to create file **`lib/utils/prefs.dart`** and declare all prefs wrapper there like this

```
PrefsWrapper<String> get email => PrefsWrapper<String>("email");
PrefsWrapper<String> get password => PrefsWrapper<String>("password");
PrefsWrapper<bool> get rememberMe => PrefsWrapper<bool>("remember");
PrefsWrapper<String> get imageUrl => PrefsWrapper<String>("imageUrl");
PrefsWrapper<String> get fullName => PrefsWrapper<String>("fullName");
```