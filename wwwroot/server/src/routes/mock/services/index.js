import KoaRouter from 'koa-router'
const router = new KoaRouter()
// 判断环境不是 prod 或者 preview 是 true 时，加载 mock 服务
if (process.env.NODE_ENV !== 'production' || process.env.VUE_APP_PREVIEW === 'true') {

  router.use('', require('./article'));
  router.use('', require('./auth'));
  router.use('', require('./user'));
  router.use('', require('./manage'));
  router.use('', require('./other'));
  router.use('', require('./tagCloud'));
  module.exports = router.routes(); 
}
