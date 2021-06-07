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

//학생 예약현황
function viewBooking(params) {
    $('#modal-view-mento').removeClass('hidden');

}

function reviseMentoEvent(id) {
    id = String(id);
    let findString = "mento_";
    let title = $('.event-container[data-event-index='+id+']').children('.event-info').children('.event-title').text().split('시간 : ')[0];
    if(id.indexOf(findString) != -1){
        let splitId = id.split(findString);
        $('.booking-title').children('input').val(title);
        $('#booking-btn').addClass('hidden');
        veiwModalSchedule(1,splitId[1])
    }else{
        $('.booking-title').children('span').text(title);
        veiwModal(); 
    }

    
    // id.split("mento_");
    // if(id[1]){
    //     console.log(id[1]);
    // }else{
    //     console.log(id);
    // }
}
            
    