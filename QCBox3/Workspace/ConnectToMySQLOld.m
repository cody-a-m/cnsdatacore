function [Conn, DBSyncID] = ConnectToMySQLOld()

javaclasspath('/home/ndplab/ToolboxExtend/CNS/DBLib/mysql-connector-java-5.1.28/mysql-connector-java-5.1.28-bin.jar');
driver = 'com.mysql.jdbc.Driver';
dbname = 'ImagingRepositoryV4';
dburl = ['jdbc:mysql://10.44.212.152:3306/' dbname];
Conn = database(dbname, 'MATLABDB', '4matlab2c', driver, dburl);
if Conn.handle == 0
    DBSyncID = 0;
else
    fastinsert(Conn, 'DBSyncs', {'DBSyncUser'}, {'MATLABDB'});
    QuickRes = fetch(Conn, 'SELECT DBSyncID FROM DBSyncs WHERE DBSyncID = @@IDENTITY');
    DBSyncID = QuickRes{1};
end

end