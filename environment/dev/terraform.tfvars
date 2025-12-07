resource_group = {
  rg1 = {
     name = "rg-capston-dev-cin-001"
  location = "central india"
  
}
  }
todomysqlserver01 = {
    sql_server1 = {
 resource_group_name = "k8s-dev-rg"
  location = "central india"
  administrator_login = "devops123"
  administrator_login_password = "Devops@1@3#5"
  name = "devdas-sql-server"
  version = "12.0"
   db_name = "devdb20251"
    max_size_gb = 1
    }
}
sql_database = {
  sql_db1 ={
    name = "dev-01-sqldb"
    server_key = "sql_server1" 
  }
}
