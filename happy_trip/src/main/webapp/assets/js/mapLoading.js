///////////////////////// select box 설정 (지역, 매매기간) /////////////////////////
let date = new Date();

// 브라우저가 열리면 시도정보 얻기.
sendRequest("search-area", "action=sido");

// https://juso.dev/docs/reg-code-api/
// let url = "https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes";
// let regcode = "*00000000";
// 전국 특별/광역시, 도
// https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=*00000000

function sendRequest(selid, params) {
    const url = "http://localhost:8080/happy_trip/trip";
    fetch(`${url}?${params}`)
        .then((response) => response.json())
        .then((data) => addOption(selid, data));
}
// 시도가 바뀌면 구군정보 얻기.
document.querySelector("#search-area").addEventListener("change", function () {
    if (this[this.selectedIndex].value) {
        let sidoCode = this[this.selectedIndex].value;
        sendRequest("search-area-2", `action=gugun&sidoCode=${sidoCode}`);
    } else {
        initOption("search-area-2");
    }
});

async function addOption(selid, data) {
    let opt = ``;
    initOption(selid);
    switch (selid) {
        case "search-area":
            opt += `<option value="">검색 할 지역 선택</option>`;
            console.log(data);
            data.forEach(function (regcode) {
                opt += `
    <option value="${regcode.sidoCode}">${regcode.sidoName}</option>
    `;
            });
            break;
        case "search-area-2":
            opt += `<option value="">구군 선택</option>`;
            console.log(data);
            data.forEach(function (regcode) {
                opt += `
    <option value="${regcode.gugunCode}">${regcode.gugunName}</option>
    `;
            });
            break;
    }
    document.querySelector(`#${selid}`).innerHTML = opt;
}

function initOption(selid) {
    let options = document.querySelector(`#${selid}`);
    options.length = 0;
}
