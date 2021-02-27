<%-- 
    Document   : InfoMember
    Created on : Nov 8, 2020, 1:03:51 AM
    Author     : Minh Hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thành viên thực hiện</title>
        <link href="css/InfoMember.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div>
            <div>
                <h2>Group 12:</h2>
            </div>
            <div>
                Phan Minh Hoàng - 18110286<br>
                Nguyễn Văn Tân - 18110361<br>
                Lê Đức Tân - 18110361<br>
                Mai Đăng Khoa - 18110306
            </div>
            <div>
                <a href="../../index.jsp">Back</a>
            </div>
        </div>
        <script type="text/javascript">
            const buttons = document.querySelectorAll('a');
            buttons.forEach(btn => {
                btn.addEventListener('click', function (e) {
                    let x = e.clientX - e.target.offsetLeft;
                    let y = e.clientY - e.target.offsetTop;
                    let ripples = document.createElement('span');
                    ripples.style.left = x + 'px';
                    ripples.style.top = y + 'px';
                    this.appendChild(ripples);
                    setTimeout(() => {
                        ripples.remove()
                    }, 1000);
                })
            })
        </script>
    </body>
</html>
