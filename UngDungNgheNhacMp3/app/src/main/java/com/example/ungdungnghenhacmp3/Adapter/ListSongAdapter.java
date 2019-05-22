package com.example.ungdungnghenhacmp3.Adapter;

import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.text.Layout;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.ungdungnghenhacmp3.MainActivity;
import com.example.ungdungnghenhacmp3.Model.OnlineSong;
import com.example.ungdungnghenhacmp3.Model.Song;
import com.example.ungdungnghenhacmp3.R;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class ListSongAdapter extends BaseAdapter {

    public ListSongAdapter(int layout, android.content.Context context, List<OnlineSong> songList) {
        Layout = layout;
        Context = context;
        SongList = songList;
    }

    private int Layout;
    private Context Context;
    private List<OnlineSong> SongList;

    @Override
    public int getCount() {
        return SongList.size();
    }

    @Override
    public Object getItem(int position) {
        return SongList.get(position);
    }

    @Override
    public long getItemId(int position) {
        return 0;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater layoutInflater = (LayoutInflater) Context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        convertView = layoutInflater.inflate(Layout, null);

        //ánh xạ
        TextView txtName = convertView.findViewById(R.id.txtSongNameInList);
        TextView txtArtist = convertView.findViewById(R.id.txtArtistNameInList);
        ImageView img = convertView.findViewById(R.id.imageView);

        OnlineSong song = SongList.get(position);
        txtName.setText(song.getSongName());
        txtArtist.setText(song.getArtistName());

        File f = new File(Context.getDir("Image", Context.MODE_PRIVATE),song.getImage());

        try {
            Bitmap b = BitmapFactory.decodeStream(new FileInputStream(f));
            img.setImageBitmap(b);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }


        return convertView;
    }
}
