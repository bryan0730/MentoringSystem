//멘토 예약하기 버튼 클릭 
$('.add-btn-mento').bind('click', function () {
    $('#revise-btn').addClass('hidden');
    $('#remove-btn').addClass('hidden');
    $('#booking-btn').removeClass('hidden');
    veiwModalSchedule()
});

//예약화면 띄우기
function veiwModalSchedule(selected,id) {
    let timeItem = {"10:00":0, "11:00":1, "12:00":2, "1:00":3, "2:00":4, "3:00":5, "4:00":6, "5:00":7}
    $('#eventId').val(id);
    //선택한 날짜 받아오는 변수
    checkDayArr = $('.calendar-active').attr('data-date-val').split('/');

    //선택한 날짜 요일 받아오는 변수
    checkDay = new Date(checkDayArr[2] + '-' + checkDayArr[0] + '-' + checkDayArr[1]).getDay();
    todayLable = week[checkDay];
    // 오늘날짜 일정 불러오기
    $.ajax({
        url: "getMentoScheduleTime",
        type: "POST",
        data: {
            scheduleDate : $('.calendar-active').attr('data-date-val')
        },
        success: function (data) {
            data.forEach(element => {
                // 예약된 시간 선택 불가능 또는 표시 하기
                let st = element.scheduleTime.split(',');
                if(!selected){
                    for(let i = 0; i<st.length; i++){
                        $('.time-item')[timeItem[st[i]]].setAttribute('data-select-val','selected');
                    }
                }else{
                    for(let i = 0; i<st.length; i++){
                        $('.time-item')[timeItem[st[i]]].setAttribute('data-select-val','');
                    }
                }  
            });
        },
        error: function () {
            alert("error");
        },
    });
  
    //오늘 이후의 날짜만 예약 가능하게 하는 조건문
    if (checkDayArr[2] - year > 0 || (checkDayArr[2] - year == 0 && checkDayArr[0] - month > 0) || ((checkDayArr[2] - year) == 0 && (checkDayArr[0] - month) ==0 && (checkDayArr[1] - date) >= 0)){
        //모달 뷰를 띄워서 예약을 처리
        $('.calendar-date').children('.date').text(checkDayArr[0] + '.' + checkDayArr[1] + '(' + todayLable + ')')
            $('#modal-view').removeClass('hidden');
    }else{
        modalReset()
    }
}


// event 클릭시 처리
function reviseMentoEvent(id) {
    id = String(id);
    let findString = "mento_";
    let splitId = id.split(findString);
    let title = $('.event-container[data-event-index='+id+']').children('.event-info').children('.event-title').text().split('시간 : ');

    checkDayArr = $('.calendar-active').attr('data-date-val').split('/');

    //선택한 날짜 요일 받아오는 변수
    checkDay = new Date(checkDayArr[2] + '-' + checkDayArr[0] + '-' + checkDayArr[1]).getDay();
    todayLable = week[checkDay];

    if(id.indexOf(findString) != -1){      
        $('.booking-title').children('input').val(title[0]);
        $('#booking-btn').addClass('hidden');
        veiwModalSchedule(1,splitId[1])
    }else{
        let content = $('.event-container[data-event-index='+splitId[0]+']').children('.event-info').children('.event-desc').text();
        let way = $('.event-container[data-event-index='+splitId[0]+']').children('.event-info').children('.event-way').text();
        console.log(way);
        if(way == "상담방법: 온라인"){
            $('.calendar-time').addClass("hidden");
            $('.booking-title-mento').children('span').text('제목 : ' + title[0]);
            $('.booking-way-mento').children('span').text(way);
            $('.booking-content-mento').children('span').text("상담내용 : " +'\n'+ content);
            $('.calendar-date').children('.date').text(checkDayArr[0] + '.' + checkDayArr[1] + '(' + todayLable + ')');
            $('.answer-area').removeClass("hidden");
            $('#accept-btn').addClass("hidden");
            $('#reject-btn').addClass("hidden");
            $('#answer-btn').removeClass("hidden");
            $('#modal-view-mento').removeClass('hidden');
        }else{
            $('.calendar-time').removeClass("hidden");
            $('.time').text("시간 : " + title[1]);
            $('.booking-title-mento').children('span').text('제목 : ' + title[0]);
            $('.booking-way-mento').children('span').text(way);
            $('.booking-content-mento').children('span').text("상담내용 : " +'\n'+ content);
            $('.calendar-date').children('.date').text(checkDayArr[0] + '.' + checkDayArr[1] + '(' + todayLable + ')');
            $('.answer-area').addClass("hidden");
            $('#accept-btn').removeClass("hidden");
            $('#reject-btn').removeClass("hidden");
            $('#answer-btn').addClass("hidden");
            $('#modal-view-mento').removeClass('hidden');
        }  
    }   
}

// 수락버튼 클릭
$('#accept-btn').on('click', function(){
    let id = $('#eventId').val();
    setData("updateBooking",id,1);
    acceptBooking();
});

function acceptBooking() {
    let eventId = $('#eventId').val();
    let title =$('.event-name').children('span').text().split('이름: ')[1]+ "의 멘토링" 
    let date = $('.calendar-active').attr('data-date-val');
    let time = $('.event-container[data-event-index='+eventId+']').children('.event-info').children('.event-title').children('span').text().split("시간 : ")[1];
    let seq = $('#memberSeq').val();
    let form = {
            scheduleTitle: title,
            scheduleDate: date,
            scheduleTime: time,
            mentoSeq: seq,
    }
    // insertBooking controller에 통신 
    $.ajax({
        url: "insertSchedule",
        type: "POST",
        data: form,
        success: function () {
            modalReset();
            alert("상담을 수락하였습니다.");                
        },
        error: function () {
            alert("error");
        },
        complete: function (){
            location.reload();
        }
    });
}
            
    