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
    // 삭제할 여부를 묻고 삭제
    if(confirm("삭제 하시겠습니까?")){
        if(memberRole == "ROLE_MEMBER"){
            setData("deleteBooking",id);
        }else{
            setDataMento("deleteSchedule",id);
        } 
    }  
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
function veiwModal(selectedTime) {
    let timeItem = {"10:00":0, "11:00":1, "12:00":2, "1:00":3, "2:00":4, "3:00":5, "4:00":6, "5:00":7}
    //선택한 날짜 받아오는 변수
    checkDayArr = $('.calendar-active').attr('data-date-val').split('/');

    //선택한 날짜 요일 받아오는 변수
    checkDay = new Date(checkDayArr[2] + '-' + checkDayArr[0] + '-' + checkDayArr[1]).getDay();
    todayLable = week[checkDay];

    // 예약된 시간 선택 불가능 또는 표시 하기
    if(memberRole == "ROLE_MEMBER"){
        for(let i = 0; i<$('.event-container').length; i++){
            if($('.event-title').children('span')[i]){
                let time = $('.event-title').children('span')[i].innerHTML.split('시간 : ')[1];
            $('.time-item')[timeItem[time]].setAttribute('data-select-val','selected');
            }     
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
                console.log(st);
                for(let i = 0; i<st.length; i++){
                    $('.time-item')[timeItem[st[i]]].setAttribute('data-select-val','selected');
                }
            });
        },
        error: function () {
            alert("error");
        },
    });
    //클래스 말고 attribute로 모든 선택한 시간 선택된 시간 표현하기.
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
        $('.calendar-date').children('.date').text(checkDayArr[0] + '.' + checkDayArr[1] + '(' + todayLable + ')');
        if(memberRole == "ROLE_MEMBER"){
            $('#modal-view').removeClass('hidden');
        }else if(memberRole == "ROLE_MENTO"){
            $('#modal-view-mento').removeClass('hidden');
        }
    }else{
        modalReset()
    }
}

