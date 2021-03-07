module db

import pg

// TODO call structs from a C file.
struct Pool {
	host string = 'localhost'
	port int = 5432
	user string
	password string
	dbname string
}

fn newpool(pool Pool) &Pool {
	return &Pool {
		host: pool.host
		port: pool.port
		user: pool.user
		password: pool.password
		dbname: pool.dbname
	}
}

// Creates the db pool.
pub fn pgpool() pg.DB {
	pool := newpool(user: 'fate', password: 'fate', dbname: 'fate')
	conn := pg.connect(pg.Config{
		host: pool.host
		port: pool.port
		user: pool.user
		password: pool.password
		dbname: pool.dbname
	}) or { panic(err) }

	return conn
}
