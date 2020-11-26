import KoaRouter from 'koa-router'


const router = new KoaRouter()


// router.use('/project', require('./project'));
// router.use('/catalog', require('./catalog'));
// router.use('/api', require('./api'));
// router.use('/common', require('./common'));
// router.use('/user', require('./user'));
router.use('/workplace', require('./workplace'));
router.use('/document', require('./document'));
// router.use('/temp', require('./temp'));
module.exports = router.routes();