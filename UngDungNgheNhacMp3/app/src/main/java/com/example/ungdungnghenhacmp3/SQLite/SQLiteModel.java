package com.example.ungdungnghenhacmp3.SQLite;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

import com.example.ungdungnghenhacmp3.MainActivity;
import com.example.ungdungnghenhacmp3.Model.OnlineSong;
import com.example.ungdungnghenhacmp3.Model.Song;
import com.example.ungdungnghenhacmp3.R;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class SQLiteModel extends SQLiteOpenHelper {


    private static final String TAG = "SQLite";


    // Phiên bản
    private static final int DATABASE_VERSION = 1;


    // Tên cơ sở dữ liệu.
    private static final String DATABASE_NAME = "ManageSong";


    // Tên bảng: Note.
    private static final String TABLE = "Song";

    private static final String COLUMN_SONG_ID = "SongID";
    private static final String COLUMN_SONG_NAME = "SongName";
    private static final String COLUMN_ARTIST_NAME = "ArtistName";
    private static final String COLUMN_SONG_IMAGE = "SongImage";
    private static final String COLUMN_SONG_FILE = "SongFile";

    private Context context;

    public SQLiteModel(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
        this.context = context;
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        // Script tạo bảng.
        String script = "CREATE TABLE " + TABLE + "("
                + COLUMN_SONG_ID + " INTEGER PRIMARY KEY,"
                + COLUMN_SONG_NAME + " TEXT,"
                + COLUMN_ARTIST_NAME + " TEXT,"
                + COLUMN_SONG_IMAGE + " TEXT,"
                + COLUMN_SONG_FILE + " TEXT"
                + ")";
        // Chạy lệnh tạo bảng.
        db.execSQL(script);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        // Hủy (drop) bảng cũ nếu nó đã tồn tại.
        db.execSQL("DROP TABLE IF EXISTS " + TABLE);


        // Và tạo lại.
        onCreate(db);
    }

    public void CreateDefaultSong(){

        int count = this.getSongsCount();
        if (count == 0) {

            OnlineSong onlineSong1 = new OnlineSong("Cưng chiều che chở","Vương Lý Vân","h1.jpg", "cungchieuchecho.mp3");
            OnlineSong onlineSong2 = new OnlineSong("Ngôi sao nhỏ","Uông Tô Lang","h2.jpg", "ngoisaonho.mp3");
            this.addSong(onlineSong1);
            this.addSong(onlineSong2);

        }
        InitSong();

    }

    public void InitSong() {

        File mydir = context.getDir("Mp3", Context.MODE_PRIVATE); //Creating an internal dir;
        if (!mydir.exists())
        {
            mydir.mkdirs();
        }

        InputStream in = context.getResources().openRawResource(R.raw.cungchieuchecho);
        FileOutputStream out = null;
        try {
            out = new FileOutputStream(mydir+"/cungchieuchecho.mp3");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        byte[] buff = new byte[1024];
        int read = 0;

        try {
            while ((read = in.read(buff)) > 0) {
                out.write(buff, 0, read);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        in = context.getResources().openRawResource(R.raw.ngoisaonho);
        try {
            out = new FileOutputStream(mydir+"/ngoisaonho.mp3");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        buff = new byte[1024];
        read = 0;

        try {
            while ((read = in.read(buff)) > 0) {
                out.write(buff, 0, read);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        mydir = context.getDir("Image", Context.MODE_PRIVATE);

        in = context.getResources().openRawResource(R.raw.h1);
        try {
            out = new FileOutputStream(mydir+"/h1.jpg");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        buff = new byte[1024];
        read = 0;

        try {
            while ((read = in.read(buff)) > 0) {
                out.write(buff, 0, read);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        in = context.getResources().openRawResource(R.raw.h2);
        try {
            out = new FileOutputStream(mydir+"/h2.jpg");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        buff = new byte[1024];
        read = 0;

        try {
            while ((read = in.read(buff)) > 0) {
                out.write(buff, 0, read);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public void addSong(OnlineSong song) {

        SQLiteDatabase db = this.getWritableDatabase();

        ContentValues values = new ContentValues();
        values.put(COLUMN_SONG_NAME, song.getSongName());
        values.put(COLUMN_ARTIST_NAME, song.getArtistName());
        values.put(COLUMN_SONG_IMAGE, song.getImage() );
        values.put(COLUMN_SONG_FILE, song.getFile());

        // Trèn một dòng dữ liệu vào bảng.
        db.insert(TABLE, null, values);


        // Đóng kết nối database.
        db.close();
    }

    public List<OnlineSong> getAllSongs() {

        List<OnlineSong> songList = new ArrayList<OnlineSong>();
        // Select All Query
        String selectQuery = "SELECT  * FROM " + TABLE;

        SQLiteDatabase db = this.getWritableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);


        // Duyệt trên con trỏ, và thêm vào danh sách.
        if (cursor.moveToFirst()) {
            do {
                OnlineSong onlineSong = new OnlineSong();


                onlineSong.setSongID(Integer.parseInt(cursor.getString(0)));
                onlineSong.setSongName(cursor.getString(1));
                onlineSong.setArtistName(cursor.getString(2));
                onlineSong.setImage(cursor.getString(3));
                onlineSong.setFile(cursor.getString(4));
                // Thêm vào danh sách.
                songList.add(onlineSong);
            } while (cursor.moveToNext());
        }

        // return note list
        return songList;
    }


    public OnlineSong getSong(int id) {

        SQLiteDatabase db = this.getReadableDatabase();

        Cursor cursor = db.query(TABLE, new String[]{COLUMN_SONG_ID,
                        COLUMN_SONG_NAME, COLUMN_ARTIST_NAME,COLUMN_SONG_IMAGE,COLUMN_SONG_FILE}, COLUMN_SONG_ID + "=?",
                new String[]{String.valueOf(id)}, null, null, null, null);
        if (cursor != null)
            cursor.moveToFirst();

        OnlineSong song = new OnlineSong(Integer.parseInt(cursor.getString(0)),
                cursor.getString(1), cursor.getString(2),cursor.getString(3), cursor.getString(4));

        return song;
    }

    public int getSongsCount() {

        String countQuery = "SELECT  * FROM " + TABLE;
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery(countQuery, null);

        int count = cursor.getCount();

        cursor.close();

        return count;
    }

    public int updateSong(OnlineSong song) {

        SQLiteDatabase db = this.getWritableDatabase();

        ContentValues values = new ContentValues();
        values.put(COLUMN_SONG_ID, song.getSongID());
        values.put(COLUMN_SONG_NAME, song.getSongName());
        values.put(COLUMN_ARTIST_NAME, song.getArtistName());
        values.put(COLUMN_SONG_IMAGE, song.getImage() );
        values.put(COLUMN_SONG_FILE, song.getFile());

        // updating row
        return db.update(TABLE, values, COLUMN_SONG_ID + " = ?",
                new String[]{String.valueOf(song.getSongID())});
    }

    public void deleteSong(OnlineSong song) {

        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE, COLUMN_SONG_ID + " = ?",
                new String[]{String.valueOf(song.getSongID())});
        db.close();
    }

    public void delAllSong(){
        SQLiteDatabase db = this.getWritableDatabase();
        db.execSQL("delete from Song");

        db.close();
    }

    public void delSongByID(OnlineSong song){
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE, COLUMN_SONG_ID + " = ?",
                new String[]{String.valueOf(song.getSongID())});
        db.close();
    }

}
