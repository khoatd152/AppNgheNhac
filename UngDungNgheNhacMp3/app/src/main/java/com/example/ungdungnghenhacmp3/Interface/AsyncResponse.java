package com.example.ungdungnghenhacmp3.Interface;

import com.example.ungdungnghenhacmp3.Model.OnlineSong;

import java.util.List;

public interface AsyncResponse {
    void processFinish(List<OnlineSong> output);
}