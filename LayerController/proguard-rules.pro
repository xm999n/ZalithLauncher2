-keep public class * extends android.view.View
-keep public class * extends android.app.Activity
-keepclasseswithmembernames class ** {
    native <methods>;
}

# Preserve layer bridge interfaces if accessed via reflection
-keepattributes RuntimeVisibleAnnotations
