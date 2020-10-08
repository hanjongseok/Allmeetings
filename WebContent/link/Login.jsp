<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
    <head>
        <title>로그인 / 회원가입 폼 템플릿</title>
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">로그인</button>
                    <button type="button" class="togglebtn" onclick="register()">회원가입</button>
                </div>
                
                <form id="login" action="" class="input-group">
                    <input type="text" class="input-field" placeholder="아이디" required>
                    <input type="password" class="input-field" placeholder="비밀번호" required><br><br>
                    
                    <button class="submit">로그인</button>
                </form>
                <form id="register" action="" class="input-group">
                    <input type="text" class="input-field" placeholder="이름" required>
                    <input type="email" class="input-field" placeholder="이메일" required>
                    <input type="password" class="input-field" placeholder="비밀번호" required>
                    <select>
                        <option>성별</option>
                        <option>남자</option>
                        <option>여자</option>
                    </select>
                    <select>
                        <option>지역</option>
                        <option>서울</option>
                        <option>부산</option>
                        <option>대구</option>
                        <option>대전</option>
                        <option>광주</option>
                        <option>인천</option>
                        <option>울산</option>
                        <option>제주</option>
                    </select>
                    <select>
                        <option>나이</option>
                        <option>10~20</option>
                        <option>20~30</option>
                        <option>30~40</option>
                    </select><br><br>
                    <button class="submit">회원가입</button>
                </form>
            </div>
        </div>
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
        </script>
    </body>
</html> 