<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="footer, address, phone, icons" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link href="http://fonts.googleapis.com/css?family=Cookie"
	rel="stylesheet" type="text/css">
<!--  -->




	<header> <!-- 효과 --> <!-- Navigation --> <nav
		class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top"> <!-- Brand/logo -->
	<a href="main.jsp"> <script language="JavaScript1.2">

var message="All-Meetings"
var neonbasecolor="red"
var neontextcolor="BLUE"
var neontextcolor2="#FFFFA8"
var flashspeed=100      // speed of flashing in milliseconds
var flashingletters=1   // number of letters flashing in neontextcolor
var flashingletters2=1    // number of letters flashing in neontextcolor2 (0 to disable)
var flashpause=0      // the pause between flash-cycles in milliseconds


var n=0
  if (document.all||document.getElementById){
    document.write('<font color="'+neonbasecolor+'">')
    for (m=0;m<message.length;m++)
      document.write('<span id="neonlight'+m+'">'+message.charAt(m)+'</span>')
      document.write('</font>')
    }
    else
      document.write(message)

function crossref(number){
  var crossobj=document.all? eval("document.all.neonlight"+number) : document.getElementById("neonlight"+number)
  return crossobj
}

function neon(){
  if (n==0){
  for (m=0;m<message.length;m++)
    crossref(m).style.color=neonbasecolor
    }
    crossref(n).style.color=neontextcolor

    if (n>flashingletters-1) crossref(n-flashingletters).style.color=neontextcolor2 
    if (n>(flashingletters+flashingletters2)-1) crossref(n-flashingletters-flashingletters2).style.color=neonbasecolor

    if (n<message.length-1)
      n++
      else{
        n=0
        clearInterval(flashing)
        setTimeout("beginneon()",flashpause)
      return
      }
    }

function beginneon(){
  if (document.all||document.getElementById)
    flashing=setInterval("neon()",flashspeed)
  }
  beginneon()

	</script>
	</a> <!-- Links -->
	<div id="navi">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="location.jsp">위치보기</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="list.jsp">게시판</a>
			</li>
			<li class="nav-item"><a class="nav-link" href=""
				onclick="login()">로그인</a></li>
		</ul>
	</div>
	<!--  --> </nav> </header>