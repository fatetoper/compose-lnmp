import KoaRouter from 'koa-router'
import controllers from '../../controllers'

const router = new KoaRouter()

// 请求接口校验中间件
const checkfn = controllers.common.checkRequestUrl;


/*---------------------------------------项目相关---------------------------------------------*/

// 获得用户项目列表
router.post('/getProjectList', checkfn, controllers.project.getProjectList)

// 获得所有项目列表
router.post('/getAllProject', checkfn, controllers.project.getAllProject)

// 新增|修改 项目
router.post('/editProject', checkfn, controllers.project.editProject)

// 项目详情
router.post('/getProjectDetail', checkfn, controllers.project.getProjectDetail)

module.exports=router.routes();
