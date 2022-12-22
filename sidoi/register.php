<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Ez Game - Register</title>
    
    <link rel='stylesheet' type='text/css' href='main.css'>
</head>
<body class="back">
    <div class="wrap blurbawah">
	<div id="kontenregister">

    <!-- Judul -->
    <h2 class="aktif"> Register </h2>

    <!-- Login -->
    <form method="post" action="proses_registrasi.php">
      <input type="text" id="nama" class="blur pertama" name="nama_pelanggan" placeholder="Nama Lengkap">
      <input type="text" id="daftar" class="blur kedua" name="email_pelanggan" placeholder="Email">
      <input type="number" id="telepon" class="blur ketiga" name="telepon_pelanggan" placeholder="Nomor Telepon">
      <input type="password" id="password" class="blur keempat" name="password_pelanggan" placeholder="Password">
      <input type="password" id="password" class="blur kelima" name="ulang_password" placeholder="Ulangi Password">
      <br><br>
      <input type="submit" class="blur keenam" name="kirim" value="Register">
    </form>

    <!-- Lupa password -->
    <div id="footer">
      <a class="garisbawah" href="login.php"> Sudah punya akun? Login </a>
    </div>
  </div>
</div>
</body>
</html>