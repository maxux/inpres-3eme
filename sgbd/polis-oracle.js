var oracle = require("./modules/oracle");

var oradata = {
        'hostname': '10.142.1.101',
        'user': 'maxux_cb',
        'password': 'maxux_cb',
        'database': 'orcl',
};

var fs = require('fs');
var Buffer = require('buffer').Buffer;
var constants = require('constants');

var raw = fs.readFileSync("/tmp/xserve.jpg");
console.log(raw);

oracle.connect(oradata, function(error, connection) {
        if(error) {
                console.log(error);
                process.exit(1);
        }
        
        //
        // well, we are connected to Oracle database, that's a miracle
        // let's try to do some requests        
        connection.execute("INSERT INTO images (id, image, movie) VALUES (:1, :2, NULL)", [1337, raw], function(err, results) {
                console.log(err);
		console.log(results);
	});
});
