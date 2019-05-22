package com.example.ungdungnghenhacmp3;

import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Handler;
import android.os.Message;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.ContextMenu;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;

import com.example.ungdungnghenhacmp3.Adapter.ListSongAdapter;
import com.example.ungdungnghenhacmp3.Adapter.ListSongOnlineAdapter;
import com.example.ungdungnghenhacmp3.Interface.AsyncResponse;
import com.example.ungdungnghenhacmp3.Model.OnlineSong;
import com.example.ungdungnghenhacmp3.Model.Song;
import com.example.ungdungnghenhacmp3.SQLite.SQLiteModel;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;


public class OnlineActivity extends AppCompatActivity {

    ListView listView;
    TextView txtPlayingTime, txtDurationTime, txtSongName, txtTitle;
    SeekBar seekBar;
    ImageButton btnPrevious, btnNext, btnPlay;
    ProgressDialog progressDialog;
    ProgressBar progressBar;
    List<OnlineSong> listSong;
    int index = 0;
    static MediaPlayer mediaPlayer = null;
    String AllSongUrl = "http://172.16.107.216:3000";
    ListSongOnlineAdapter adapter;
    static final int MENU_ITEM_DOWNLOAD = 111;
    Context context = this;
    static final int progress_bar_type = 0;
    ProgressDialog pDialog;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_online);

        AnhXa();



        listSong = new ArrayList<>();


        adapter = new ListSongOnlineAdapter(this, R.layout.item_in_list_song, listSong);
        listView.setAdapter(adapter);

        //mediaPlayer = new MediaPlayer();

        progressBar.setVisibility(View.GONE);
        //progressBar.setVisibility(View.VISIBLE);
        //listView.setVisibility(View.VISIBLE);
        new GetSongs().execute(AllSongUrl);


    }


    //Đợi load danh sách bài hát
    @Override
    protected Dialog onCreateDialog(int id) {
        switch (id) {
            case progress_bar_type: // we set this to 0
                pDialog = new ProgressDialog(this);
                pDialog.setMessage("Đang tải bài hát. Vui lòng đợi...");
                pDialog.setIndeterminate(false);
                pDialog.setMax(100);
                pDialog.setProgressStyle(ProgressDialog.STYLE_HORIZONTAL);
                pDialog.setCancelable(true);
                pDialog.show();
                return pDialog;
            default:
                return null;
        }

    }

    //nút back trở về offline
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if(item.getItemId() == android.R.id.home){
            onBackPressed();
        }

        return super.onOptionsItemSelected(item);

    }

    //nút back
    @Override
    public void onBackPressed() {

            if (mediaPlayer != null && mediaPlayer.isPlaying()) {
                mediaPlayer.stop();

            }
            mediaPlayer = null;

    }

    //cập nhật seekbar theo time play của bài hát
    private void UpdatePlayingTime() {
        //
        final Handler handler = new Handler();
        //mỗi 100ms tạo ra một thread update time play của bài hát
        handler.postDelayed(new Runnable() {
            @Override
            public void run() {
                if (mediaPlayer != null) {
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("mm:ss");
                    txtPlayingTime.setText(simpleDateFormat.format(mediaPlayer.getCurrentPosition()));
                    seekBar.setProgress(mediaPlayer.getCurrentPosition());

                    handler.postDelayed(this, 100);

                }
            }
        }, 100);


    }

    private void AnhXa() {
        listView = findViewById(R.id.listSongOnline);
        txtPlayingTime = findViewById(R.id.txtPlayingTimeOnline);
        txtDurationTime = findViewById(R.id.txtDurationTimeOnline);
        txtSongName = findViewById(R.id.txtSongNameOnline);
        seekBar = findViewById(R.id.seekBarOnline);
        btnPrevious = findViewById(R.id.btnPreviousOnline);
        btnNext = findViewById(R.id.btnNextOnline);
        btnPlay = findViewById(R.id.btnPlayOnline);
        txtTitle = findViewById(R.id.textViewOnline);
        progressBar = findViewById(R.id.progressBarOnline);
    }

    //chuẩn bị sourcce cho mediaplayer
    public void initMeadiaPlayer() {

        if (mediaPlayer != null && mediaPlayer.isPlaying())
            mediaPlayer.stop();
        try {

            //khởi tạo mediaplayer với source api
            mediaPlayer = MediaPlayer.create(this, Uri.parse(listSong.get(index).getFile()));

            mediaPlayer.setAudioStreamType(AudioManager.STREAM_MUSIC);

            mediaPlayer.setOnPreparedListener(new MediaPlayer.OnPreparedListener() {
                @Override
                public void onPrepared(MediaPlayer mp) {

                    mediaPlayer.start();

                    progressBar.setVisibility(View.GONE);
                    txtSongName.setText(listSong.get(index).getSongName());
                    btnPlay.setImageResource(R.drawable.pause);
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
        SetTimeDuration();

        //tự động play bài tiếp theo
        mediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
            @Override
            public void onCompletion(MediaPlayer mp) {

                index++;
                if (index > listSong.size() - 1) {
                    index = 0;
                }
                initMeadiaPlayer();

                UpdatePlayingTime();
                btnPlay.setImageResource(R.drawable.pause);
            }
        });
    }

    //set thời lượng bài hát
    public void SetTimeDuration() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("mm:ss");
        txtDurationTime.setText(simpleDateFormat.format(mediaPlayer.getDuration()));

        //set seekbar theo duration (ms)
        seekBar.setMax(mediaPlayer.getDuration());
    }

    //dùng convert json đọc được từ reader thành chuỗi string
    public static String readAll(Reader rd) throws IOException {
        StringBuilder sb = new StringBuilder();
        int cp;
        while ((cp = rd.read()) != -1) {
            sb.append((char) cp);
        }
        return sb.toString();
    }

    //load tất cả bài hát online
    private class GetSongs extends AsyncTask<String, String, Boolean> {

        @Override
        protected void onPreExecute() {
            listView.setVisibility(View.GONE);
            progressDialog = ProgressDialog.show(OnlineActivity.this, "Thông báo", "Đang tải dữ liệu");

            super.onPreExecute();
        }

        @Override
        protected Boolean doInBackground(String... strings) {
            URL url = null;
            String jsonText = null;
            List<OnlineSong> list = null;
            Boolean err = false;
            try {
                url = new URL(strings[0]);
                URLConnection con = url.openConnection();
                //thời gian kết nối và đọc là 10s
                con.setConnectTimeout(1000 * 10);
                con.setReadTimeout(1000 * 10);
                InputStream is = con.getInputStream();
                BufferedReader rd = new BufferedReader
                        (new InputStreamReader(is, Charset.forName("UTF-8")));
                jsonText = readAll(rd);
                JSONArray json = new JSONArray(jsonText);
                for (int i = 0; i < json.length(); i++) {
                    JSONObject object = json.getJSONObject(i);
                    listSong.add(new OnlineSong(
                            object.getInt("ID"),
                            object.getString("SongName"),
                            object.getString("ArtistName"),
                            object.getString("Image"),
                            object.getString("FileName")
                    ));
                }
            } catch (Exception t) {
                err = true;
            }
            return err;
        }


        @Override
        protected void onPostExecute(Boolean erro) {
            super.onPostExecute(erro);
            if (!erro) {
                adapter.notifyDataSetChanged();


                listView.setVisibility(View.VISIBLE);

                //khởi tạo media
                progressDialog.hide();
                progressDialog.dismiss();

                txtSongName.setText(listSong.get(0).getSongName());

                btnPlay.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {

                        if (mediaPlayer == null) {
                            new PrepareAudio().execute("");
                            UpdatePlayingTime();
                        } else if (mediaPlayer.isPlaying()) {
                            mediaPlayer.pause();
                            btnPlay.setImageResource(R.drawable.play);
                        } else {

                            mediaPlayer.start();
                            btnPlay.setImageResource(R.drawable.pause);
                            UpdatePlayingTime();

                        }


                    }
                });

                listView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
                    @Override
                    public boolean onItemLongClick(AdapterView<?> parent, View view, final int position, long id) {


                        AlertDialog alertDialog = new AlertDialog.Builder(OnlineActivity.this).create();
                        alertDialog.setTitle("Thông báo");
                        alertDialog.setMessage("Bạn muốn tải bài hát này?");
                        alertDialog.setButton(AlertDialog.BUTTON_NEUTRAL, "Không",
                                new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialog, int which) {
                                        dialog.dismiss();
                                    }
                                });
                        alertDialog.setButton(AlertDialog.BUTTON_POSITIVE, "Có", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                OnlineSong downloadSong = listSong.get(position);
                                String[] urls = new String[3];
                                urls[0] = downloadSong.getImage();
                                urls[1] = downloadSong.getFile();
                                urls[2] = String.valueOf(position);
                                new DownloadFileFromURL().execute(urls);


                            }
                        });
                        alertDialog.show();



                        return false;
                    }


                });

                listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                    @Override
                    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {


                        index = position;
                        txtPlayingTime.setText("00:00");
                        new PrepareAudio().execute("");

                        UpdatePlayingTime();
                        btnPlay.setImageResource(R.drawable.pause);
                    }
                });

                btnNext.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        index++;
                        if (index > listSong.size() - 1) {
                            index = 0;
                        }
                        //initMeadiaPlayer();
                        new PrepareAudio().execute("");
                        UpdatePlayingTime();
                        btnPlay.setImageResource(R.drawable.pause);
                    }
                });

                btnPrevious.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        index--;
                        if (index < 0) {
                            index = listSong.size() - 1;
                        }
                        //initMeadiaPlayer();
                        new PrepareAudio().execute("");
                        UpdatePlayingTime();
                        btnPlay.setImageResource(R.drawable.pause);
                    }
                });

                seekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
                    @Override
                    public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {

                    }

                    @Override
                    public void onStartTrackingTouch(SeekBar seekBar) {

                    }

                    @Override
                    public void onStopTrackingTouch(SeekBar seekBar) {
                        mediaPlayer.seekTo(seekBar.getProgress());
                    }
                });
            } else {
                progressDialog.hide();
                progressDialog.dismiss();

                AlertDialog alertDialog = new AlertDialog.Builder(OnlineActivity.this).create();
                alertDialog.setTitle("Thông báo");
                alertDialog.setMessage("Kết nối bị gián đoạn. Vui lòng thử lại sau");
                alertDialog.setButton(AlertDialog.BUTTON_NEUTRAL, "OK",
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                                dialog.dismiss();
                            }
                        });
                alertDialog.show();
            }

        }
    }

    //load 1 bài hát đc chọn
    public class PrepareAudio extends AsyncTask<String, String, String> {

        @Override
        protected void onPreExecute() {
            //trước khi load xog bài hát thì ko cho nhấn các nút
            progressBar.setVisibility(View.VISIBLE);
            txtSongName.setText("");
            btnPlay.setClickable(false);
            btnNext.setClickable(false);
            btnPrevious.setClickable(false);
            txtDurationTime.setText("00:00");
            super.onPreExecute();
        }

        @Override
        protected String doInBackground(String... strings) {

            if (mediaPlayer != null && mediaPlayer.isPlaying())
                mediaPlayer.stop();
            try {


                mediaPlayer = MediaPlayer.create(OnlineActivity.this, Uri.parse(listSong.get(index).getFile()));

                mediaPlayer.setAudioStreamType(AudioManager.STREAM_MUSIC);


                mediaPlayer.setOnPreparedListener(new MediaPlayer.OnPreparedListener() {
                    @Override
                    public void onPrepared(MediaPlayer mp) {

                        mediaPlayer.start();

                        btnPlay.setClickable(true);
                        btnNext.setClickable(true);
                        btnPrevious.setClickable(true);
                        SetTimeDuration();

                        progressBar.setVisibility(View.GONE);
                        txtSongName.setText(listSong.get(index).getSongName());
                        btnPlay.setImageResource(R.drawable.pause);
                    }
                });

                mediaPlayer.setOnErrorListener(new MediaPlayer.OnErrorListener() {
                    @Override
                    public boolean onError(MediaPlayer mp, int what, int extra) {
                        AlertDialog alertDialog = new AlertDialog.Builder(OnlineActivity.this).create();
                        alertDialog.setTitle("Thông báo");
                        alertDialog.setMessage("Bài hát không được tìm thấy. Vui lòng thử lại sau");
                        alertDialog.setButton(AlertDialog.BUTTON_NEUTRAL, "OK",
                                new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialog, int which) {
                                        dialog.dismiss();
                                    }
                                });
                        alertDialog.show();
                        return false;
                    }
                });
            } catch (Exception e) {
                e.printStackTrace();
            }


            return null;
        }

        @Override
        protected void onPostExecute(String aVoid) {
            //enable các nút khi đã load bài hát xog


            mediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
                @Override
                public void onCompletion(MediaPlayer mp) {
                    index++;
                    if (index > listSong.size() - 1) {
                        index = 0;
                    }
                    initMeadiaPlayer();

                    UpdatePlayingTime();
                    btnPlay.setImageResource(R.drawable.pause);
                }
            });


            super.onPostExecute(aVoid);
        }


    }

    //tải 1 bài hát
    class DownloadFileFromURL extends AsyncTask<String, String, String> {

        /**
         * Before starting background thread Show Progress Bar Dialog
         */
        String fileName;

        public DownloadFileFromURL(){
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
            Date date = new Date();
            fileName = simpleDateFormat.format(date);
        }

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            showDialog(progress_bar_type);
        }

        /**
         * Downloading file in background thread
         */
        @Override
        protected String doInBackground(String... f_url) {
            int count;
            //đặt tên file ảnh và mp3

            URL url;
            int lenghtOfFile;
            InputStream input;
            File mydir;
            byte data[];
            OutputStream output;
            long total;
            String[] progressing = new String[2];
            try {


                //Tải hình
                url = new URL(f_url[0]);
                URLConnection conection = url.openConnection();
                conection.connect();


                // this will be useful so that you can show a tipical 0-100%
                // progress bar
                lenghtOfFile = conection.getContentLength();

                // download the file
                input = new BufferedInputStream(url.openStream(),
                        8192);

                mydir = context.getDir("Image", Context.MODE_PRIVATE); //Creating an internal dir;
                if (!mydir.exists()) {
                    mydir.mkdirs();
                }

                // Output stream
                output = new FileOutputStream(mydir
                        + "/" + fileName );

                data = new byte[1024];

                total = 0;

                while ((count = input.read(data)) != -1) {
                    total += count;
                    // publishing the progress....
                    // After this onProgressUpdate will be called
                    progressing[0] = String.valueOf((int) ((total * 100) / lenghtOfFile));
                    progressing[1] = "1";
                    publishProgress(progressing);

                    // writing data to file
                    output.write(data, 0, count);
                }

                // flushing output
                output.flush();

                // closing streams
                output.close();
                input.close();
            } catch (Exception e) {
                Log.e("Error: ", e.getMessage());
                return "erro";
            }


            //tải file mp3
            try {
                url = new URL(f_url[1]);
                URLConnection conection = url.openConnection();
                conection.connect();
                lenghtOfFile = conection.getContentLength();

                // download the file
                input = new BufferedInputStream(url.openStream(),
                        8192);

                mydir = context.getDir("Mp3", Context.MODE_PRIVATE); //Creating an internal dir;
                if (!mydir.exists()) {
                    mydir.mkdirs();
                }

                // Output stream
                output = new FileOutputStream(mydir
                        + "/" + fileName + ".mp3");

                data = new byte[1024];

                total = 0;

                while ((count = input.read(data)) != -1) {
                    total += count;
                    // publishing the progress....
                    // After this onProgressUpdate will be called
                    progressing[0] = String.valueOf((int) ((total * 100) / lenghtOfFile));
                    progressing[1] = "2";
                    publishProgress(progressing);

                    // writing data to file
                    output.write(data, 0, count);
                }

                // flushing output
                output.flush();

                // closing streams
                output.close();
                input.close();
            } catch (Exception e) {
                return "erro";
            }

            return f_url[2];
        }

        /**
         * Updating progress bar
         */
        protected void onProgressUpdate(String... progress) {
            // setting progress percentage

            if(progress[1].equals("1")){
                pDialog.setMessage("Đang tải hình ảnh");
            }
            else{
                pDialog.setMessage("Đang tải tệp nhạc");
            }
            pDialog.setProgress(Integer.parseInt(progress[0]));

        }

        /**
         * After completing background task Dismiss the progress dialog
         **/
        @Override
        protected void onPostExecute(String file_url) {
            // dismiss the dialog after the file was downloaded
            dismissDialog(progress_bar_type);
            if (!file_url.equals("erro")) {
                OnlineSong song = listSong.get(Integer.parseInt(file_url));
                song.setImage(fileName);
                song.setFile(fileName+".mp3");

                SQLiteModel db = new SQLiteModel(context);
                db.addSong(song);

            } else {
                AlertDialog alertDialog = new AlertDialog.Builder(OnlineActivity.this).create();
                alertDialog.setTitle("Thông báo");
                alertDialog.setMessage("Quá trình tải bị gián đoạn. Vui lòng thử lại sau");
                alertDialog.setButton(AlertDialog.BUTTON_NEUTRAL, "OK",
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                                dialog.dismiss();
                            }
                        });
                alertDialog.show();
            }
        }


    }
}


