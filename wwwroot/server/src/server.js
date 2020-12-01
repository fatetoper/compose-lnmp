/*
 * @Author: fatetoper
 * @Date: 2020-12-01 01:42:10
 * @LastEditors: fatetoper
 * @LastEditTime: 2020-12-01 03:08:30
 * @Modultype: Component
 * @Usage: import/global/prototype
 * @Description: Do not edit
 * @FilePath: \docker\wwwroot\server\src\server.js
 */
import Koa from 'koa'
import {post, upload} from './libs/body'
import KoaLogger from 'koa-logger'
import fs from 'promise-fs'
import cors from 'koa2-cors'
import network from './libs/network'
import cookie from 'koa-cookie'
import koa2Common from 'koa2-common'
const session = require('koa-session2');
import { SYSTEM, ERRORS } from './config'
import router from './routes'

const server = new Koa()
const env = process.env.NODE_ENV || 'development'
const store = require('./libs/session');
 
export default (async (server, env)=>{
    // error 页面引入
    let error_404='';
    try{
        error_404= await fs.readFile(ERRORS[404])
        error_404=error_404.toString();
    }catch(e){
    console.log('read 404 file error');
    }

    let error_500='';
    try{
        error_500 = await fs.readFile(ERRORS[500])
        error_500=error_500.toString();
    }catch(e){
    console.log('read 500 file error');
    }

    server.keys = ['suid']
    server
        //全局错误处理
        .use(async (ctx,next)=>{
            try{
            await next();
            if(!ctx.body){
                ctx.status=404;
                ctx.body=error_404||'Not Found';
            }
            }catch(e){
            ctx.status=500;
            ctx.body=error_500||'Internal Server Error';
            console.error(e);
            }
        })
        .use(post())
        // .use(KoaLogger())
        .use(cookie())
        // .use(koa2Common())
        .use(cors({
            origin: function (ctx) {
                // if(ctx.url.startsWith('/api/you')){
                // return 'http://localhost'
                // }
                return SYSTEM.ORIGIN; // 这样就能只允许 http://localhost:80
            },
            exposeHeaders: ['WWW-Authenticate', 'Server-Authorization'],
            // exposeHeaders: ['*'],
            maxAge: 5,
            credentials: true,
            allowMethods: ['GET', 'POST', 'DELETE', 'OPTIONS'],
            allowHeaders: ['Content-Type', 'Authorization', 'Accept', 'access-token', 'X-Requested-With', 'Origin'],
        }))
        .use(router.routes())
        .use(router.allowedMethods())
        .use(session({
            store: store,
            maxAge:1*60*60*1000
        }))
        .use((ctx, next) => {
            const start = new Date()
            return next().then(() => {
                const ms = new Date() - start
                console.log(`${ctx.method} ${ctx.url} - ${ms}ms`)
            })
        });

    // 全局引入 MySQL、Redis客户端
    server.context.db = await require('./libs/mysql');
    // server.context.redis = require('./libs/redis');
    //session
    // await require('./libs/session')(server);

    server.listen(SYSTEM.PROT);
    network.forEach(ip => {
    if(SYSTEM.PROT == 80){
        console.log(`server running at http://${ip}`);
    }else{
        console.log(`server running at http://${ip}:${SYSTEM.PROT}`);
    }
    });
    return server
})(server, env);
// export default server
