
package com.catcry.ffmpeg;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;

public class FFmpegJNITools extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Log.i("test", "*********************************");
        TextView tv=new TextView(this);
        tv.setText(test("",1));
        setContentView(tv);
        
    }
    public native String  fenGe();
    public native String  test(String str,int i);

    static {

        System.loadLibrary("ffmpeg");
        System.loadLibrary("ffmpeg-jni");
    }

}
