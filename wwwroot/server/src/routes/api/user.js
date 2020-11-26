import KoaRouter from 'koa-router'
import controllers from '../../controllers'

const router = new KoaRouter()

// 请求接口校验中间件
const userLogin = controllers.common.checkIsUserLogin;
const checkfn = controllers.common.checkRequestUrl;

/*---------------------------------------用户 相关---------------------------------------------*/
// 获得左侧列表
router.post('/getUserList', checkfn, controllers.user.getUserList)

// 新增｜修改 用户
router.post('/editUser', checkfn, controllers.user.editUser)

// 用户登录
// router.post('/userLogin', userLogin, controllers.user.userLogin)
router.post('/userLogin', controllers.user.userLogin)
// 修改密码
router.post('r/updatePassword', checkfn, controllers.user.updatePassword)


/*---------------------------------------用户关联项目---------------------------------------------*/
// 用户绑定的系统
router.post('/api/user/choseProject', checkfn, controllers.user.choseProject)


module.exports=router.routes();
