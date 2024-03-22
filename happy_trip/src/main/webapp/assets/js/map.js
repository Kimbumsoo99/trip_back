var mapContainer = document.getElementById("map"), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.498004414546934, 127.02770621963765), // 지도의 중심좌표
        level: 3, // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
let latlng = new kakao.maps.LatLng(37.498004414546934, 127.02770621963765);

// 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, "center_changed", function () {
    // 지도의  레벨을 얻어옵니다
    var level = map.getLevel();

    // 지도의 중심좌표를 얻어옵니다
    latlng = map.getCenter();
});

// 해당 이벤트 리스너 등록시 마커 찍음
async function getTouristSpots() {
    var radius = 10000; // 출력 길이

    const area = document.querySelector("#search-area");
    const area2 = document.querySelector("#search-area-2");
    const searchContent = document.querySelector("#search-content-id");

    const areaIndex = area.selectedIndex;
    const areaOption = area.options[areaIndex];
    const areaText = areaOption.textContent;
    const areaVal = area.value;

    const area2Index = area2.selectedIndex;
    const area2Option = area2.options[area2Index];
    const area2Text = area2Option.textContent;
    const area2Val = area2.value;

    var contentType = searchContent.value;

    // 1. areaVal 장소 찾기 ㄱㄱ
    if (areaVal != 0 && area2Val != 0) {
        await searchAndUpdateMap(areaText + " " + area2Text);
    } else if (areaVal != 0) {
        await searchAndUpdateMap(areaText);
    }

    if (contentType != 0) {
        var latitude = latlng.getLat(); // 위도
        var longitude = latlng.getLng(); // 경도
        var serviceKey = `tnUmmvDmkSirDPDLK4yAwgDRmjrgpk2kJt7RraNxxFQvaa8Lrl5dADU0FYq09%2FU2%2FigWVBB7oTFAsdtvja%2B63Q%3D%3D`; // 여기에 서비스 키 입력
        var url = `https://apis.data.go.kr/B551011/KorService1/locationBasedList1?serviceKey=${serviceKey}&numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A&mapX=${longitude}&mapY=${latitude}&radius=${radius}&contentTypeId=${contentType}`;
        await fetch(url)
            .then((response) => response.json())
            .then((data) => {
                data.response.body.items.item.forEach((loc) => {
                    // 마커 등록하며 맵에 띄우기
                    makeMaker(
                        loc.title,
                        loc.firstimage,
                        loc.mapy,
                        loc.mapx,
                        loc.addr1,
                        contentType
                    );
                });
            })
            .catch((error) => {
                console.error("데이터 가져오기 실패:", error);
            });
    } else {
        let type = [12, 14, 15, 25, 28, 32, 38, 39];
        await type.forEach(async (contentType) => {
            var latitude = latlng.getLat(); // 위도
            var longitude = latlng.getLng(); // 경도
            var serviceKey = `tnUmmvDmkSirDPDLK4yAwgDRmjrgpk2kJt7RraNxxFQvaa8Lrl5dADU0FYq09%2FU2%2FigWVBB7oTFAsdtvja%2B63Q%3D%3D`; // 여기에 서비스 키 입력

            var url = `https://apis.data.go.kr/B551011/KorService1/locationBasedList1?serviceKey=${serviceKey}&numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A&mapX=${longitude}&mapY=${latitude}&radius=${radius}&contentTypeId=${contentType}`;
            var response = await fetch(url);
            var data = await response.json();
            data.response.body.items.item.forEach((loc) => {
                // 마커 등록하며 맵에 띄우기
                makeMaker(loc.title, loc.firstimage, loc.mapy, loc.mapx, loc.addr1, contentType);
            });
        });
    }
}

// 마커 1개 만드는 함수임
function makeMaker(title, img, my, mx, addr, type) {
    // 추가할 OverLay
    var wrap = document.createElement("div");
    wrap.innerHTML =
        '<div class="wrap">' +
        '    <div class="info">' +
        '        <div class="title">' +
        `            ${title}` +
        '            <div class="close" title="닫기"></div>' +
        "        </div>" +
        '        <div class="body">' +
        '            <div class="img">' +
        `                <img src="${img == "" ? "https://www.mogef.go.kr/upload/facilities/noimg_big.gif" : img
        }" width="70" height="73" alt="">` +
        "           </div>" +
        '            <div class="desc">' +
        `                <div class="ellipsis">${addr}</div>` +
        "            </div>" +
        "        </div>" +
        "    </div>" +
        "</div>";

    var content = wrap.firstChild;
    // 마커, 오버레이 찍을 위치
    Position = new kakao.maps.LatLng(my, mx);
    // 마커 위치 지정
    let imageSrc = `https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png`;

    var imageSize = new kakao.maps.Size(27, 35); // 마커이미지의 크기입니다
    var imageOption = { offset: new kakao.maps.Point(27, 69) };

    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
    var marker = new kakao.maps.Marker({
        image: markerImage,
        position: Position,
    });
    // 오버레이 정보
    var customOverlay = new kakao.maps.CustomOverlay({
        clickable: true,
        content: content,
        position: Position,
        xAnchor: 0.5,
        yAnchor: 1,
        zIndex: 3,
    });
    // 마커 클릭 이벤트 -> 오버레이 출력
    kakao.maps.event.addListener(marker, "click", function () {
        customOverlay.setMap(map);
    });
    // closeOverlay 이벤트 발생시 오버레이 닫기
    var closeButton = content.querySelector(".close");
    closeButton.addEventListener("click", function () {
        closeOverlay(customOverlay);
    });

    marker.setMap(map);
}

// closeOverlay 함수 정의
function closeOverlay(customOverlay) {
    customOverlay.setMap(null);
}

function addressSearchAsync(add) {
    return new Promise((resolve, reject) => {
        geocoder.addressSearch(add, function (result, status) {
            if (status === kakao.maps.services.Status.OK) {
                resolve(result);
            } else {
                reject(status);
            }
        });
    });
}

// 사용 예시
async function searchAndUpdateMap(add) {
    try {
        const result = await addressSearchAsync(add);
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        // var coords = map.getCenter();
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        latlng = coords;
        map.setCenter(coords);
        map.setLevel(5);
    } catch (error) {
        console.error("검색 오류:", error);
    }
}
