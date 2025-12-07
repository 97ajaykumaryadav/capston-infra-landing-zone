resource_group = {
  rg1 = {
     name = "rg-capston-dev-cin-001"
  location = "central india"
  
}
  }
todomysqlserver01 = {
    sql_server1 = {
 resource_group_name = "rg-capston-dev-cin-001"
  location = "central india"
  administrator_login = "devops123"
  administrator_login_password = "Devops@1@3#5"
  name = "sql-server-capston-cin-001"
  version = "12.0"
    max_size_gb = 1
    }
}
sql_database = {
  sql_db1 ={
    name = "sql-db-capston-cin-001"
    server_key = "sql_server1" 
  }
}
