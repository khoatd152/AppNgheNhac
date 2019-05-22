package com.example.ungdungnghenhacmp3.Model;

public class Song {
    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public int getFile() {
        return File;
    }

    public void setFile(int file) {
        File = file;
    }

    public Song(String name, int file) {
        Name = name;
        File = file;
    }

    public Song(String name,String artist ,int file ) {
        Name = name;
        File = file;
        Artist = artist;
    }

    private String Name;
    private int File;
    private String Artist;
    public String getArtist() {
        return Artist;
    }

    public void setArtist(String artist) {
        Artist = artist;
    }


}
