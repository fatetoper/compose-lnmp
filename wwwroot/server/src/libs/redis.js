const redis=require('redis');
const bluebird=require('bluebird');
const {REDIS}=require('../config');

let client=redis.createClient({
  host: REDIS.HOST,
  port: REDIS.PORT,
  // password: REDIS.PASS,
});
bluebird.promisifyAll(redis.RedisClient.prototype);

client.on('error', err=>{
  console.log('error:', err.code);
});
client.on('reconnecting', ev=>{
  console.log(`try to reconnect to redis server: ${ev.attempt}`);
});

module.exports=client;
