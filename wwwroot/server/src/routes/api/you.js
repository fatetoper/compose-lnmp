/*
 * @Author: your name
 * @Date: 2020-11-23 10:21:34
 * @LastEditTime: 2020-11-23 10:29:08
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \mockserver\src\routes\api\you.js
 */
// 获取banner	GET	/api/you/banner
router.get('/banner', async ctx=>{
    ctx.body=await ctx.db.query("SELECT name,picUrl,targetUrl FROM you_banner;");
    
  });