//데이터 추가, 수정, 삭제
function setData(url, id, accept) {
    let title = $('.booking-title').children('input').val();
    let content = $('.booking-content').children('textarea').val();
    let bookingDate = $('.calendar-active').attr('data-date-val');
    let bookingTime = $('.selected-item').text();
    let bookingWay = $('#on-off').val();
    let seq = $("#memberSeq").val();
    let role = $("#role").val();
    let name = $('#name').val();
    let form;
    let emailUrl;

    // 저장할 데이터 json으로
    if(id){
        if(role == "ROLE_MEMBER"){
            form = {
                bookingId: id,
                bookingTitle: title,
                bookingContent: content,
                bookingDate: bookingDate,
                bookingTime: bookingTime,
                way: bookingWay,
                mentiSeq: seq,
                mentiName: name,
                role: role
            }
        }else{
            form = {
                bookingId: id,
                accept: accept,
                role: role
            }
        }       
    }else{
        form = {
            bookingTitle: title,
            bookingContent: content,
            bookingDate: bookingDate,
            bookingTime: bookingTime,
            way: bookingWay,
            mentiSeq: seq,
            mentiName: name
        }
    }  
    // insertBooking controller에 통신 
    $.ajax({
        url: url,
        type: "POST",
        data: form,
        success: function () {
            modalReset();
            if(url=="insertBooking"){
                alert("저장되었습니다.");
                emailUrl = "sendEmail";               
            }else if(url=="updateBooking"){
                alert("수정되었습니다.");  
                emailUrl = "updateEmail";             
            }else if(url=="deleteBooking"){
                alert("삭제되었습니다.");    
                emailUrl = "deleteEmail";            
            }
            // email 발송 (예약, 수정, 삭제 시에만)
            if(!accept){
                $.ajax({
                    url: emailUrl,
                    type: "POST",
                    data: form,
                    success: function () {                 
                    },
                    error: function () {
                        alert("error");
                    },
                    complete: function (){
                        location.reload();
                    }
                });
            }
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
    let bookingTime = $('.selected-item') ? $('.selected-item')[0].textContent : "";
    let seq = $("#memberSeq").val();
    let form;
    for(let i = 1; i < $('.selected-item').length; i++){
        bookingTime += ','+$('.selected-item')[i].textContent;
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
            mentoSeq: seq,
        }
    }  
    $.ajax({
        url: url,
        type: "POST",
        data: form,
        success: function () {
            modalReset();
            if(url == "insertSchedule"){
                alert("저장되었습니다.");  
            }else if(url == "updateSchedule"){
                alert("수정되었습니다.")
            }else{
                alertP("삭제되었습니다.")
            }                  
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
    $('#calendar').evoCalendar({
        'sidebarDisplayDefault': false,
    });
    
    let form;
    if(role == "ROLE_MEMBER"){
        form = {
            mentiSeq: seq,
            role: role
        };
    }else{
        form = {
            mentoSeq: seq,
            role: role
        };
    }       
    // 예약 현황  
    $.ajax({
        url: "listBooking",
        type: "POST",
        data: form,
        success: function (data) {
            data.forEach(element => {
                $("#calendar").evoCalendar('addCalendarEvent', 
                    {
                        id: element.bookingId,
                        name: element.bookingTitle,
                        date: element.bookingDate,
                        badge: '시간 : ' + element.bookingTime,
                        description: element.bookingContent,
                        type: "event",
                        color: element.accept == 0 ? "#ff7575" : "#7cee35",
                        userName:element.mentiName,
                        way:element.way,
                        accept:element.accept
                    }
                );               
            })
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
                    let mentoringChecker = element.scheduleTitle.indexOf("멘토링");
                    if(mentoringChecker == -1){
                        $("#calendar").evoCalendar('addCalendarEvent', 
                            {
                                id: "mento_"+element.scheduleId,
                                name: element.scheduleTitle,
                                date: element.scheduleDate,
                                badge: st.length-1 == 0 ? '시간 : ' + st[0] : '시간 : ' + st[0] + ' ~ ' + st[st.length-1], // Event badge (optional)
                                type: "birthday",
                                color: "#3ca8ff",
                            }
                        );
                    }
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
    $('.time-item').removeClass('selected-item');
    $('#modal-view').addClass('hidden');
    $('#modal-view-mento').addClass('hidden');
    $("#accept-btn").removeClass("hidden");
    $("#reject-btn").removeClass("hidden");
    $('.answer').val("");
    $('.coments-area').addClass('hidden')
    for(let i =0 ; i<$(".time-item").length; i++){
        $(".time-item")[i].setAttribute('data-select-val','')
    }
}

// 이벤트 상세보기
function reviseEvent(index) {
    $('#eventId').val(index);
    let title = $('.event-container[data-event-index='+index+']').children('.event-info').children('.event-title').text().split('시간 : ');
    let content = $('.event-container[data-event-index='+index+']').children('.event-info').children('.event-desc').text().split('상담방법:');
    if(memberRole == "ROLE_MEMBER"){
        $('#revise-btn').removeClass('hidden');
        $('#remove-btn').removeClass('hidden');
        $('#booking-btn').addClass('hidden');
        $('#modal-view').children(".modalBox").children('.booking-title').children('input').val(title[0]);
        $('.booking-content').children('textarea').val(content[0]);  
        $('#on-off').val("온라인")
        $('.time-item').removeClass('selected-item'); 
        veiwModal(title[1], index);
    }else{
        reviseMentoEvent(index);
    }
    
}

//수락된 멘토링 보는 함수
function viewMentoring(index) {
    $("#accept-btn").addClass("hidden");
    $("#reject-btn").addClass("hidden");
    $("#answer-btn").addClass("hidden");
    reviseMentoEvent(index);
}

