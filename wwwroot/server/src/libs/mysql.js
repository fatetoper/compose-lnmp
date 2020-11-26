/*
 * @Author: your name
 * @Date: 2020-11-14 16:19:46
 * @LastEditTime: 2020-11-15 16:23:21
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \mockserver\src\libs\mysql.js
 */
const mysql=require('promise-mysql');
const {DB}=require('../config');

module.exports=mysql.createPool({
  host: DB.HOST,
  port: DB.PROT,
  user: DB.USER,
  password: DB.PASSWORD,
  database: DB.DATABASE
});
