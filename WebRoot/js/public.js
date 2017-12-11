//顶部导航课程移入移出效果
/*初始时默认情况第一个课程加焦点的效果*/
$('.menunav').first().children('.listmenu').addClass('listactive');
    $('.topmenu').attr('data-onoff','false'); //自定义添加开关 默认隐藏为false
	$('#mymenu').on('mouseover',function(){
		$(this).children('#menu-kc').css('color','#d21313');
		$('.topmenu').attr('data-onoff','true');//改变开关
        $(this).children('.topmenu').show();    //让菜单显示
        
//      console.log('移入');
        menu();                                 //鼠标移入展开的菜单时    调用菜单移入移出效果
	});
	$('#mymenu').on('mouseout',function(e){     //当鼠标移出课程元素 没有移入显示的菜单时的事件
//      console.log('移出');
        $(this).children('#menu-kc').css('color','#fff');
        if($('.topmenu').attr('data-onoff') == 'true'){  //判断如果菜单开关是 true展开时
        	if(e.target.class != 'topmenu'){             //判断菜单 没有移入效果时  菜单隐藏 开关为false
        		$(this).children('.topmenu').hide();       
        		$(this).children('.topmenu').attr('data-onoff','false');
        		$('.menunav').first().children('.listmenu').addClass('listactive');
        	}
        }
	});
	//鼠标从菜单移出时 隐藏 开关为false
	$('.topmenu').on('mouseout',function(){
//      console.log('移出');
        $(this).hide();
        $(this).attr('data-onoff','false');
    
	});
	//菜单展示里面内容的 移入移出效果
	function menu(){
		$('.menunav').each(function(){
			$(this).on('mouseover',function(){
				$('.menunav').first().children('.listmenu').removeClass('listactive');
				$(this).children('h5').addClass('menuactive');
			        $(this).children('.listmenu').addClass('listactive');
                                $(this).children('h5').children('a').children('span').css('margin-left','11px');

			        $(this).children('h5').children('a').children('span').css('background-position-x','-22px');

                                $(this).children('h5').children('a').children('span').css('-webkit-background-position-x','-22px');

                                $(this).children('h5').children('a').children('span').css('-ms-background-position-x','-22px');
			});
			$(this).on('mouseout',function(){
				$(this).children('h5').removeClass('menuactive');
			        $(this).children('.listmenu').removeClass('listactive');
			        $('.menunav').first().children('.listmenu').addClass('listactive');
                                $(this).children('h5').children('a').children('span').css('margin-left','14px');

			        $(this).children('h5').children('a').children('span').css('background-position-x','0px');

                                $(this).children('h5').children('a').children('span').css('-webkit-background-position-x','0px');

                                $(this).children('h5').children('a').children('span').css('-ms-background-position-x','0px');
			});
		});
	}



