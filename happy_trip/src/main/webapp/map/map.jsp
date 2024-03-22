<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
prefix="c" uri="jakarta.tags.core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Happy Trip!</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
            crossorigin="anonymous"
        />
        <link rel="stylesheet" href="${root}/assets/css/style.css" />
        <link rel="stylesheet" href="${root}/assets/css/map.css" />
        <script
            type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b43c988c5170c66105dad16e5cb282d1&libraries=services"
        ></script>
        <script
            src="http://sgis.kostat.go.kr/OpenAPI2/Key.do?serviceKey=JHW+1hoKL+7INEwzeiiNgY/lx/owvj1mY+MnLWSDbuY9PsYztUv+VziTl5zHvAbNTKlXP3MTVs5jK1fOfZ28dQ=="
            type="text/javascript"
        ></script>
    </head>
    <body>
        <!-- header start -->
        <%@ include file="/partials/header.jsp"%>
        <!-- header end -->
        <!-- main start -->
        <main>
            <h1 id="tmp">ㅎㅇㅎㅇ</h1>
            <div class="container">
                <div class="alert alert-primary mt-3 text-center fw-bold" role="alert">
                    전국 관광지 정보
                </div>
                <!-- 관광지 검색 start -->
                <form class="d-flex my-3" onsubmit="return false;" role="search" required>
                    <select id="search-area" class="form-select me-2">
                        <option value="0" selected="">검색 할 지역 선택</option>
                    </select>
                    <select id="search-area-2" class="form-select me-2" required>
                        <option value="0" selected="">구군 선택</option>
                    </select>
                    <select id="search-content-id" class="form-select me-2">
                        <option value="0" selected="">관광지 유형</option>
                        <option value="12">관광지</option>
                        <option value="14">문화시설</option>
                        <option value="15">축제공연행사</option>
                        <option value="25">여행코스</option>
                        <option value="28">레포츠</option>
                        <option value="32">숙박</option>
                        <option value="38">쇼핑</option>
                        <option value="39">음식점</option>
                    </select>

                    <button
                        id="btn-search"
                        class="btn btn-outline-success"
                        type="button"
                        onclick="getTouristSpots()"
                    >
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24"
                            height="24"
                            viewBox="0 0 24 24"
                            fill="none"
                            stroke="currentColor"
                            stroke-width="2"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            class="feather feather-search"
                        >
                            <circle cx="11" cy="11" r="8"></circle>
                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                        </svg>
                    </button>
                </form>
                <div id="mapwrap" style="width: 100%; height: 700px">
                    <!-- kakao map start -->
                    <div id="map" style="width: 100%; height: 100%"></div>
                    <!-- kakao map end -->
                    <div class="row">
                        <table class="table table-striped" style="display: none">
                            <thead>
                                <tr>
                                    <th>대표이미지</th>
                                    <th>관광지명</th>
                                    <th>주소</th>
                                    <th>위도</th>
                                    <th>경도</th>
                                </tr>
                            </thead>
                            <tbody id="trip-list"></tbody>
                        </table>
                    </div>
                </div>
                <!-- 관광지 검색 end -->
            </div>
        </main>

        <!-- main end -->

        <script>
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

                const contentType = searchContent.value;
                const sidoCode = areaVal;
                const gugunCode = area2Val;

                // 1. areaVal 장소 찾기 ㄱㄱ
                if (areaVal != 0 && area2Val != 0) {
                    await searchAndUpdateMap(areaText + " " + area2Text);
                } else if (areaVal != 0) {
                    await searchAndUpdateMap(areaText);
                }

                const latitude = latlng.getLat(); // 위도
                const longitude = latlng.getLng(); // 경도
                
                const url = "http://localhost:8080/happy_trip/trip";
                let param;
                
                if (contentType != 0) {
                    param = `action=mapping&sidoCode=\${sidoCode}&gugunCode=\${gugunCode}&type=\${contentType}`;
                }else{
                	param = `action=mapping&sidoCode=\${sidoCode}&gugunCode=\${gugunCode}`;
                } 

                 await fetch(`\${url}?\${param}`)
                     .then((response) => response.json())
                     .then((data) => {
                         console.log(data);
                         data.forEach((loc) => {
                             // 마커 등록하며 맵에 띄우기
                             makeMaker(
                                 loc.title,
                                 loc.firstImage,
                                 loc.latitude,
                                 loc.longitude,
                                 loc.addr,
                                 loc.contentTypeId
                             );
                         });
                     })
                     .catch((error) => {
                         console.error("데이터 가져오기 실패:", error);
                     });
            }

            // 마커 1개 만드는 함수임
            function makeMaker(title, img, my, mx, addr, type) {
                // 추가할 OverLay
                var wrap = document.createElement("div");
                wrap.innerHTML =
                    '<div class="wrap">' +
                    '    <div class="info">' +
                    '        <div class="title">' +
                    `            \${title}` +
                    '            <div class="close" title="닫기"></div>' +
                    "        </div>" +
                    '        <div class="body">' +
                    '            <div class="img">' +
                    `                <img src="\${img == "" ? "https://www.mogef.go.kr/upload/facilities/noimg_big.gif" : img}" width="70" height="73" alt="">` +
                    "           </div>" +
                    '            <div class="desc">' +
                    `                <div class="ellipsis">\${addr}</div>` +
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
        </script>
        <script src="${root}/assets/js/api.js"></script>
        <script src="${root}/assets/js/mapLoading.js"></script>
        <script src="${root}/assets/js/logout.js"></script>
        <!-- footer -->
        <%@ include file="/partials/footer.jsp"%>
        <!-- footer -->
    </body>
</html>
