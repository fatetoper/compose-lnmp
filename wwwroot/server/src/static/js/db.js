const assert = (expression,word)=>{
  if(!expression){
    throw new Error(word);
  }
}

// 可以使用不同的meta生成扁平json
const flatJson = function(data,meta){
 /*  const meta_nav ={
    db:'',
    table:'you_nav',
    fields:[
          ['id','name','bannerUrl','superCategoryId','frontName'],
          {'level':0,'race':'','type':'','index':''}
          ],
    maps:[
      [4,3,3,6,5,3,3,2],
      [3,6,7,7,4,4,6,5],
      [3,3,2,4,2,3,4,5],
      [2,3,4,3,4,2,5,4],
      [6,6,2,3,3,2,4,4],
      [4,4,5,2,5,2,3,3],
      [3,4,4,1,2,2,4,2],
      [4,3,3,2,2,5,6,10]
    ],
    // 指定传入数据中需要解析的字段名、数据类型、解析方法和参数映射（如何与解析方法内参数对应，类似bind）
    // 同level中，类型为对象/数组的键名必须是唯一的，name字段要有唯一性
    needResolve:[
      {name:"subCateList",level:0,type:'json/object',method:'',parentName:'parentName',params:{}},
    ],
    methods:{
    }
  } */
// 1. needRsolve解析过程 ==== 按level处理
// 
// 
// 2. 数据生成函数：fields处理     ====    有就加入，没有需要设定： {
//  level：在解析过程中调变量， race，type,index:由params或meta传, 或者在method里面产生
// }
  const tableCurId = async function(n){ 
    let id = await n+1;
    return id;
  }
  const levelMax =function(needResolve){
    let levelMax;
    let levels = new Set();  // 有哪些层级==>最大层级
    if(needResolve.length != 0){
      needResolve.map((n)=>{
        levels.add(n.level);
      });
      // levels = Array.from(levels).sort((a,b)=>a-b);  //升序数组
      levelMax = Math.max(...levels); // 最大层级
    }else{
      levelMax = 0;
    }
    return levelMax
  }
  const needResolveRebuild = (needResolve,levelMax)=>{
    let rebuild ={}
    for(let i=0;i<=levelMax;i++){
      rebuild[i]=[];
      needResolve.map((n)=>{
        if(n.level==i) rebuild[i].push(n);
      });
    }
    return rebuild;
  }
  const makeTypeObj = function(obj,level,superCategoryId,jsonName,maxLevel,options){
    level++;
    let needResolveCur ={};
    needResolve[level].map((n,index)=>{
      if(jsonName==n.name) needResolveCur=n;
    });
    // console.log(`needResolve[${level}]:`,needResolve[level]);
    //  console.log("needResolveCur:",needResolveCur);
    
    const needResolveFields = {...needResolveCur,...needResolveCur.params};
    // console.log("needResolveFields:",needResolveFields);
    let item = {};
    // console.log("needResolveFields:",needResolveFields);
    for(let j=0;j<fields[0].length;j++){
      
      // 向obj录入键值对
      let value = fields[0][j];
    
      if(obj[`${value}`] != undefined){
        item[`${value}`] = obj[`${value}`];
      }else if(needResolveFields[`${value}`] != undefined){
        item[`${value}`] = needResolveFields[`${value}`];
      }else{
        if(fields[2][`${value}`]=='number'){
          item[`${value}`] = 0;
        }else{
          item[`${value}`] = '';
        }
      }
    }
    if(!item.id){
      item.id = curID++;
    }
    if(!item.superCategoryId){
      item.superCategoryId = superCategoryId;
    }
    item ={...item,...needResolveFields.params};
    item.level = level;
    item.indexP=indexP;
    if(!item.tipName){
      item.tipName = jsonName;
    }
    // console.log("item:",item);
    flatedJson.push(item);
    if(level<maxLevel){
      needResolve[level+1].map(n=>{
        if(n.parent==jsonName){
          if(n.type=='json'){
            makeTypeJson(n.name,obj[n.name],level,item.id,maxLevel);
          }else if(n.type=='object'){
            makeTypeObj(obj[n.name],level,item.id,n.name,maxLevel);
          }
        }
      })
    }
  }


  const makeTypeJson = function(jsonName,data,level,superCategoryId,maxLevel,options){
    // console.log("jsonName:",jsonName);
    // console.log("data:",data);
    // console.log("level:",level);
    // console.log("superCategoryId:",superCategoryId);
    // console.log("options:",options);
    // console.log("fields[0]:",fields[0]);
    
    const curData = data;
    // console.log("curData:",curData);
    for(let i=0;i<curData.length;i++){
      makeTypeObj(curData[i],level,superCategoryId,jsonName,maxLevel);
    }
    
  }
// 递归解析
  const makeJson = function(data,needResolve,parentName,parentId,curLevel,maxLevel){
    const needResolveCur = needResolve[curLevel+1];
    for(let i=0;i<needResolveCur.length;i++){
      const type = needResolveCur[i].type;
      const curData = data[needResolveCur[i].name];
      // console.log("curData:",curData);
      // console.log(`needResolveCur[${i}]:`,needResolveCur[i]);
  
      if(type=='json'){
        // 
        makeTypeJson(needResolveCur[i].name,curData,curLevel,parentId,maxLevel,needResolveCur[i].params);
      }
      else if(type=='object'){
        makeTypeObj(data,curLevel,0,'',maxLevel);
      }else{
        throw new Error('Meta type error');
      }
    }
    
  }
/* ===========================流程开始================================== */
  const fields = meta.fields;
  let needResolve = meta.needResolve;
  let curID = 1 || tableCurId(1).then(rusult=>JSON.parse(rusult));// 查询最大值ID
  let flatedJson = []; // 最终输出
  const levels = levelMax(needResolve);
  let indexP = 0;
  // 给needResolve转化成按层级分类的结构（数组）
  needResolve = needResolveRebuild(needResolve,levels);
  // console.log("fields:",fields);
  // console.log("needResolve:",needResolve);
  // console.log("levels:",levels);
  // console.log("curID:",curID);
  
  if(data.length&&data.length!==0){  // 数组型json
     // 开始遍历转化json的每一项
    for(let i=0;i<data.length;i++){
      indexP = i;
      const curData = data[i];
      let level = 0;
      // 本层数据放到这里
      let obj ={};
      // 
      // console.log("fields[0]:",fields[0]);
      // console.log("curData:",curData);
      for(let j=0;j<fields[0].length;j++){
        // 向obj录入键值对
        let value = fields[0][j];
        // console.log(value,":",curData[`${value}`]);
        if(curData[`${value}`] != undefined){
          obj[`${value}`] = curData[`${value}`];
        }else{
          if(fields[2][`${value}`]=='number'){
            obj[`${value}`] = 0;
          }else{
            obj[`${value}`] = '';
          }
        }
      }
      // console.log("obj.id:",obj.id);
      if(!obj.hasOwnProperty('id')){
        obj.id = curID++;
      }
     
      
      // 最好验证一下 fields[1] 是否为obj
      obj = {...obj,...fields[1]}
      obj.indexP=indexP;
      flatedJson.push(obj);
    
      if(level<levels){
          makeJson(curData,needResolve,obj.name,obj.id,level,levels);
      } 
    }
    
  }else if(data.length==undefined){  // 对象型

  }else{
    return data;   //
  }
  // console.log("flatedJson:",flatedJson);
  return flatedJson;
}


