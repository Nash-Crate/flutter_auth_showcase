import com.android.build.gradle.internal.api.BaseVariantOutputImpl
import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.nashcrate.flutter_showcase"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.nashcrate.flutter_showcase"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 24
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            val env = System.getenv()

            when {
                // Production
                env["ANDROID_KEYSTORE_PATH"] != null -> {
                    storeFile = env["ANDROID_KEYSTORE_PATH"]?.let { file(it) }
                    keyAlias = env["ANDROID_KEYSTORE_ALIAS"]
                    keyPassword = env["ANDROID_KEYSTORE_PRIVATE_KEY_PASSWORD"]
                    storePassword = env["ANDROID_KEYSTORE_PASSWORD"]
                }

                // Staging
                env["STG_ANDROID_KEYSTORE_PATH"] != null -> {
                    storeFile =
                        env["STG_ANDROID_KEYSTORE_PATH"]?.let { file(it) }
                    keyAlias = env["STG_ANDROID_KEYSTORE_ALIAS"]
                    keyPassword =
                        env["STG_ANDROID_KEYSTORE_PRIVATE_KEY_PASSWORD"]
                    storePassword = env["STG_ANDROID_KEYSTORE_PASSWORD"]
                }

                // Development
                else -> {
                    keyAlias = keystoreProperties["keyAlias"] as String
                    keyPassword = keystoreProperties["keyPassword"] as String
                    storeFile =
                        keystoreProperties["storeFile"]?.let { file(it) }
                    storePassword =
                        keystoreProperties["storePassword"] as String
                }
            }
        }
    }

//    applicationVariants.all {
//        outputs.all {
//            val appName = "flutter_showcase"
//            val buildTypeName = buildType.name
//            val ext =
//                if ((this as BaseVariantOutputImpl).outputFileName.endsWith(".apk")) {
//                    ".apk"
//                } else {
//                    ".aab"
//                }
//
//            val newName = if (buildTypeName == "debug") {
//                "app-${flavorName}-debug${ext}"
//            } else {
//                "${appName}_${flavorName}_${defaultConfig.versionName}+${defaultConfig.versionCode}${ext}"
//            }
//            this.outputFileName = newName
//        }
//    }

    buildTypes {
        getByName("debug") {
            signingConfig = signingConfigs.getByName("debug")
        }
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true
            proguardFiles += getDefaultProguardFile("proguard-android.txt")
        }
    }
}

flutter {
    source = "../.."
}
