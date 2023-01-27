package io.ionic.cs.portals.ecommerce;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        // context.getString outside of Activity
        String apiKey = getString(R.string.portals_api_key);
        Log.v("ERIC", apiKey);
    }
}