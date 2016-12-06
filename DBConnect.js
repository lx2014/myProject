var localdb;
//打开数据库，没有则创建，没有指定表则创建
function  openDB()
{
    localdb = LocalStorage.openDatabaseSync("QQmlValueRecordDB", "1.0", "QML LocalStorage", 1000000);

    localdb.transaction(function(tx){

        tx.executeSql('CREATE TABLE IF NOT EXISTS datasheet(name TEXT, score TEXT)');
    })
}

//数据库插入数据
function insertDBData(name,score)
{
    localdb.transaction(function(tx)
    {
        tx.executeSql('INSERT INTO datasheet VALUES(?,?)', [name,score]);
    })

}

//从数据库获取数据
function getDBData()
{
    localdb.transaction(function(tx)
    {
        var rs = tx.executeSql('SELECT * FROM datasheet');
        //return rs;
        for(var i = 0; i < rs.rows.length; i++)
        {
            model_page_nba.append({"name":rs.rows.item(i).name,"score":rs.rows.item(i).score});
        }
    })

}
