const Router=require('koa-router')
// const static=require('../../libs/contentStatic')
const { upload, body }=require('../../libs/body')
const CaptchaSDK = require('dx-captcha-sdk')
const Qs = require('qs')
const fs = require('fs')
const sendCheck=require('../../libs/sendCheck')
const makeToken=require('../../libs/maketoken')
const makeRandom=require('../../libs/makerandom')
const { getStat, doUnlink, doMkdir }=require('../../libs/fs')
const {UPLOAD, SYSTEM}=require('../../config')

let router=new Router()

// {
//   ok: true, data: [],{}
// }
// {
//   ok: false, msg: '参数有误/数据不存在'
// }

router.use(async (ctx,next)=>{
  try{
    await next()

    if(ctx.body!==undefined){
      ctx.status=200
      ctx.body={ok: true, data: ctx.body}
    }else{
      ctx.status=404
      ctx.body={ok: false, msg: 'data not found:/api/meta.js'}
    }
  }catch(e){
    console.log(e)
    // ctx.body={ok: false, msg: e.message}
    ctx.status=500
    ctx.body={ok: false, msg: 'server error'}
  }
})

router.get('/wechat-mp/',async ctx=>{
  ctx.body= {
    login: true,
    user_info: {}
  }
})






// 登录	POST /api/you/login
// ajax+跨域，cookie只能自己处理，浏览器不会帮你
router.post('/login/', async ctx=>{
  console.log("===========================post==============================")
  // console.log("ctx.request.query==> :",ctx.request.query)
  let result = {},
      humanCheck = false,
      tok = ctx.cookies.get('checkNum',{
        // httpOnly: false,
        // signed: false,
        maxAge:10*60*1000
      })
      console.log("cnt==>tok:",tok)
  let resCheck = ctx.session['checkNum']
      console.log("ctx.session.tok==>", resCheck )
  
  let reqData = Qs.parse(ctx.request.query.data).data
      reqData = JSON.parse(reqData)
  let  checkNum = reqData.captch,
       tel = reqData.tel
 
  console.log("reqData:",reqData)
  console.log("checkNum:",checkNum)

  // 验证图片
  let kw = ctx.cookies.get('_dx_uzZo5y',{
    // httpOnly: false,
    // signed: false,
    maxAge:10*60*1000
  })
  const sdk = new CaptchaSDK('da7fbbcecea237308fae9e331c9351dd', '043feb6b2e934505eb4b25aa7fbef885')
  sdk.setCaptchaUrl('http://39.149.1.41')
  await sdk.verifyToken(kw,1*1000).then(() => {
    console.log('验证成功,this=>',this)
    humanCheck = true
  }).catch(err => {
    console.log('验证失败')
  }) 
  if(humanCheck){
    // 验证验证码
    console.log("humanCheck:",humanCheck)
    if(resCheck && checkNum == resCheck){
      // 生成用户数据--最好用存储过程
      let usrData = 'abcd'
      // 设置cookie，session,删除tok
      ctx.session['sess'] = usrData
      delete ctx.session['checkNum']
      // 返回成功
      result = {
        result:true,
        data: '登录成功'
      }
    }else{
      result = {result:false,errorText:'登录失败,验证码无效'}
    }
  }else{
    result = {result:false,errorText:'登录失败,您是人吗'}
  }

  ctx.body={
    ...result
  };
})



module.exports=router.routes()
