const encodingAPIKey = `JHW+1hoKL+7INEwzeiiNgY/lx/owvj1mY+MnLWSDbuY9PsYztUv+VziTl5zHvAbNTKlXP3MTVs5jK1fOfZ28dQ==`;

const getTripJsonData = async function () {
    const options = {
        method: "GET",
        headers: {
            "Content-Type": "application/json",
        },
    };
    // 국토교통부 xml
    const addPath = "/locationBasedList1";
    const baseurl = "https://apis.data.go.kr/B551011/KorService1";
    const params = {
        numOfRows: 30,
        pageNo: 1,
        MobileOS: "ETC",
        MobileApp: `Happy`,
        _type: "json",
        listYN: "Y",
        arrange: "A",
        mapX: 126.981611,
        mapY: 37.568477,
        radius: 1000,
        contentTypeId: 12,
        serviceKey: encodingAPIKey,
    };

    const queryString = new URLSearchParams(params).toString(); // url에 쓰기 적합한 querySting으로 return 해준다.
    const requestUrl = `${baseurl}${addPath}?${queryString}`; // 완성된 요청 url.

    await fetch(requestUrl)
        .then((response) => response.json())
        .then((data) => makeList(data));
};

const makeList = (data) => {
    console.log(data);
};

