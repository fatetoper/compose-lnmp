let makeRandom =(length)=>{
  let res=[];
  while(res.length<length){
    res.push(
      Math.floor(Math.random()*10)
    )
  }
  return res.join('')
}

module.exports=makeRandom