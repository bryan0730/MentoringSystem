// // month + "/" + date + "/" + year
let today = new Date();
let year = today.getFullYear(); // 년도
let month = today.getMonth() + 1;  // 월
let date = today.getDate();  // 날짜
let day = today.getDay();  // 요일
let checkDay;
let week = ['일', '월', '화', '수', '목', '금', '토'];
let checkDayArr;
// 회원 확인 변수
let memberSeq = $("#memberSeq").val()
let memberRole = $("#role").val()


//캘린더 뷰 띄우기
setBookingView(memberSeq,memberRole);

//예약하기 버튼 클릭
$('.add-btn').bind('click', function () {
    $('#revise-btn').addClass('hidden');
    $('#remove-btn').addClass('hidden');
    $('#booking-btn').removeClass('hidden');
    veiwModal()
});

// 예약버튼 클릭
$('#booking-btn').bind('click', function () {
    if(memberRole == "ROLE_MEMBER"){
        setData("insertBooking");
    }else{
        setDataMento("insertSchedule");
    }
    
});

// 수정버튼 클릭 
$('#revise-btn').on('click', function () {
    let id = $('#eventId').val();
    if(memberRole == "ROLE_MEMBER"){
        setData("updateBooking",id);
    }else{
        setDataMento("updateSchedule",id);
    }
});

//삭제버튼 클릭
$('#remove-btn').on('click', function(){
    let id = $('#eventId').val();
    setData("deleteBooking",id);
});

//취소버튼 클릭
$('.booking-cancle').bind('click',function(){
    modalReset()
});

// 시간 선택 
$('.time-item').bind('click', function (e) {
    if(memberRole == "ROLE_MEMBER"){
        if($(this).attr('data-select-val') != 'selected'){
            $('.time-item').removeClass('selected-item');
            $(this).toggleClass('selected-item');
        }  
    }else{
        $(this).toggleClass('selected-item');
    }
     
});

//예약, 수정화면 띄우기
function veiwModal(selectedTime, id) {
    let timeItem = {"10:00":0, "11:00":1, "12:00":2, "1:00":3, "2:00":4, "3:00":5, "4:00":6, "5:00":7}
    $('#eventId').val(id);
    //선택한 날짜 받아오는 변수
    checkDayArr = $('.calendar-active').attr('data-date-val').split('/');

    //선택한 날짜 요일 받아오는 변수
    checkDay = new Date(checkDayArr[2] + '-' + checkDayArr[0] + '-' + checkDayArr[1]).getDay();
    todayLable = week[checkDay];

    // 예약된 시간 선택 불가능 또는 표시 하기
    if(memberRole == "ROLE_MEMBER"){
        for(let i = 0; i<$('.event-container').length; i++){
            let time = $('.event-title').children('span')[i].innerHTML.split('시간 : ')[1];
            $('.time-item')[timeItem[time]].setAttribute('data-select-val','selected');
    
        }
    }  
    $.ajax({
        url: "getMentoScheduleTime",
        type: "POST",
        data: {
            scheduleDate : $('.calendar-active').attr('data-date-val')
        },
        success: function (data) {
            data.forEach(element => {
                console.log(element.scheduleTime)
                // 예약된 시간 선택 불가능 또는 표시 하기
                let st = element.scheduleTime.split(',');
                for(let i = 0; i<st.length; i++){
                    $('.time-item')[timeItem[st[i]]].setAttribute('data-select-val','selected');
                }
            });
        },
        error: function () {
            alert("error");
        },
    });
    if(selectedTime){
        $('.time-item')[timeItem[selectedTime]].setAttribute('data-select-val','');
        if([timeItem[selectedTime]] < 2){
            $(`.time-am li:nth-child(${parseInt([timeItem[selectedTime]])+2})`).addClass('selected-item');
        }else{
            $(`.time-pm li:nth-child(${[timeItem[selectedTime]]})`).addClass('selected-item');
        }
    }
    
    //오늘 이후의 날짜만 예약 가능하게 하는 조건문
    if (checkDayArr[2] - year > 0 || (checkDayArr[2] - year == 0 && checkDayArr[0] - month > 0) || ((checkDayArr[2] - year) == 0 && (checkDayArr[0] - month) ==0 && (checkDayArr[1] - date) >= 0)){
        //모달 뷰를 띄워서 예약을 처리
        $('.calendar-date').children('.date').text(checkDayArr[0] + '.' + checkDayArr[1] + '(' + todayLable + ')')
        if(memberRole == "ROLE_MEMBER"){
            $('#modal-view').removeClass('hidden');
        }else{
            $('#modal-view-mento').removeClass('hidden');
        }
    }else{
        modalReset()
    }
}

