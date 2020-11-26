const assert=require('assert');

module.exports=function (key, maxage=1*86400*1000){
  assert(key, 'key is required');

  return async (ctx,next)=>{
    let data=await ctx.redis.getAsync(key);

    if(data){
      console.log('from cache');
      ctx.body=data;
    }else{
      console.log('from render');
      await next();
      await ctx.redis.psetexAsync(key, maxage, ctx.body);
    }
  };
}
