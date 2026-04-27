# ── Suppress warnings ────────────────────────────────────────
-dontwarn org.slf4j.impl.StaticLoggerBinder
-dontwarn com.github.luben.zstd.**
-dontwarn java.lang.management.**
-dontwarn io.ktor.util.debug.**
-dontwarn okhttp3.internal.platform.**
-dontwarn org.conscrypt.**
-dontwarn org.bouncycastle.**
-dontwarn org.openjsse.**
-dontwarn javax.annotation.**

# ── Debug info ───────────────────────────────────────────────
# 保留行号信息，crash stack trace 可读
-keepattributes SourceFile,LineNumberTable
-renamesourcefileattribute SourceFile

# ── Room ─────────────────────────────────────────────────────
-keep @androidx.room.Database class * { *; }
-keep @androidx.room.Entity class * { *; }
-keep @androidx.room.Dao class * { *; }
-keepclassmembers class * {
    @androidx.room.* <fields>;
    @androidx.room.* <methods>;
}

# ── Kotlin Coroutines ─────────────────────────────────────────
-keepnames class kotlinx.coroutines.internal.MainDispatcherFactory {}
-keepnames class kotlinx.coroutines.CoroutineExceptionHandler {}
-keepclassmembers class kotlinx.coroutines.** {
    volatile <fields>;
}
-keepclassmembers class kotlin.coroutines.SafeContinuation {
    volatile <fields>;
}

# ── kotlinx.serialization (Ktor JSON) ────────────────────────
-keepclasseswithmembers class kotlinx.serialization.** {
    kotlinx.serialization.KSerializer serializer(...);
}
-keep,includedescriptorclasses class **$$serializer { *; }
-keepclassmembers @kotlinx.serialization.Serializable class ** {
    *** Companion;
    *** INSTANCE;
    kotlinx.serialization.KSerializer serializer(...);
}

# ── Gson ──────────────────────────────────────────────────────
-keepattributes Signature,EnclosingMethod
-keepclassmembers,allowobfuscation class * {
    @com.google.gson.annotations.SerializedName <fields>;
}
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

# ── OkHttp + Okio ─────────────────────────────────────────────
-keeppackagenames okhttp3.internal.publicsuffix.*
-adaptresourcefilenames okhttp3/internal/publicsuffix/PublicSuffixDatabase.gz
-dontwarn okio.**

# ── MMKV ──────────────────────────────────────────────────────
-keep class com.tencent.mmkv.MMKV { *; }
-keepclasseswithmembernames class com.tencent.mmkv.** {
    native <methods>;
}

# ── ByteHook (bhook) ──────────────────────────────────────────
-keepclasseswithmembernames class com.bytedance.shadowhook.** {
    native <methods>;
}

# ── Fishnet (crash handler) ───────────────────────────────────
-keepclasseswithmembernames class io.github.kyant0.fishnet.** {
    native <methods>;
}

# ── StringFog ─────────────────────────────────────────────────
-keep class com.github.megatronking.stringfog.** { *; }

# ── Apache Commons Compress ───────────────────────────────────
-keep class org.apache.commons.compress.** { *; }
-dontwarn org.apache.commons.**

# ── Maven Artifact (version parsing) ─────────────────────────
-keep class org.apache.maven.artifact.versioning.** { *; }

# ── Querz NBT ─────────────────────────────────────────────────
-keep class net.querz.nbt.** { *; }

# ── Process Phoenix ───────────────────────────────────────────
-keep class com.jakewharton.processphoenix.** { *; }
