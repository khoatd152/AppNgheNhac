package com.example.ungdungnghenhacmp3.Adapter;

import android.app.ProgressDialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.Image;
import android.os.AsyncTask;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.ungdungnghenhacmp3.Model.OnlineSong;
import com.example.ungdungnghenhacmp3.Model.Song;
import com.example.ungdungnghenhacmp3.OnlineActivity;
import com.example.ungdungnghenhacmp3.R;

import java.io.InputStream;
import java.net.URL;
import java.util.List;


public class ListSongOnlineAdapter extends BaseAdapter {


    public ListSongOnlineAdapter(Context context,int layout,  List<OnlineSong> listOnlineSong) {
        this.layout = layout;
        this.context = context;
        this.listOnlineSong = listOnlineSong;
    }

    private int layout;
    private Context context;
    List<OnlineSong> listOnlineSong;

    @Override
    public int getCount() {
        return listOnlineSong.size();
    }

    @Override
    public Object getItem(int position) {
        return listOnlineSong.get(position);
    }

    @Override
    public long getItemId(int position) {
        return 0;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {

        LayoutInflater layoutInflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        convertView = layoutInflater.inflate(layout,null);

        //ánh xạ
        TextView txtName = convertView.findViewById(R.id.txtSongNameInList);
        TextView txtArtist = convertView.findViewById(R.id.txtArtistNameInList);
        ImageView imageView = convertView.findViewById(R.id.imageView);

        OnlineSong song = listOnlineSong.get(position);

        txtName.setText(song.getSongName());
        txtArtist.setText(song.getArtistName());

        new DownloadImageTask(imageView).execute(song.getImage());

        return convertView;


    }

    class DownloadImageTask extends AsyncTask<String, Void, Bitmap> {
        ImageView bmImage;

        public DownloadImageTask(ImageView bmImage) {
            this.bmImage = bmImage;
        }

        @Override
        protected void onPreExecute() {
            // TODO Auto-generated method stub
            super.onPreExecute();

        }

        protected Bitmap doInBackground(String... urls) {
            String urldisplay = urls[0];
            Bitmap mIcon11 = null;
            try {
                InputStream in = new java.net.URL(urldisplay).openStream();
                mIcon11 = BitmapFactory.decodeStream(in);
            } catch (Exception e) {
                Log.e("Error", e.getMessage());
                e.printStackTrace();
            }
            return mIcon11;
        }

        @Override
        protected void onPostExecute(Bitmap result) {
            super.onPostExecute(result);

            bmImage.setImageBitmap(result);
        }
    }
}


