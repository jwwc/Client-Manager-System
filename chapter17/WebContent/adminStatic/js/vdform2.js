 
(function ($){
	var xOffset = 0; // x 偏移像素
    var yOffset = 5; // y 偏移像素 
	var common ={
		trim : function(str){ //去除空格
			return str.replace(/(^\s*)|(\s*$)/g, "");
		},
		strlen : function (str){ //获取字符长度
			var Charset = jQuery.browser.msie ?document.charset : document.characterSet
			if(Charset.toLowerCase() == 'utf-8'){
				return str.replace(/[\u4e00-\u9fa5]/g, "***").length;
			} else {
				return str.replace(/[^\x00-\xff]/g, "**").length;
			}
		}
	};
	
	var ready = {
		getPath : function(){
			var js = document.scripts || L("script");
			var jsPath = js[js.length - 1].src;
			var jsAllPath=jsPath.replace(jsPath.split('/')[jsPath.split('/').length-1],'');
			if(jsAllPath.indexOf("/js/")){
				return jsAllPath.substring(0,jsAllPath.lastIndexOf("/") -2);
			}else{
				return  jsAllPath;
			}
		},
		append : function(){
//			var ie6PNG = '<script type="text/javascript" src="'+ this.getPath() +'css/png.js"></script>';
//			document.write('\n' + '<link rel="stylesheet" type="text/css" href="'+ this.getPath() +'css/skin.css"  />' + '\n' + ie6PNG);
            document.write('\n' + '<link rel="stylesheet" type="text/css" href="'+ this.getPath() +'css/skin.css"  />' + '\n');

			this.global();
		},
		global : function(){
			iE6 = !-[1,] && !window.XMLHttpRequest;
			times = 0; //追寻索引
		}
	};
	ready.append();


	validator={
        //yyyy-MM-dd
		valiData:"([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8])))",
        //yyyy-MM-dd HH:mm:ss
        valiDatatime:"",
		dataTypes:"",
		validType:"",
		showTipCss :"",
		SohwType : '1',
		ErrorInput:'validato_input',
		Require :  /[^(^\s*)|(\s*$)]/,
	    Email : /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/,
		Phone : /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/,
		//Mobile : /^((\(\d{3}\))|(\d{3}\-))?13[0-9]\d{8}?$|15[89]\d{8}?$/,
        //Mobile:/^[1][3-8]\\d{9}$/
        Mobile:/^0?(13[0-9]|15[012356789]|18[0123456789]|14[57])[0-9]{8}$/,
		Tel: /^(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$/,
	    Call:/^(^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)|(^(1[358]\d{9})$)/,
	    Url : /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/,
	    IdCard : "this.isIdCard(value)",
	    Currency : /^\d+(\.\d+)?$/,
	    Number : /^\d+$/,
	    Zip : /^[1-9]\d{5}$/,
	    QQ : /^[1-9]\d{4,8}$/,
		IP  : /^[\d\.]{7,15}$/,
		Integer : /^[-\+]?\d+$/,
	    ZInteger: /^[+]?\d+$/,
	    Double : /^[-\+]?\d+(\.\d+)?$/,
        Money : /^[-\+]?\d+(\.\d{0,2})?$/,
        PositiveMoney : /^\+?\d+(\.\d{0,2})?$/,
	    ZDouble: /^[+]?\d+(\.\d+)?$/,
	    English : /^[A-Za-z]+$/,
	    Chinese :  /^[\u0391-\uFFE5]{2,6}$/,
	    Username : /^[a-z]\w{3,}$/i,
	    UnSafe : /^(([A-Z]*|[a-z]*|\d*|[-_\~!@#\$%\^&\*\.\(\)\[\]\{\}<>\?\\\/\'\"]*)|.{0,5})$|\s/,
	    IsSafe : function(str){return !this.UnSafe.test(str);},
	    SafeString : "this.IsSafe(value)",
	    Filter : "this.doFilter(value)",
	    Limit : "this.checkLimit(common.strlen(value))",
	    LimitB : "this.checkLimit(this.LenB(value))",
	    Date : "this.isDate(value)",
	    Repeat : "this.checkRepeat(value)",
	    Range : "this.checkRange(value)",
	    Compare : "this.checkCompare(value)",
	    Custom : "this.Exec(value)",
	    Group : "this.mustChecked()",
		Ajax: "this.doajax(errindex)",
        Select:/^[-1]{1}$/,
        Nickname:/^[\u4E00-\u9FA5\w\d]+$/,//字母、数字、下划线、汉字
        ChineseNumEnglish:/^[a-zA-Z0-9\u4e00-\u9fa5]+$/,

		isIdCard : function(number){//身份证号校验
		var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",
		34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",
		52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"};
		var idcard, Y, JYM;
		var S, M;
		var idcard_array = new Array();
		idcard_array = number.split("");
		//地区检验
		if (area[parseInt(number.substr(0, 2))] == null) return false;
		//身份号码位数及格式检验
		switch (number.length) {
		case 15:
			if ((parseInt(number.substr(6, 2)) + 1900) % 4 == 0 || ((parseInt(number.substr(6, 2)) + 1900) % 100 == 0
				&& (parseInt(number.substr(6, 2)) + 1900) % 4 == 0)) {
				//测试出生日期的合法性
				ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;				
			} else {
				//测试出生日期的合法性
				ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/; 
			}
			if (ereg.test(number)) {
				return true;
			} else{
				return false;
			}
			break;
		case 18:
			/*18位身份号码检测
			出生日期的合法性检查
			闰年月:
			((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))
			平年月日:
			((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))*/
			if (parseInt(number.substr(6, 4)) % 4 == 0 || (parseInt(number.substr(6, 4)) % 100 == 0 
				&& parseInt(number.substr(6, 4)) % 4 == 0)) {
				//闰年出生日期的合法性正则表达式
				ereg = /^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/; 
			} else {
				//平年出生日期的合法性正则表达式
				ereg = /^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/; 
			}
			//测试出生日期的合法性
			if (ereg.test(number)) { 
				//计算校验位
				S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7 + (parseInt(idcard_array[1])
				  + parseInt(  idcard_array[11])) * 9 + (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10 
				  + (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5 + (parseInt(idcard_array[4]) 
				  + parseInt(idcard_array[14])) * 8 + (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4 
				  + (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2 + parseInt(idcard_array[7]) * 1 
				  + parseInt(idcard_array[8]) * 6 + parseInt(idcard_array[9]) * 3;
				Y = S % 11;
				M = "F";
				JYM = "10X98765432";
				M = JYM.substr(Y, 1); //判断校验位
				if (M == idcard_array[17]) return true; //检测ID的校验位
				else return false;	
			} else return false;
			break;
			default:
				return false;
			break;
		 }
		},//end isIdCard
	
		isDate : function(op){
			var formatString=this['dataTypes'].format;
			formatString = formatString || "ymd";
			var m, year, month, day;
			switch(formatString){
			case "ymd" :
				m = op.match(new RegExp("^((\\d{4})|(\\d{2}))([-./])(\\d{1,2})\\4(\\d{1,2})$"));
				if(m == null ) return false;
				day = m[6];
				month = m[5]*1;
				year = (m[2].length == 4) ? m[2] : GetFullYear(parseInt(m[3], 10));
			break;
			case "dmy" :
				m = op.match(new RegExp("^(\\d{1,2})([-./])(\\d{1,2})\\2((\\d{4})|(\\d{2}))$"));
				if(m == null ) return false;
				day = m[1];
				month = m[3]*1;
				year = (m[5].length == 4) ? m[5] : GetFullYear(parseInt(m[6], 10));
			break;
			default :
				break;
			}
			if(!parseInt(month)) return false;
			month = month==0 ?12:month;
			var date = new Date(year, month-1, day);
			return (typeof(date) == "object" && year == date.getFullYear() && month == (date.getMonth()+1) && day == date.getDate());
			function GetFullYear(y){
				return ((y<30 ? "20" : "19") + y)|0;
			}
		}, //end isDate
		
		doFilter : function(value){
			var filter=this['dataTypes'].accept;
			return new RegExp("^.+\.(?=EXT)(EXT)$".replace(/EXT/g,filter.split(/\s*,\s*/).join("|")),"gi").test(value);
		},//end doFilter
	
		checkLimit:function(len){
			var minval=this['dataTypes'].min || Number.MIN_VALUE;
			var maxval=this['dataTypes'].max || Number.MIN_VALUE;
			return (minval<= len && len<=maxval);
	
		},//end checkLimit
	
		LenB : function(str){
			return str.replace(/[^\x00-\xff]/g,"**").length;
		},//end LenB
	
		checkRepeat:function(value){
            var to=this['dataTypes'].to;
            var toval=jQuery('input[name="'+to+'"]').eq(0).val();
            if((toval!= "undefined" || toval!= "")&&(value!="undefined" && value!="")){
                var element = this['element'];
                var str_errmsg=this['dataTypes'].msg; //获取提示信息
                var errindex = this['errindex'];
                if(value==toval){
                    str_errmsg="";
                }
                validator.showTipMsg(element,str_errmsg,errindex,value==toval);
                return value==toval;
            }else if((toval== "undefined" || toval== "")&&(value=="")){
                return false;
            }
		},//end checkRepeat
	
		checkRange : function(value){
			value = value|0;
			var minval=this['dataTypes'].min || Number.MIN_VALUE;
			var maxval=this['dataTypes'].max || Number.MAX_VALUE;
			return (minval<=value && value<=maxval);
		},//end checkRange
	
		checkCompare : function(value){
			var compare=this['dataTypes'].compare;
			if(isNaN(value)) return false;
			value = parseInt(value);
			return eval(value+compare);
		},//end checkCompare
	
		Exec : function(value){
			var reg =this['dataTypes'].regexp;
			return new RegExp(reg,"gi").test(value);
		},//end Exec
	
		mustChecked : function(){
			var tagName=this['element'].attr('name');
			var f=this['element'].parents('form');
			var v=f.find('input[name="'+tagName+'"]');
			var n=f.find('input[name="'+tagName+'"]:checked').length;
			var count = f.find('input[name="'+tagName+'"]').length;
			var minval=this['dataTypes'].min || 1;
			var maxval=this['dataTypes'].max || count;
			return (minval<=n && n<=maxval);
		},//end mustChecked
		
		doajax : function(value) {
			var element = this['element'];
			var errindex = this['errindex'];
			var val = element.val(); //获取元素的值
			var url=this['dataTypes'].url;
			var str_errmsg=this['dataTypes'].msg; //获取提示信息
			var arr_errmsg ; //错误信息数组
			var errmsg ;     //错误信息
			arr_errmsg= str_errmsg.split('|') ;
			errmsg = arr_errmsg[errindex] ;
			var type=this['element'].attr('type');  //获取元素类型
			var Charset =  /msie/.test(navigator.userAgent.toLowerCase()) ? document.charset : document.characterSet;
			var methodtype = (Charset.toLowerCase() == 'utf-8') ? 'post' : 'get';
			var method=this['dataTypes'].method || methodtype;
            var name = this['element'].attr('pName');
            if(name == null || name == "" || name == undefined) {
                name = this['element'].attr('name');
            }
			if(url=="" || url==undefined) {
				 var msg='请设定url的值';
				 return  validator.showTipMsgByAjax(element,msg,false);
			}
//			if(url.indexOf('?')>-1){
//		 		 url = url+"&"+name+"="+encodeURI(val);
//
//			} else {
//				 url = url+'?'+name+"="+encodeURI(val);
//			}
            var data = "{"+name+":'"+val+"'}";
            data = eval("(" + data + ")");
            var flag =false;
			var s = $.ajax({
				type: method,
				url: url,
                data:data,
				//cache: false,
				async: false,
				success: function(data){
//					data = data.replace(/(^\s*)|(\s*$)/g, "");
					   if(data.info != 'success'){
						  errmsg = errmsg=="" ? data.info : errmsg;
                          flag =false
						  return  validator.showTipMsgByAjax(element,errmsg,false);
					   }else{
                           flag =true;
						    return  validator.showTipMsgByAjax(element,"",true);
					   }
				   }
			 }).responseText;
			 s = s.replace(/(^\s*)|(\s*$)/g, "");
             //alert('success' ? true : false) ;
			// return s == 'success' ? true : false;
            return flag;
		}//end doajaxs
	};
	
	/*ajax信息显示*/
	validator.showTipMsgByAjax=function (element,msg,isSuccess){
		var  offset=element.offset();
		var top=xOffset;
		var left=element.width()+40;
        var validator_msg_ico;
        var validator_msg_color;
        if(isSuccess){
			element.removeClass(this['ErrorInput']);
			validator_msg_ico="tip-success-ico";
            validator_msg_color="tip-success-text";
		}else {
			element.addClass(this['ErrorInput']);
			validator_msg_ico="tip-error-ico";
            validator_msg_color="tip-error-text";
		}
		var mytip= jQuery( '<div class="validator_msg_tip"><div class="'+validator_msg_ico+'"></div>'+
								   	'<div class="validator_tip_msg_content"><span class="'+validator_msg_color+'">'+msg+
            '</span></div></div>');
		mytip.css("top", top+"px").css("left", left+"px");
		mytip.insertAfter(element); 
		return isSuccess ;
	}
	
	
	
	/*显示信息*/
	validator.showTipMsg=function (element,msg,errindex,isSuccess){
		var str_tipmsg=typeof(msg) == "undefined" ? 'unkonwn': msg;
		var arr_tipmsg = str_tipmsg.split('|');
		var tipmsg = arr_tipmsg[errindex] ? arr_tipmsg[errindex]: arr_tipmsg[0];
		var  offset=element.offset();
		var top=xOffset;
		var left=element.width()+40;
		var validator_msg_ico;
		var validator_msg_color;		
		validator.removeTipMsg(element); //移除错误信息
		if(isSuccess){
			element.removeClass(this['ErrorInput']);
			tipmsg="";
			validator_msg_ico="tip-success-ico";
			validator_msg_color="tip-success-text";
		}else {
			element.addClass(this['ErrorInput']);
			validator_msg_ico="tip-error-ico";
			validator_msg_color="tip-error-text";
		}
		var mytip= jQuery( '<div class="validator_msg_tip"><div class="'+validator_msg_ico+'"></div>'+
								   	'<div class="validator_tip_msg_content"><span class="'+validator_msg_color+'">'+tipmsg+
									'</span></div></div>');
				mytip.css("top", top+"px").css("left", left+"px");
				mytip.insertAfter(element); 
		return isSuccess ;
	}


	
	/*移除提示信息*/
	validator.removeTipMsg =  function(element){
		element.removeClass(this['ErrorInput']);
		element.parent('*').find('.validator_msg_tip').remove();
	}
	
	

	
	/*检测校验类型*/
	validator.checkDataType = function(element,datatype){
		var value=jQuery.trim(element.val());
		this['element'] = element;
		switch(datatype){
			 case "IdCard" :
			 case "Date" :
			 case "Repeat" :
			 case "Range" :
			 case "Compare" :
			 case "Custom" :
			 case "Group" : 
			 case "Limit" :
			 case "LimitB" :
			 case "SafeString" :
			 case "Filter" :
			 	return eval(this[datatype]);
			 break;
	
			 default:
			 	return this[datatype].test(value);
			 break;
		}
	}
	
	/*ajax 校验*/
	validator.checkajax = function(element, datatype, errindex) {
		var value=jQuery.trim(element.val());
		this['element'] = element;
		this['errindex'] = errindex;
		validator.removeTipMsg(element);
		return eval(this[datatype]);
	}
	
	/*重复判断的单独提示*/
	validator.checkrepeat = function(element, datatype, errindex) {
		var value=jQuery.trim(element.val());
		this['element'] = element;
		this['errindex'] = errindex;
		validator.removeTipMsg(element);
		return (eval(this[datatype]));
	}

	/*校验方法*/
	validator.check=function(obj){
		var isValid;
		this['valiData'] = $.trim(obj.attr('validata-options'));
		this['dataTypes']=eval("({"+this['valiData']+"})");
		var dataTypes=this['dataTypes'];
		var value = $.trim(obj.val()); 
		validator.removeTipMsg(obj); //移除错误信息
		
		//默认required为true
		if(typeof(dataTypes.required) == "undefined"){
			dataTypes.required=true;
		}
		
		//如果requierd为fales并且没有值则不做校验
		if(!dataTypes.required && value=="") return true;
	
		var validType = dataTypes.validType.split('|');
		
		//遍历validType
		jQuery.each(validType,function(index,type){
			if(typeof(validator[type]) == "undefined") {
				return  isValid = false;
			}
            if(typeof(validator[type]) == "-1"){
                return isValid = false;
            }
			//ajax 校验
			if(type=='Ajax') {
				return isValid = validator.checkajax(obj, type,index);
			}
            if(type=='Repeat'){
                return isValid= validator.checkrepeat(obj, type,index);

            }
			if(validator.checkDataType(obj,type)==false){ 
				//校验失败
				validator.showTipMsg(obj,dataTypes.msg,index,false);
				return isValid=false;
			} else { 
				// 校验成功
				validator.showTipMsg(obj,dataTypes.msg,index,true);		
				return isValid=true;
			}
		});
		return isValid;
	}
	function CLASS(options){
		this.init(options)
	};

    $.fn.clearTips = function(){
        var form=jQuery(this);
        var elements = form.find(':input[validata-options]');
        validator.removeTipMsg(elements);
    }
    $.fn.unBindCheck = function(){
        var form=jQuery(this);
        var elements = form.find(':input[validata-options]');
        elements.unbind();
    }
	/*校验表单方法*/
	$.fn.checkForm = function(showType) {
		var form=jQuery(this);
		var elements = form.find(':input[validata-options]');
		//按下键盘
//		elements.keyup(function(index){
//			return validator.check(jQuery(this));
//		});
		//失去焦点时验证
		elements.blur(function(index){
			return validator.check(jQuery(this));
		});

		//内容改变时验证
		elements.change(function(index){
			return validator.check(jQuery(this));
		})

		
		//当form表单提交的时候验证
		form.submit(function(){
			var isValid = true;
			var errIndex= new Array();
			var n=0;
			elements.each(function(i){
				//校验是否失败
				if(validator.check(jQuery(this))==false){
					isValid  = false;
					errIndex[n++]=i;
				};
			});

			//如果校验返回失败焦点与提示信息
			if(isValid==false){
                elements.eq(errIndex[0]).focus().select();
				return false;
			}
			showMask();
			return true;
		});

    }
    $.fn.validSingleForm = function(showType) {
        var form=jQuery(this);
        var elements = form.find(':input[validata-options]');

        //按下键盘
//        elements.keyup(function(index){
//            return validator.check(jQuery(this));
//        });

        //失去焦点时验证
        elements.blur(function(index){
            return validator.check(jQuery(this));
        });

        //内容改变时验证
        elements.change(function(index){
            return validator.check(jQuery(this));
        })
    }
    $.fn.validBtnForm = function(showType) {
        var form=jQuery(this);
        var elements = form.find(':input[validata-options]');
        //当form表单提交的时候验证
        var isValid = true;
        var errIndex= new Array();
        var n=0;
        elements.each(function(i){
            //校验是否失败
            if(validator.check(jQuery(this))==false){
                isValid  = false;
                errIndex[n++]=i;
            };
        });
        //如果校验返回失败焦点与提示信息
        if(isValid==false){
            elements.eq(errIndex[0]).focus().select();
            return false;
        }
        return true;
    }
})(jQuery);

function checkObj(obj){
    //var isValid = true;
    var flag=false;//
    $(obj).each(function(){
        flag = validator.check(jQuery(this));
    });
    return flag;
}


/**
 * 校验图片扩展名
 *
 * @param filepath
 */
function validateImgFun(filepath){
    var extStart=filepath.lastIndexOf(".");
    var ext=filepath.substring(extStart,filepath.length).toUpperCase();
    if(ext!=".BMP"&&ext!=".PNG"&&ext!=".JPG"&&ext!=".JPEG"){
        return false;
    }

    return true;
}
/**
 * 校验扩展名和大小不能超过2兆
 * @param objID
 * @returns {boolean}
 */
function validateImgAllFun(objID){
    if(!validateImgFun($("#"+objID).val())){
        createErrorInfo(objID,"请上传图片（限于bmp,png,jpeg,jpg且小于2M）");
        $("#"+objID).focus();
        return false;
    }

    if(document.getElementById(objID).files && document.getElementById(objID).files.length>0){
        if(document.getElementById(objID).files[0].size>2000000){
            createErrorInfo(objID,"请上传图片（限于bmp,png,jpeg,jpg且小于2M）");
            $("#"+objID).focus();
            return false;
        }
    }

    return true;
}

function createErrorInfo(previousItemID,msg){
    var errorSpan = '<span id="'+previousItemID+'.errors" class="red validator_wx_tip" style="color:red">'+msg+'</span>';
    $("#"+previousItemID).after(errorSpan);
}