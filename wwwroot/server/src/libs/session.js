const Redis = require("ioredis");
const { Store } = require("koa-session2");
 
class RedisStore extends Store {
    constructor(redisConfig) {
        super();
        this.redis = new Redis(redisConfig);
    }
 
    async get(sid, ctx) {
        let data = await this.redis.get(`SESSION:${sid}`);
        return JSON.parse(data);
    }
 
    async set(session, { sid =  this.getID(24), maxAge = 1000000 } = {}, ctx) {
        try {
            // Use redis set EX to automatically drop expired sessions
            await this.redis.set(`SESSION:${sid}`, JSON.stringify(session), 'EX', maxAge / 1000);
        } catch (e) {}
        return sid;
    }
 
    async destroy(sid, ctx) {
        return await this.redis.del(`SESSION:${sid}`);
    }
}
 
module.exports = RedisStore;


// const session = require('koa-session');
// const fs = require('promise-fs');
// const { SESSION } = require('../config');
// const client = require('./redis');

// module.exports = async server => {
//   try{
//     let buffer = await fs.readFile(SESSION.key_path);
//     server.keys = JSON.parse(buffer.toString());
//   }catch(e){
//     console.log('读取key文件失败，请重新生成');

//     console.error(e);

//     return;
//   }

//   let store = {
//     async get(key, maxAge){
//       let data=await client.getAsync(key);

//       if(!data)return {};

//       try{
//         return JSON.parse(data);
//       }catch(e){
//         return {};
//       }
//     },
//     async set(key, session, maxAge){
//       await client.psetexAsync(key, maxAge, JSON.stringify(session));
//     },
//     async destroy(key){
//       await client.delAsync(key);
//     }
//   };
//   server.use(session({
//     maxAge: SESSION.maxAge,
//     renew: true,
//     store
//   }, server));
// }
