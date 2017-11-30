function Conn = ConnectToMySQL()

javaclasspath('/home/ndplab/ToolboxExtend/CNS/DBLib/mysql-connector-java-5.1.28/mysql-connector-java-5.1.28-bin.jar');
driver = 'com.mysql.jdbc.Driver';
dbname = 'ImagingRepositoryV6';
dburl = ['jdbc:mysql://cns5.med.ucla.edu/' dbname];
Conn = database(dbname, 'mher', '4mher2c', driver, dburl);

end