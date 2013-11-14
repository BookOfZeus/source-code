/*
mysql> desc `url`;
+----------------+------------------+------+-----+---------+----------------+
| Field          | Type             | Null | Key | Default | Extra          |
+----------------+------------------+------+-----+---------+----------------+
| id             | int(10) unsigned | NO   | PRI | NULL    | auto_increment | 
| name           | varchar(50)      | NO   |     |         |                | 
| url            | varchar(255)     | NO   |     |         |                | 
| fk_category_id | int(10) unsigned | NO   |     | NULL    |                | 
+----------------+------------------+------+-----+---------+----------------+
*/

mysql> select `id`, `url`, LENGTH(`url`) - LENGTH(REPLACE(`url`, '/', '')) as `number` from `url`;

/*
+----+-------------------------------+--------+
| id | url                           | number |
+----+-------------------------------+--------+
|  1 | http://www.thesunrisepost.com |      2 | 
+----+-------------------------------+--------+
*/
