package cn.fb.flutter_umeng;

import android.app.Activity;

import com.umeng.analytics.MobclickAgent;
import com.umeng.commonsdk.UMConfigure;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * FlutterUmengPlugin
 */
public class FlutterUmengPlugin implements MethodCallHandler {

    private Activity activity;

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_umeng");
        channel.setMethodCallHandler(new FlutterUmengPlugin(registrar.activity()));
    }

    private FlutterUmengPlugin(Activity activity) {
        this.activity = activity;
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("init")) {
            init(call, result);
        } else if (call.method.equals("beginPageView")) {
            MobclickAgent.onPageStart((String) call.argument("pageName"));
            MobclickAgent.onResume(activity);
            result.success(null);
        } else if (call.method.equals("endPageView")) {
            MobclickAgent.onPageEnd((String) call.argument("pageName"));
            MobclickAgent.onPause(activity);
            result.success(null);
        } else if (call.method.equals("event")) {
            MobclickAgent.onEvent(activity, (String) call.argument("eventId"));
            result.success(null);
        } else {
            result.notImplemented();
        }
    }

    public void init(MethodCall call, Result result) {
        UMConfigure.init(activity, (String) call.argument("key"), null, UMConfigure.DEVICE_TYPE_PHONE, null);
        UMConfigure.setEncryptEnabled(true);
        // 选用LEGACY_AUTO页面采集模式
        MobclickAgent.setPageCollectionMode(MobclickAgent.PageMode.LEGACY_MANUAL);
        result.success(true);
    }
}
