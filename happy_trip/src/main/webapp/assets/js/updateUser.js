const updateFormLoading = () => {
    const loginedUser = JSON.parse(sessionStorage.getItem("user"));
    // const nameInput = document.createElement("input");
    // nameInput.setAttribute("type", "text");
    // nameInput.setAttribute("value", loginedUser.userName);
    // nameInput.setAttribute("id", "user-name");
    // nameInput.setAttribute("name", "user-name");
    // nameInput.classList.add("form-control");
    // const nameDiv = document.querySelector("#name-div");
    // nameDiv.appendChild(nameInput);
    console.log(loginedUser);
    const nameInput = document.querySelector("#user-name");
    nameInput.value = loginedUser.userName;

    const idInput = document.querySelector("#user-join-id");
    idInput.value = loginedUser.userId;

    // const pwInput = document.querySelector("#user-join-pw");
    // pwInput.value = loginedUser.userPw;

    const email = loginedUser.userEmail.split("@");

    const emailInput = document.querySelector("#user-email");
    emailInput.value = email[0];

    const mailInput = document.querySelector("#mail");
    mailInput.value = email[1];
};

const deleteProfile = () => {
    const loginedUser = JSON.parse(sessionStorage.getItem("user"));
    const flag = confirm("정말 삭제하시겠습니까?");
    if (flag) {
        const userList = JSON.parse(localStorage.getItem("userList"));
        const tmpList = userList.filter((user) => user.idx !== loginedUser.idx);
        localStorage.setItem("userList", JSON.stringify(tmpList));
        sessionStorage.removeItem("user");
        window.location.href = "/";
        // 리다이렉트
    } else {
        console.log("유저 삭제 취소");
    }
};

const updateBtnClickEventListner = () => {
    const userPw = document.querySelector("#user-join-password").value;
    updateProfile(userPw);
};

const updateProfile = (password) => {
    const loginedUser = JSON.parse(sessionStorage.getItem("user"));
    const pw = loginedUser.userPw;
    const userPwDiv = document.querySelector("#user-join-password");

    if (pw == password) {
        if (confirm("정말 수정하시겠습니까?")) {
            const userName = document.querySelector("#user-name").value;
            const userEmailFront = document.querySelector("#user-email").value;
            const userEmailBack = document.querySelector("#mail").value;
            const userEmail = `${userEmailFront}@${userEmailBack}`;
            const updateUser = loginedUser;
            updateUser.userName = userName;
            updateUser.userEmail = userEmail;
            sessionStorage.setItem("user", JSON.stringify(updateUser));
            window.location.href = "/";
        } else {
            userPwDiv.classList.remove("is-invalid");
        }
    } else {
        userPwDiv.classList.add("is-invalid");
    }
};

window.onload = () => {
    updateFormLoading();
};
