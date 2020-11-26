(async ()=>{
  //banner
  {
    let {ok, data}=await $.ajax({
      url: '/api/banner',
      dataType: 'json'
    });

    if(ok){
      console.log("banner data ok")
      data.forEach(banner=>{
        $(`
        <li>
          <img src="/upload/${banner.image}" alt="">
          <div class="caption">
            <h1>${banner.title}</h1>
            <span>${banner.sub_title}</span>
          </div>
        </li>`).appendTo('ul.rslides');

        $('ul.rslides li:eq(0)').css({
          opacity:1,
          display:'block'
        });
      });

      //上一张、下一张
      let now=0;
      $('.slider .prev').click(function (){
        now--;
        if(now==-1){
          now=data.length-1;
        }

        $('ul.rslides li').stop().animate({opacity: 0})
        .eq(now).stop().animate({opacity: 1});
      });
      $('.slider .next').click(function (){
        now++;
        if(now==data.length){
          now=0;
        }

        $('ul.rslides li').stop().animate({opacity: 0})
        .eq(now).stop().animate({opacity: 1});
      });
    }else{
      console.log("banner data error")
    }
  }

  //精选
  {
    let {ok, data}=await $.ajax({
      url: '/api/chosencar',
      dataType: 'json'
    });

    if(ok){
      $('#chosen').html('');

      for(let i=0;i<data.length/2;i++){
        let arr=data.slice(i*2, i*2+2);

        $(`
        <div class="col-1-3">
          <div class="wrap-col"></div>
        </div>
        `).appendTo('#chosen');

        arr.forEach(car=>{
         
          console.log(car.image.trim(),1);
          $(`
            <div class="item t-center">
              <div class="item-container">
                <a href="/single/${car.ID}" alt=''>
                  <div class="item-caption">
                    <div class="item-caption-inner">
                      <div class="item-caption-inner1">
                        <span>${car.time} / ${car.mileage} / ${car.dispalce} / ${car.transmission} /  ${car.type}</span>
                      </div>
                    </div>
                  </div>
                  <img src="/upload/${car.image}" />
                </a>
              </div>
              <div class="item-info">
                <a href="/single/${car.ID}"><h3>${car.title}</h3></a>
                <p>${car.mileage} ￥${(car.price/10000).toFixed(1)}万</p>
              </div>
            </div>
          `).appendTo('#chosen .wrap-col:last');
        });
      }


    }
  }

  //列表
  {
    let page=2;
    await getPage(1);

    //更多
    $('#more-btn').click(async function (){
      await getPage(page);

      page++;
    });

    async function getPage(page){
      let {ok, data}=await $.ajax({
        url: `/api/carlist/${page}`,
        dataType: 'json',
      });

      if(ok){
        if(data.length==0){
          $('#more-btn').remove();
        }
        data.forEach(car=>{
          $(`
            <div class="row">
              <div class="item">
                <div class="col-1-3">
                  <div class="item-container">
                    <a href="/single/${car.ID}">
                      <div class="item-caption">
                        <div class="item-caption-inner">
                          <div class="item-caption-inner1">
                            <span>${car.time} / ${car.mileage} / ${car.dispalce} / ${car.transmission} /  ${car.type}</span>
                          </div>
                        </div>
                      </div>
                      <img src="/upload/${car.image}" />
                    </a>
                  </div>
                </div>
                <div class="col-2-3">
                  <div class="wrap-col">
                    <div class="item-info">
                      <a href="/single/${car.ID}"><h3>${car.title}</h3></a>
                      <p>${car.mileage} ￥${(car.price/10000).toFixed(1)}万</p>
                      <p>${car.description}</p>
                    </div>
                  </div>
                </div>
                <div class="clear"></div>
              </div>
            </div>
          `).insertBefore('#more-btn');
        });
      }
    }
  }

  //最新上架
  {
    let {ok, data}=await $.ajax({
      url: '/api/latestcar',
      dataType: 'json'
    });

    if(ok){
      data.forEach(car=>{
        $(`
          <div class="post">
            <a href="/single/${car.ID}"><img src="/upload/${car.image}"/></a>
            <div class="wrapper">
              <h5><a href="/single/${car.ID}">${car.title}</a></h5>
               <span>${(car.price/10000).toFixed(1)}万</span>
            </div>
          </div>
        `).appendTo('#posts');
      });
    }
  }
})();
