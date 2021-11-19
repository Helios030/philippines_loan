package com.ben.app_info


import android.text.TextUtils
import androidx.annotation.NonNull
import android.content.Context
import android.database.Cursor
import android.provider.ContactsContract
import android.provider.MediaStore
import android.content.pm.PackageManager
import android.content.pm.PackageInfo
import android.content.pm.ApplicationInfo
import java.text.SimpleDateFormat


import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.os.BatteryManager
import android.os.Build
import android.os.Environment
import android.os.StatFs
/** AppInfoPlugin */
class AppInfoPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context :Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    context=flutterPluginBinding.applicationContext
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "app_info")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getAPPs") {
      result.success(getAppList(context))
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  fun getAppList(context: Context): List<HashMap<String,String>>? {
    val appLists: MutableList<HashMap<String,String>> = ArrayList<HashMap<String,String>>()
    var map: HashMap<String,String>
    val pm = context.packageManager
    val list = pm.getInstalledPackages(PackageManager.GET_UNINSTALLED_PACKAGES)
    for (packageInfo in list) {
      val appName =  packageInfo.applicationInfo.loadLabel(context.packageManager).toString()
      val packageName = packageInfo.packageName
      val isSYS: Boolean =
        isSystemApp(packageInfo)
      if (!TextUtils.isEmpty(appName) && !TextUtils.isEmpty(packageName)) {
        map = HashMap<String,String>()
        map["firstTime"]=formatTime(packageInfo.firstInstallTime, "yyyy-MM-dd HH:mm:ss").toString()
        map["lastTime"]=   formatTime(
          packageInfo.lastUpdateTime,
          "yyyy-MM-dd HH:mm:ss"
        ).toString()
        map["name"]=appName
        map["packageName"]=packageName
        map["versionCode"]=packageInfo.versionName
        map["systemApp"]=if (isSYS) "1" else "2"
        appLists.add(map)
      }
    }

    return appLists
  }

  fun isSystemApp(pInfo: PackageInfo): Boolean {
    //判断是否是系统软件
    return pInfo.applicationInfo.flags and ApplicationInfo.FLAG_SYSTEM != 0
  }

  fun formatTime(date: Long, format: String?): String? {
    val formatter = SimpleDateFormat(format)
    return formatter.format(date).toString()
  }

}
