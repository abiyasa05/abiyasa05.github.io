<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Ez Game - Login</title>

    <link rel='stylesheet' type='text/css' href='main.css'>
</head>
<body>
    <div class="wrap blurbawah">
    	<div id="kontenlogin">

        <!-- Judul -->
        <h2 class="aktif"> Login </h2>

        <!-- Login -->
        <form method="post" action="proses_login.php">
          <input type="text" id="login" class="blur pertama" name="email_pelanggan" placeholder="Email">
          <input type="password" id="password" class="blur kedua" name="password_pelanggan" placeholder="Password">
          <br><br>
          <input type="submit" class="blur ketiga" name="submit" value="Login">
        </form>

        <!-- Lupa password -->
        <div id="footer">
          <a class="garisbawah" href="register.php"> Belum punya akun? Daftar </a>
        </div>
      </div>
    </div>
</body>
</html>