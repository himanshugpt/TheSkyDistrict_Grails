dataSource {
    pooled = true
    driverClassName = "org.hsqldb.jdbcDriver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            //url = "jdbc:hsqldb:mem:devDB"
			url = "jdbc:mysql://localhost/sky_district"
			driverClassName = "com.mysql.jdbc.Driver"
			username = "root"
			password =  "root"
			dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
        }
    }
    test {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            //url = "jdbc:hsqldb:mem:devDB"
			url = "jdbc:mysql://localhost/sky_district"
			driverClassName = "com.mysql.jdbc.Driver"
			username = "root"
			password =  "root"
			dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
           // url = "jdbc:hsqldb:mem:devDB"
			url = "jdbc:mysql://65.49.80.16:3307/theskydistrict?autoReconnect=true"
			driverClassName = "com.mysql.jdbc.Driver"
			username = "theskydistrict"
			password =  "startup1"
			dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
        }
    }
}
