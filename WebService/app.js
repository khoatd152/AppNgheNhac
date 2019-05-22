var http = require('http');
var express = require('express');
const sql = require('mssql');
const PORT = 3000;
var os = require('os');
var networkInterfaces = os.networkInterfaces();
var IP = "172.16.107.216";
var app = express();
app.use(express.static('public'));

var server = http.createServer(app);

var config = {
    user: 'admin',
    password: '123',
    server: 'localhost', 
    database: 'QuanLyWebsiteNgheNhac' 
};


server.listen(PORT, function () {
    console.log('Opened Server on port 3000');
});

app.get('/',(req,res)=>{
    sql.connect(config, function (err) {

        if (err) console.log(err);
    
        // create Request object
        var request = new sql.Request();
    
        // query to the database and get the records
        request.query(`select s.ID, s.Name as SongName, a.Name as ArtistName, a.Image, s.FileName
        from Song s, Artist a, Song_Artist sa
        where s.ID = sa.Song and a.ID = sa.Artist `, function (err, recordset) {
    
            if (err) console.log(err)
            sql.close();    
            var obj;
            var songs = recordset.recordset;
            for(let i=0;i<songs.length;i++){
                obj = songs[i];
                obj.Image = 'http://'+IP+':'+PORT+'/Assets/image/avartarArtist/'+obj.Image;
                obj.FileName = 'http://'+IP+':'+PORT+'/Assets/singer/'+obj.FileName;

               
            }
            res.send(songs);
        });
    });
})