//데이터 추가, 수정, 삭제
function setData(url, id) {
    let title = $('.booking-title').children('input').val();
    let content = $('.booking-content').children('textarea').val();
    let bookingDate = $('.calendar-active').attr('data-date-val');
    let bookingTime = $('.selected-item').text();
    let bookingWay = $('#on-off').val()
    let seq = $("#memberSeq").val()
    let role = $("#role").val()
    let form;
    // 저장할 데이터 json으로
    if(id){
        form = {
            bookingId: id,
            bookingTitle: title,
            bookingContent: content,
            bookingDate: bookingDate,
            bookingTime: bookingTime,
            way: bookingWay,
        }
    }else{
        form = {
            bookingTitle: title,
            bookingContent: content,
            bookingDate: bookingDate,
            bookingTime: bookingTime,
            way: bookingWay,
            memberSeq: seq,
        }
    }  
    // insertBooking controller에 통신 
    $.ajax({
        url: url,
        type: "POST",
        data: form,
        success: function () {
            modalReset();
            alert("저장되었습니다.");                
        },
        error: function () {
            alert("error");
        },
        complete: function (){
            location.reload();
        }
    });
};

//멘토 데이터 추가
function setDataMento(url, id) {
    let title = $('.booking-title').children('input').val();
    let bookingDate = $('.calendar-active').attr('data-date-val');
    let bookingTime = $('.selected-item')[0].textContent;
    let seq = $("#memberSeq").val()
    let form;
    for(let i = 1; i < $('.selected-item').length; i++){
        bookingTime += ','+$('.selected-item')[i].textContent
    }
    // 저장할 데이터 json으로
    if(id){
        form = {
            scheduleId: id,
            scheduleTitle: title,
            scheduleDate: bookingDate,
            scheduleTime: bookingTime,
        }
    }else{
        form = {
            scheduleTitle: title,
            scheduleDate: bookingDate,
            scheduleTime: bookingTime,
            memberSeq: seq,
        }
    }  
    // insertBooking controller에 통신 
    $.ajax({
        url: url,
        type: "POST",
        data: form,
        success: function () {
            modalReset();
            alert("저장되었습니다.");                
        },
        error: function () {
            alert("error");
        },
        complete: function (){
            location.reload();
        }
    });

};

// 달력 뷰 띄우는 함수
function setBookingView(seq, role) {
    $('#calendar').evoCalendar({})
    let url;
    let form;
    let type;
        url = "listBooking";
        form = {
            memberSeq: seq,
            role: role
        };
        type = "event";
    // 예약 현황  
    $.ajax({
        url: url,
        type: "POST",
        data: form,
        success: function (data) {
            data.forEach(element => {
                $("#calendar").evoCalendar('addCalendarEvent', 
                    {
                        id: element.bookingId,
                        name: element.bookingTitle,
                        date: element.bookingDate,
                        badge: '시간 : ' + element.bookingTime, // Event badge (optional)
                        description: element.bookingContent,
                        type: type
                    }
                );
            });
        },
        error: function () {
            alert("error");
        },
    });

    //멘토일 경우 자기자신의 일정을 보여줌.
    if(role == "ROLE_MENTO"){
        $.ajax({
            url: "listSchedule",
            type: "POST",
            data: form,
            success: function (data) {
                data.forEach(element => {
                    let st = element.scheduleTime.split(',');
                    console.log(st);
                    $("#calendar").evoCalendar('addCalendarEvent', 
                        {
                            id: "mento_"+element.scheduleId,
                            name: element.scheduleTitle,
                            date: element.scheduleDate,
                            badge: '시간 : ' + st[0] + ' ~ ' + st[st.length-1], // Event badge (optional)
                            type: "birthday"
                        }
                    );
                });
            },
            error: function () {
                alert("error");
            },
        });
    }  
};
// 모달뷰 초기화
function modalReset() {
    $('.booking-title').children('input').val("");
    $('.booking-content').children('textarea').val("");
    $('#on-off').val("on")
    $('.time-item').removeClass('selected-item');
    $('#modal-view').addClass('hidden');
    $('#modal-view-mento').addClass('hidden');
    for(let i =0 ; i<$(".time-item").length; i++){
        $(".time-item")[i].setAttribute('data-select-val','')
    }
}

// 이벤트 상세보기
function reviseEvent(index) {
    if(role == "ROLE_MEMBER"){
        let title = $('.event-container[data-event-index='+index+']').children('.event-info').children('.event-title').text().split('시간 : ');
        let content = $('.event-container[data-event-index='+index+']').children('.event-info').children('.event-desc').text();
        $('#revise-btn').removeClass('hidden');
        $('#remove-btn').removeClass('hidden');
        $('#booking-btn').addClass('hidden');
        $('.booking-title').children('input').val(title[0]);
        $('.booking-content').children('textarea').val(content);  
        $('#on-off').val("on")
        $('.time-item').removeClass('selected-item'); 
        veiwModal(title[1], index);
    }else{
        reviseMentoEvent(index);
    }
    
}