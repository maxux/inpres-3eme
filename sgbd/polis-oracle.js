var oracle = require("./modules/oracle");

var oradata = {
        'hostname': '10.142.1.101',
        'user': 'maxux',
        'password': 'maxux',
        'database': 'orcl',
};

oracle.connect(oradata, function(error, connection) {
        if(error) {
                console.log(error);
                process.exit(1);
        }
        
        //
        // well, we are connected to Oracle database, that's a miracle
        // let's try to do some requests
        //
	connection.execute("SELECT * FROM hello", [], function(err, results) {
		console.log(results);
	});
        
        
});
