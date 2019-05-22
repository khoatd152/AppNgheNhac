package com.example.ungdungnghenhacmp3;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Handler;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;

import com.example.ungdungnghenhacmp3.Adapter.ListSongAdapter;
import com.example.ungdungnghenhacmp3.Model.OnlineSong;
import com.example.ungdungnghenhacmp3.Model.Song;
import com.example.ungdungnghenhacmp3.SQLite.SQLiteModel;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    ListView listView;
    TextView txtPlayingTime, txtDurationTime, txtSongName;
    SeekBar seekBar;
    ImageButton btnPrevious, btnNext, btnPlay;
    List<OnlineSong> listSong;
    int index = 0;
    MediaPlayer mediaPlayer;
    ListSongAdapter listViewAdapter;
    private static final int MENU_ITEM_DELETE = 111;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        AnhXa();

        File Mp3Folder = this.getDir("Mp3", Context.MODE_PRIVATE); //Creating an internal dir;
        if (!Mp3Folder.exists()) {
            Mp3Folder.mkdirs();
        }
        File ImageFolder = this.getDir("Image", Context.MODE_PRIVATE); //Creating an internal dir;
        if (!ImageFolder.exists()) {
            ImageFolder.mkdirs();
        }


        SQLiteModel db = new SQLiteModel(this);

        db.CreateDefaultSong();



        listSong = db.getAllSongs();

        listViewAdapter = new ListSongAdapter(R.layout.item_in_list_song, this, listSong);
        listView.setAdapter(listViewAdapter);

        if (listSong.size() > 0) {
            initMeadiaPlayer();

            btnPlay.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    if (mediaPlayer.isPlaying()) {
                        mediaPlayer.pause();
                        btnPlay.setImageResource(R.drawable.play);
                    } else {
                        mediaPlayer.start();
                        btnPlay.setImageResource(R.drawable.pause);
                        UpdatePlayingTime();
                    }

                }
            });

            listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                    index = position;
                    initMeadiaPlayer();
                    mediaPlayer.start();
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
                    initMeadiaPlayer();
                    mediaPlayer.start();
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
                    initMeadiaPlayer();
                    mediaPlayer.start();
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

            registerForContextMenu(this.listView);
        }


    }

    

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {

        getMenuInflater().inflate(R.menu.menu_main, menu);

        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

        switch (item.getItemId()) {
            case R.id.openOnlineActivity: {
                if (mediaPlayer != null && mediaPlayer.isPlaying()) {
                    mediaPlayer.stop();

                }
                mediaPlayer = null;
                Intent intent = new Intent(this, OnlineActivity.class);
                startActivity(intent);
                break;
            }


            default:
                break;
        }


        return super.onOptionsItemSelected(item);
    }

    private void UpdatePlayingTime() {
        final Handler handler = new Handler();
        handler.postDelayed(new Runnable() {
            @Override
            public void run() {
                if (mediaPlayer != null) {
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("mm:ss");
                    txtPlayingTime.setText(simpleDateFormat.format(mediaPlayer.getCurrentPosition()));
                    seekBar.setProgress(mediaPlayer.getCurrentPosition());
                    handler.postDelayed(this, 500);
                }

            }
        }, 100);
    }

    private void AnhXa() {
        listView = findViewById(R.id.listSong);
        txtPlayingTime = findViewById(R.id.txtPlayingTime);
        txtDurationTime = findViewById(R.id.txtDurationTime);
        txtSongName = findViewById(R.id.txtSongName);
        seekBar = findViewById(R.id.seekBar);
        btnPrevious = findViewById(R.id.btnPrevious);
        btnNext = findViewById(R.id.btnNext);
        btnPlay = findViewById(R.id.btnPlay);
    }

    public void initMeadiaPlayer() {
        if (mediaPlayer != null && mediaPlayer.isPlaying())
            mediaPlayer.stop();
        Uri path = Uri.parse(MainActivity.this.getDir("Mp3", Context.MODE_PRIVATE) + "/" + listSong.get(index).getFile());
        mediaPlayer = MediaPlayer.create(MainActivity.this, path);
        SetTimeDuration();
        txtSongName.setText(listSong.get(index).getSongName());
        mediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
            @Override
            public void onCompletion(MediaPlayer mp) {
                index++;
                if (index > listSong.size() - 1) {
                    index = 0;
                }
                initMeadiaPlayer();
                mediaPlayer.start();
                UpdatePlayingTime();
                btnPlay.setImageResource(R.drawable.pause);
            }
        });
    }

    public void SetTimeDuration() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("mm:ss");
        txtDurationTime.setText(simpleDateFormat.format(mediaPlayer.getDuration()));

        //set seekbar theo duration (ms)
        seekBar.setMax(mediaPlayer.getDuration());
    }

    @Override
    public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo) {
        super.onCreateContextMenu(menu, v, menuInfo);
        menu.add(0, MENU_ITEM_DELETE , 0, "Xóa bài hát");

    }

    public boolean onContextItemSelected(MenuItem item){
        AdapterView.AdapterContextMenuInfo
                info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();

        final OnlineSong selectedSong = (OnlineSong) this.listView.getItemAtPosition(info.position);

       if(item.getItemId() == MENU_ITEM_DELETE){
            // Hỏi trước khi xóa.
            new AlertDialog.Builder(this)
                    .setMessage("Bạn muốn xóa bài hát \""+selectedSong.getSongName()+"\"?")
                    .setCancelable(false)
                    .setPositiveButton("Có", new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int id) {
                            deleteSong(selectedSong);
                        }
                    })
                    .setNegativeButton("Không", null)
                    .show();
        }
        else {
            return false;
        }
        return true;
    }

    public void deleteSong(OnlineSong song){
        SQLiteModel db = new SQLiteModel(this);
        db.delSongByID(song);
        this.listSong.remove(song);
        // Refresh ListView.
        this.listViewAdapter.notifyDataSetChanged();
    }
}
