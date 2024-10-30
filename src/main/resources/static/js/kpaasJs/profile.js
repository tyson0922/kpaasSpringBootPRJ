$(document).ready(function () {
    let f = document.getElementById("f"); // form element reference

    // Address lookup via Kakao API
    $("#btnAddr").on("click", function () {
        kakaoPost(f);
    });

    // Send verification code for email
    $("#btnEmail").on("click", function () {
        sendVerificationCode(f);
    });

    // Update user information
    $("#btnUpdate").on("click", function () {
        doUpdate(f);
    });

    $('#btnDeleteAccount').on('click', function() {
        if (confirm("정말로 회원탈퇴를 하시겠습니까? 이 작업은 되돌릴 수 없습니다.")) {
            $.ajax({
                url: "/user/deleteAccount",
                type: "POST",
                dataType: "json",
                success: function(response) {
                    if (response.success) {
                        alert("회원 탈퇴가 완료되었습니다.");
                        window.location.href = "/user/sign-in"; // Redirect to sign-in or homepage after deletion
                    } else {
                        alert("회원 탈퇴에 실패하였습니다. 다시 시도해주세요.");
                    }
                },
                error: function() {
                    alert("서버와의 통신 중 오류가 발생했습니다.");
                }
            });
        }
    });
});

// Kakao Postcode Lookup API
function kakaoPost(f) {
    new daum.Postcode({
        oncomplete: function (data) {
            let address = data.address;
            let zonecode = data.zonecode;
            f.addr1.value = "(" + zonecode + ")" + address;
        }
    }).open();
}

function sendVerificationCode(f) {
    if (f.email.value === "") {
        alert("이메일을 입력하세요.");
        f.email.focus();
        return;
    }

    // AJAX call to send verification code to email
    $.ajax({
        url: "/user/sendVerificationCode", // Updated endpoint for sending verification code
        type: "post",
        dataType: "JSON",
        data: { email: f.email.value }, // Only send the email to the server
        success: function (json) {
            if (json.success) {
                alert("이메일로 인증번호가 발송되었습니다. \n받은 메일의 인증번호를 입력하기 바랍니다.");
                emailAuthNumber = json.authNumber; // Store the auth number for later validation
            } else {
                alert("이메일 인증번호 발송 중 오류가 발생했습니다.");
            }
        },
        error: function () {
            alert("서버와의 통신 중 오류가 발생했습니다.");
        }
    });
}
// Update User Information Form Validation and Submission
function doUpdate(f) {
    if (f.userName.value === "") {
        alert("이름을 입력하세요.");
        f.userName.focus();
        return;
    }

    if (f.email.value === "") {
        alert("이메일을 입력하세요.");
        f.email.focus();
        return;
    }

    if (f.addr1.value === "") {
        alert("주소를 입력하세요.");
        f.addr1.focus();
        return;
    }

    if (f.addr2.value === "") {
        alert("상세주소를 입력하세요.");
        f.addr2.focus();
        return;
    }

    // AJAX call to update user information
    $.ajax({
        url: "/user/updateUserInfo",
        type: "post",
        dataType: "JSON",
        data: $("#f").serialize(),
        success: function (json) {
            if (json.result === 1) {
                alert("회원 정보가 성공적으로 업데이트되었습니다.");
                location.href = "/user/sign-in"; // Redirect to user profile page
            } else {
                alert("회원 정보 업데이트에 실패했습니다.");
            }
        },
        error: function () {
            alert("회원 정보 업데이트 중 오류가 발생했습니다.");
        }
    });
}
