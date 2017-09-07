environments {
  development {
    dataSource {
        pooled = "true"
        jmxExport = "true"
        driverClassName = "org.h2.Driver"
        username = "sa"
        password = ""
        dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
        url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
    }
  }
  test {
    dataSource {
      dbCreate = "update"
      url = "jdbc:h2:mem:testDb;MVCC=TRUE"
    }
  }
  production {
    dataSource {
      dbCreate = "update"
      driverClassName = "org.postgresql.Driver"
      dialect = org.hibernate.dialect.PostgreSQL9Dialect
      uri = new URI(System.env.DATABASE_URL?:"postgres://localhost:5432/test")
      url = "jdbc:postgresql://" + uri.host + ":" + uri.port + uri.path + "?sslmode=require"
      username = uri.userInfo.split(":")[0]
      password = uri.userInfo.split(":")[1]
    }
  }
}
