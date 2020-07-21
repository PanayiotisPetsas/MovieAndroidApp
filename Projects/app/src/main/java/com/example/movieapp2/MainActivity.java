package com.example.movieapp2;

import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.webkit.WebView;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import android.app.ProgressDialog;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

public class MainActivity extends AppCompatActivity {

    private String TAG = MainActivity.class.getSimpleName();

    private ProgressDialog pDialog;
    private ListView lv;

    // URL to get movies JSON
    private static String url = "https://api.myjson.com/bins/kn2yu";

    ArrayList<HashMap<String, String>> movieList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        movieList = new ArrayList<>();

        lv = (ListView) findViewById(R.id.list);

        new Getmovies().execute();
    }

    /**
     * Async task class to get json by making HTTP call
     */
    private class Getmovies extends AsyncTask<Void, Void, Void> {

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            // Showing progress dialog
            pDialog = new ProgressDialog(MainActivity.this);
            pDialog.setMessage("Please wait...");
            pDialog.setCancelable(false);
            pDialog.show();

        }

        @Override
        protected Void doInBackground(Void... arg0) {
            httpHandler sh = new httpHandler();

            // Making a request to url and getting response
            String jsonStr = sh.makeServiceCall(url);

            Log.e(TAG, "Response from url: " + jsonStr);

            if (jsonStr != null) {
                try {
                    JSONObject jsonObj = new JSONObject(jsonStr);

                    // Getting JSON Array node
                    JSONArray movies = jsonObj.getJSONArray("movies");

                    // looping through All movies
                    for (int i = 0; i < movies.length(); i++) {
                        JSONObject c = movies.getJSONObject(i);

                        String movieID = c.getString("movieID");
                        String movieName = c.getString("movieName");
                        String movieType = c.getString("movieType");
                        String releaseDate = c.getString("Release Date");
                        String rate = c.getString("Rate");
                        String movieDesc = c.getString("movieDesc");
                        //String picture = c.getString("picture");


                        // tmp hash map for single movie
                        HashMap<String, String> movie = new HashMap<>();

                        // adding each child node to HashMap key => value
                        movie.put("movieID", "Movie ID: " + movieID);
                        movie.put("movieName", "Movie Name: " + movieName);
                        movie.put("movieType", "Movie Type: " + movieType);
                        movie.put("Release Date","Release Date: " + releaseDate);
                        movie.put("Rate", "Rating: " +rate);
                        movie.put("movieDesc", "Description: " +movieDesc);


                        // adding movie to movie list
                        movieList.add(movie);
                    }
                } catch (final JSONException e) {
                    Log.e(TAG, "Json parsing error: " + e.getMessage());
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            Toast.makeText(getApplicationContext(),
                                    "Json parsing error: " + e.getMessage(),
                                    Toast.LENGTH_LONG)
                                    .show();
                        }
                    });

                }
            } else {
                Log.e(TAG, "Couldn't get json from server.");
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(getApplicationContext(),
                                "Couldn't get json from server. Check LogCat for possible errors!",
                                Toast.LENGTH_LONG).show();
                    }
                });

            }

            return null;
        }





        @Override
        protected void onPostExecute(Void result) {
            super.onPostExecute(result);
            // Dismiss the progress dialog
            if (pDialog.isShowing())
                pDialog.dismiss();
            /**
             * Updating parsed JSON data into ListView
             * */
            ListAdapter adapter = new SimpleAdapter(
                    MainActivity.this, movieList,
                    R.layout.list_movie, new String[]{"movieID", "movieName", "movieType", "Release Date", "Rate", "movieDesc" },
                    new int[]{(R.id.movieID), R.id.movieName, R.id.movieType, R.id.releaseDate, R.id.rate, R.id.movieDesc});

            lv.setAdapter(adapter);

            onCreate();
        }

        protected void onCreate(){
            //super.onCreate(savedInstanceState);

            lv.setOnItemClickListener(new AdapterView.OnItemClickListener()
            {
                @Override
                public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                    Toast.makeText(MainActivity.this, movieList.get(position).toString(), Toast.LENGTH_LONG).show();

                    Log.d("a",movieList.get(position).toString());
                    /*try { //Trying to split again the smaller JSON file into the parts below. Didn't work so I commented everything.
                        JSONObject jsonMovie = new JSONObject(movieList.get(position).toString());

                        String movieID = jsonMovie.getString("movieID");
                        String movieName = jsonMovie.getString("movieName");
                        String movieType = jsonMovie.getString("movieType");
                        String releaseDate = jsonMovie.getString("Release Date");
                        String rate = jsonMovie.getString("Rate");
                        String movieDesc = jsonMovie.getString("movieDesc:");

                        Toast.makeText(MainActivity.this, movieList.get(position).toString(), Toast.LENGTH_LONG).show();
                        //Instead of Toast.makeText it should instead create a separate view which displays the specific
                        //data of the movie that was clicked on.

                    }catch (final JSONException e) {
                        //Log.e(TAG, "Json parsing error: " + e.getMessage());
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                //Toast.makeText(getApplicationContext(),
                                 //       "Json parsing error: " + e.getMessage(),
                                  //      Toast.LENGTH_LONG).show();
                            }
                        });

                    }*/
                }
            });
        }

    }
}