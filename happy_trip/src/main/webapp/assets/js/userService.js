let userState = false;
const userList = [];
let userIdx = 0;

const loginClickEventHandler = async () => {
    const form = document.querySelector("#login-form");
    const userId = document.querySelector("#user-id").value;
    const userPw = document.querySelector("#user-password").value;
    const user = { userId, userPw };
    if (userId != "" && userPw != "" && (await login(user))) {
        document.querySelector("#fail-alert").classList.add("d-none");
    } else {
        document.querySelector("#fail-alert").classList.remove("d-none");
    }
};

const joinClickEventHandler = async () => {
    const form = document.querySelector("#join-form");
    const userNameDiv = document.querySelector("#user-name");
    const userIdDiv = document.querySelector("#user-join-id");
    const userPwDiv = document.querySelector("#user-join-password");
    const pwConfirmDiv = document.querySelector("#user-password-confirm");
    const userName = document.querySelector("#user-name").value;
    const userId = document.querySelector("#user-join-id").value;
    const userPw = document.querySelector("#user-join-password").value;
    const pwConfirm = document.querySelector("#user-password-confirm").value;
    const userEmailFront = document.querySelector("#user-email").value;
    const userEmailBack = document.querySelector("#mail").value;
    const userEmail = `${userEmailFront}@${userEmailBack}`;

    const sido = document.querySelector("#sido");
    const sidoIndex = sido.selectedIndex;
    const sidoOption = sido.options[sidoIndex];
    const sidoText = sidoOption.textContent;

    const gugun = document.querySelector("#gugun");
    const gugunIndex = gugun.selectedIndex;
    const gugunOption = gugun.options[gugunIndex];
    const gugunText = gugunOption.textContent;

    const userArea = `${sidoText} ${gugunText}`;

    const joinUser = { userName, userId, userPw, userEmail, userArea };

    let flag = true;

    if (userName == "") {
        flag = false;
        userNameDiv.classList.add("is-invalid");
    }
    if (userId == "") {
        flag = false;
        userIdDiv.classList.add("is-invalid");
    }
    if (userPw == "") {
        flag = false;
        userPwDiv.classList.add("is-invalid");
    }
    if (userName == "") {
        flag = false;
        userNameDiv.classList.add("is-invalid");
    }
    if (userPw != pwConfirm || pwConfirm == "") {
        flag = false;
        pwConfirmDiv.classList.add("is-invalid");
    }
    if (userEmailFront == "") {
        flag = false;
        document.querySelector("#user-email").classList.add("is-invalid");
    }
    if (userEmailBack == "") {
        flag = false;
        document.querySelector("#mail").classList.add("is-invalid");
    }
    if (sido.value == "") {
        flag = false;
        sido.classList.add("is-invalid");
    }
    if (gugun.value == "") {
        flag = false;
        gugun.classList.add("is-invalid");
    }
    joinUser.idx = Number(userIdx);
    console.log(joinUser);
    userIdx += 1;
    if (flag) {
        alert("회원가입 성공");
        if (localStorage.getItem("userList") == null) {
            userList.push(joinUser);
            localStorage.setItem("userList", JSON.stringify(userList));
            localStorage.setItem("userIdx", userIdx);
        } else {
            console.log(localStorage.getItem("userList"));
            console.log(JSON.parse(localStorage.getItem("userList"))[0]);
            const tmpList = JSON.parse(localStorage.getItem("userList"));
            tmpList.push(joinUser);
            localStorage.setItem("userList", JSON.stringify(tmpList));
            localStorage.setItem("userIdx", userIdx);
        }
        login({ userId, userPw });
        return;
    } else {
        return;
    }
};

const login = async (user) => {
    const getUserList = JSON.parse(localStorage.getItem("userList"));

    if (getUserList == null) {
        return false;
    }

    await getUserList.forEach((joined) => {
        if (joined.userId == user.userId && joined.userPw == user.userPw) {
            sessionStorage.setItem("user", JSON.stringify(joined));
            window.location.reload();
            return true;
        }
        return false;
    });
    return false;
};

const logout = () => {
    sessionStorage.removeItem("user");
    window.location.reload();
};

///////////////////////// select box 설정 (지역, 매매기간) /////////////////////////
let date = new Date();

// 브라우저가 열리면 시도정보 얻기.
sendRequest("sido", "action=sido");

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
document.querySelector("#sido").addEventListener("change", function () {
    if (this[this.selectedIndex].value) {
        let sidoCode = this[this.selectedIndex].value;
        sendRequest("gugun", `action=gugun&sidoCode=${sidoCode}`);
    } else {
        initOption("gugun");
    }
});

async function addOption(selid, data) {
    let opt = ``;
    initOption(selid);
    switch (selid) {
        case "sido":
            opt += `<option value="">검색 할 지역 선택</option>`;
            console.log(data);
            data.forEach(function (regcode) {
                opt += `
    <option value="${regcode.sidoCode}">${regcode.sidoName}</option>
    `;
            });
            break;
        case "gugun":
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

