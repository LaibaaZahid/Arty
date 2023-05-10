<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="home.css">
    <title>Document</title>

    <style>
        .order{
            background-color: rgb(30, 65, 17);
            height: 400px;
            width: 26%;
            margin-top: 10%;
            margin-left: 32%;
            font-family: cursive;
            font-size: large;
            color: wheat;
            padding: 30px;
            opacity: 100%;
            border: 1px solid rgba(1, 0, 0, 0.507);
            border-radius: 10px;
            font-weight: bold;
            box-shadow: 2px 2px 2px 2px rgba(0, 0, 0, 0.601);
            -webkit-box-shadow:0px 0px 30px 15px rgba(195, 174, 10, 0.9);
            -moz-box-shadow: 0px 0px 30px 15px rgba(195, 174, 10, 0.9);
            box-shadow: 0px 0px 30px 15px rgba(195, 174, 10, 0.9);
        }

        .order input{
            width: 270px;
            margin: 20px;
            margin-left: 50px;
            height: 20px;
            border: 2px solid gray;
            border-radius: 5px;
            background-color: lightgray;
            
        }

        .order button{
            margin: 10px;
            margin-left: 25%;
            width: 150px;
            height: 40px;
            border-radius: 15px;
            background-color: darkgreen;
            color: wheat;
            font-family: cursive;
            font-weight: bold;
            border: 1px solid rgb(8, 45, 8)
        }
    </style>



</head>
<body>
    <nav class="mynavbar">

        <div class="header">
            <img src="logo.png" alt="logo">
            <p>ARTY</p>
        </div>
        <ul class="navli">
            <li><a href="home.jsp">Home</a></li>
            <li><a href="viewcart.jsp">View Cart</a></li>
            <li><a href="#">Contact Us</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>

    </nav>
    <div class="order">
    <form action="order.jsp" method="POST">
        Full Name: <br>
        <input type="text" name="name"> <br>
        City: <br>    
          <input  type="text" name="city"> <br>
        Address: <br>
        <input type="text" name="address"> <br>
        Phone no: <br>
         <input type="text" name="phone">

        <br>
        <button type="submit">Place Order</button>



    </form>

</div>









</body>
</html>