const add=async (el,JSON_DATA,options,)=>{
// 接收json数据 和 数据库选项（元数据） options：{table：tablename，...}
// 将json 进行元化处理，并字符串化。
// 给目标元素添加点击事件，把json录入到数据库。
  //判断json是否合法(对象数组||对象)

  // json元化处理
  const metafy =async function(data,options,el){
    assert(typeof options.table=='string','there is no options.table')
    const metafier = (data,options)=>{
      let fields=options.fields;  //目前只是数组
      let table= options.table; 
      // console.log('metafier:data',data);
      let datas = {
        data,
        table
      }
      
      if(fields.length&& fields.length!=0){
        // console.log("fields:",fields)
        
        datas.fields = fields;
      }
      return datas;
    };

    console.log(options)
    // 判断是否有table表格及字段 
    let resp = await $.ajax({
      type:'post',
      url: '/api/db/test',
      contentType: "application/json",
      dataType : "json",
      data: JSON.stringify(options),
     
      processData: false,
      success:(data)=>{
        // console.log(data.result);
      }
    });
    
    // 没问题就开始转化
    console.log('数据库与数据匹配:',resp);
    if(resp.data.data =='ok'){
     return metafier(data,options);
    }else{
      throw new Error('Datebase is not suit data:', resp.data.data);
    }
  }
  // console.log(JSON_DATA);
  // 添加事件
  $(el).click(async function (){ 
    // 传FormData 和 传Json 的方法
    // Json
    // console.log("JSON_DATA:",JSON_DATA);
    let json=await metafy(JSON_DATA,options);
     console.log("json:",json);
    let res=await $.ajax({    
      type: 'POST',
      url: '/api/db/insert',
      contentType: "application/json",
      dataType : "json",
      data: JSON.stringify(json),
      processData: false,
      success:(data)=>{
        // console.log(data.result);
      }
    // FormData
    /*  let form=new FormData($('#form1')[0]);
      let {ok}=await $.ajax({
        url: '/api/db',
        method: 'post',
        data: form,
        processData: false,
        contentType: false
      }); */
    });
    console.log("insert res:",res);
    if(res.data=='okk'||res.data.data=='okk'){
      alert('留言成功，我们会尽快于您取得联系');
    }else{
      alert('留言提交失败，请稍后重试');
    }
  });
}

/* (async ()=>{
  console.log(JSON_DATA);
  $('.addDbButton').click(async function (){ 
    let form=new FormData($('#form1')[0]);

    let {ok}=await $.ajax({
      url: '/api/db',
      method: 'post',
      data: form,
      processData: false,
      contentType: false
    });

    if(ok){
      alert('留言成功，我们会尽快于您取得联系');
    }else{
      alert('留言提交失败，请稍后重试');
    }
  });
})(); */
