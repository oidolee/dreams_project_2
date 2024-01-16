//경기일정 구현 담당자 : 이민진
// Date 객체 생성
let date = new Date();

const renderCalendar = () => {
    const viewYear = date.getFullYear();
    const viewMonth = date.getMonth();

    // year-month 채우기
    document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth + 1}월`;

    // 지난 달 마지막 Date, 이번 달 마지막 Date
    const prevLast = new Date(viewYear, viewMonth, 0);
    const thisLast = new Date(viewYear, viewMonth + 1, 0);

    //이전 달 마지막 일
    const PLDate = prevLast.getDate();
    //이전 달 마지막 요일
    const PLDay = prevLast.getDay();

    //이번달 마지막 일
    const TLDate = thisLast.getDate();
    //이번달 마지막 요일
    const TLDay = thisLast.getDay();

    // Dates 기본 배열들
    const prevDates = [];
    // Array(TLDate + 1).keys() => TLDate + 1인덱스 값 배열 만듬
    const thisDates = [...Array(TLDate + 1).keys()].slice(1);
    const nextDates = [];

    // prevDates 계산(이전달 일수)
    if (PLDay !== 6) {
        for (let i = 0; i < PLDay + 1; i++) {
            // prevDates.unshift(PLDate - i);
            prevDates.unshift("");
        }
    }

    // nextDates 계산(다음달 계산)
    for (let i = 1; i < 7 - TLDay; i++) {
        // nextDates.push(i)
        nextDates.push("")
    }

    // Dates 합치기
    const dates = prevDates.concat(thisDates, nextDates);

   // Dates 정리
   const firstDateIndex = dates.indexOf(1);
   const lastDateIndex = dates.lastIndexOf(TLDate);

   //데이터 추가 
   let games = {
        month_1: {
            2: { home: '드림즈', away: 'LG',     time: "18:00" ,checkHome : "T"},
            3: { home: '드림즈', away: 'LG',     time: "19:00" ,checkHome : "T"},
            4: { home: '키움',   away: '드림즈', time: "20:00" ,checkHome : "F"},
        },
        month_2: {
            12: { home: '드림즈', away: '한화', time: "18:00" ,checkHome : "T"},
            13: { home: '드림즈', away: '한화', time: "19:00" ,checkHome : "T"},
            14: { home: '두산', away: '드림즈', time: "20:00" ,checkHome : "F"},
        },
    };

    let location = {
        "드림즈" : "고척",
        "키움" : "고척",
        "LG" : "잠실",
        "두산" : "잠실",
        "한화" : "대전",
    }


    let selectMonth = "month_" + (viewMonth + 1);

    let homeAndAwayTag = '';
   dates.forEach((date, i) => {
     const condition = i >= firstDateIndex && i < lastDateIndex + 1
                       ? 'this'
                       : 'other';

        if (games[selectMonth] && games[selectMonth][i]) {
            if(games[selectMonth][i]['checkHome'] == 'T'){
                homeAndAwayTag = '<strong style="color:#bb1b39 !important; ">HOME</strong>'
            }else {
                homeAndAwayTag = '<strong style="color:#369dd9 !important; ">AWAY</strong>'; 
            }
            dates[i] = `<div class="date">
                            
                            <div class="contents">
                                <span clsss="${games[selectMonth][i]['checkHome']}">
                                    <span class="${condition}">${date}</span>
                                    ${homeAndAwayTag}
                                </span>
                                <div>
                                    <div>${games[selectMonth][i]['home']} : </div>
                                    <div>${games[selectMonth][i]['away']}</div>
                                </div>
                                <p>
                                    ${location[games[selectMonth][i]['home']]}
                                    ${games[selectMonth][i]['time']}
                                </p>
                            </div>
                        </div>`;
        } else {
            dates[i] = `<div class="date">
                            <div class="contents">
                                <span class="${condition}">${date}</span>
                            </div>

                        </div>`;
        }
   })

    // Dates 그리기
    document.querySelector('.dates').innerHTML = dates.join('');

    // 오늘 날짜 그리기
    const today = new Date();
    if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
        for (let date of document.querySelectorAll('.this')) {
            if (+date.innerText === today.getDate()) {
                date.classList.add('today');
                
                break;
            }
        }
    }
}

renderCalendar();

const prevMonth = () => {
    date.setDate(1);
    date.setMonth(date.getMonth() - 1);
    renderCalendar();
}
  
const nextMonth = () => {
    date.setDate(1);
    date.setMonth(date.getMonth() + 1);
    renderCalendar();
}

const goToday = () => {
    date = new Date();
    renderCalendar();
}
