import KoaRouter from 'koa-router'
import controllers from '../../controllers'

const router = new KoaRouter()

// 请求接口校验中间件
const checkfn = controllers.common.checkRequestUrl;



/*---------------------------------------API相关---------------------------------------------*/

// 获得接口nav列表
router.post('/apiNavPojectList', checkfn, controllers.api.apiNavPojectList)

// 编辑api详情
router.post('/editApiDetail', checkfn, controllers.api.editApiDetail)

// 获得api详情
router.post('/getApiDetails', checkfn, controllers.api.getApiDetails)

// 删除api
router.post('/deleteItemApi', checkfn, controllers.api.deleteItemApi)

// 搜索api
router.post('/searchApi', checkfn, controllers.api.searchApi)

/*---------------------------------------API相关---------------------------------------------*/

module.exports=router.routes();
