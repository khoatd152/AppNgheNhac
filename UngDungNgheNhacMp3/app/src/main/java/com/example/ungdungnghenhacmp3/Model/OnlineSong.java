package com.example.ungdungnghenhacmp3.Model;

public class OnlineSong {


    public int getSongID() {
        return SongID;
    }

    public void setSongID(int songID) {
        SongID = songID;
    }

    public String getSongName() {
        return SongName;
    }

    public void setSongName(String songName) {
        SongName = songName;
    }

    public String getArtistName() {
        return ArtistName;
    }

    public void setArtistName(String artistName) {
        ArtistName = artistName;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String image) {
        Image = image;
    }

    public String getFile() {
        return File;
    }

    public void setFile(String file) {
        File = file;
    }

    public OnlineSong(int songID, String songName, String artistName, String image, String file) {
        SongID = songID;
        SongName = songName;
        ArtistName = artistName;
        Image = image;
        File = file;
    }

    public OnlineSong(){

    }
    public OnlineSong(String songName, String artistName, String image, String file){
        SongName = songName;
        ArtistName = artistName;
        Image = image;
        File = file;
    }
    private int SongID;
    private String SongName;
    private String ArtistName;
    private String Image;
    private String File;
}
