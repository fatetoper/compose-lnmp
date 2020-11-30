/*
 * @Author: your name
 * @Date: 2020-11-25 01:58:58
 * @LastEditTime: 2020-12-01 00:29:47
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \docker\wwwroot\server\src\libs\redis.js
 */
const redis = require('redis');
const bluebird = require('bluebird');
const { REDIS } = require('../config');
// const { promisify } = require("util");


let client=redis.createClient({
  host: REDIS.HOST,
  port: REDIS.PORT,
  // password: REDIS.PASS,
});
bluebird.promisifyAll(redis.RedisClient.prototype);
// console.log('redise==>client.prototype', client.prototype);
// const getAsync = promisify(client.get).bind(client);
client.on('error', err=>{
  console.log('error:', err.code);
});
client.on('reconnecting', ev=>{
  console.log(`try to reconnect to redis server: ${ev.attempt}`);
});

module.exports=client;
