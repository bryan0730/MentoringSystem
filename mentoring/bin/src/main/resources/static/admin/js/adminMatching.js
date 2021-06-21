/**
 * 
 */

 var mentiSeq = document.getElementsByClassName("menti-on");

 // 멘토, 멘티 리스트를 클릭 이벤트 세팅
 $(document).on('click', 'div.mentoList ul li', function() {
     $('div.mentoList ul li').show()
     $('div.mentoList ul li').removeClass("mento-on");
     $(this).addClass("mento-on");
     $('.mento-on').hide();
   	 
     selectMento(this);
 })
 
 $(document).on('click', 'div.mentiList ul li', function() {
     if ($('.mentoInfo').text() == "") {
         alert("멘토를 먼저 선택해주세요!")
     } else {
         $(this).addClass('menti-on');
         $(this).hide();
         addMenti(this);
     }
 })
 
 
 
 // 멘토를 선택했을 때 실행되는 메소드
 // mentoInfo에 멘토가 들어가고 해당 멘토에 매칭된 멘티의 정보가
 // mentiInfo에 출력됨
 function selectMento(mento) {
 
 	console.log($('.mentiInfo ul li').hasClass('unmatched'));
     if ($('.mentiInfo ul li').hasClass('unmatched')) {
        alert("진행중인 매칭을 저장해주세요")
     } else {
      	$('div.mentoInfo span').remove();
     	$('div.mentiInfo ul li').remove();
        let addhtml = "<span>" + $(mento).text() + "</span>";
        let mentoSeq = $(mento).val();
        $('div.mentoInfo').append(addhtml);
        $.ajax({
            type:'GET',
            url : '/admin/selectMentiList',
            dataType : 'JSON',
            data : {"mentoSeq" : mentoSeq},
            success : function(data) {
                let size = data.length;
                for (let i = 0; i < size; i++) {
                    let addhtml = "<li id='matchedMenti" + data[i].memberSeq + "'>" + data[i].memberName 
                    + "<a href='#none' onclick='javascript:deleteMenti(" + data[i].memberSeq + "); return false;'>삭제</a>"
                    + "</li>"
                    $('div.mentiInfo ul').append(addhtml);
                }
                
            },
            error : function(jqXHR, textStatus, errorThrown) {
                console.log("error");
            }
        });
     }
     
 }
 
 // 멘티를 선택했을 때 mentiInfo에 들어가게 해주는 메소드
 function addMenti(menti) {
     let addhtml = "<li class='unmatched' id='" + $(menti).val() + "'>" + $(menti).text() 
     + "<a href='#none' onclick='javascript:cancelMenti(" + $(menti).val() + "); return false;'>취소</a>"
     + "</li>" 
     
     $('div.mentiInfo ul').append(addhtml);
 }
 
 // 선택된 멘티를 취소해서 다시 mentiList에 올리는 메소드
 // 매칭되지 않은 멘티가 선택된 경우 (삭제와는 다름)
 function cancelMenti(mentiSeq) {
     $("#" + mentiSeq).remove();
     $("#menti" + mentiSeq).show();
     $("#menti" + mentiSeq).removeClass();
 }
 
 // 이미 매칭된 멘티를 매칭삭제 시키는 메소드
 function deleteMenti(mentiSeq) {
     
     $.ajax({
         type : 'POST',
         url : '/admin/deleteMenti',
         data : {"mentiSeq" : mentiSeq},
         success : function(data) {
             let del = "#matchedMenti" + mentiSeq;
             let addhtml = "<li id = menti"+ mentiSeq  + " value=" + mentiSeq + ">" + $(del).contents().get(0).nodeValue + "</li>";
             $(del).remove();
             $('div.mentiList ul').append(addhtml);
             
         },
         error : function(jqXHR, textStatus, errorThrown) {
             console.log(textStatus);
         } 
     })
 }
 
 
 // 선택된 멘토와 멘티들을 매칭시켜주는 메소드
 function match(mentoSeq) {
     
     if ($('.mentiInfo').text() == "" || $('.mentoInfo').text() == "") {
         alert("멘토와 멘티를 매칭시켜주세요!")
     } else {
         let length = mentiSeq.length
         let mentiSeqList = new Array();
         
         for(let i =0; i< length; i++){
             var value = mentiSeq[i].getAttribute("value");
             mentiSeqList.push(value);
             
         }
         
         $.ajax({
             type:'POST',
             url : '/admin/matchingProc',
             data : {"mentoSeq" : mentoSeq,
                     "mentiSeq" : mentiSeqList},
             success : function(data) {
                 location.reload();
             },
             error : function(jqXHR, textStatus, errorThrown) {
                 console.log(textStatus);
             }
         });
     }
 }