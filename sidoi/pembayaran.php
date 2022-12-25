<?php
session_start();
//koneksi ke database
include 'koneksi.php';

//jika belum login akan dilarikan ke halaman login
if (!isset($_SESSION["pelanggan"])) {
  echo "<script>alert('Silahkan login dulu!');</script>";
  echo "<script>location='login.php';</script>";
}

//mendapatkan id_pembelian dari url
$idpem = $_GET["id"];
$ambil = $koneksi->query("SELECT * FROM pembelian WHERE id_pembelian='$idpem'");
$detpem = $ambil->fetch_assoc();

//mendapatkan email pelanggan yang beli
$email_pelanggan_beli = $detpem["email_pelanggan"];

//mendapatkan email pelanggan yang login
$email_pelanggan_login = $_SESSION["pelanggan"]["email_pelanggan"];

if ($email_pelanggan_login !== $email_pelanggan_beli) {
  echo "<script>alert('Jangan curang bro!');</script>";
  echo "<script>location='riwayat.php';</script>";
  exit();
}
?>
<?php
$ambil = $koneksi->query("SELECT * FROM profil");
$em = $ambil->fetch_assoc();
?>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <title>SI - DO'I - Pembayaran</title>

  <!-- CSS -->
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/font-awesome.min.css">
  <link rel="stylesheet" href="assets/css/brands.min.css">
  <link rel="stylesheet" href="assets/css/solid.min.css">

  <!-- JS -->
  <script src="/scripts/jquery.min.js"></script>
  <script src="assets/js/solid.min.js"></script>
  <script src="assets/js/bootstrap.min.js"></script>
  <script src="assets/js/fontawesome.min.js"></script>
  <script src="assets/js/brands.min.js"></script>

  <script type="text/javascript">
    var oFReader = new FileReader();
    oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

    oFReader.onload = function(oFREvent) {
      document.getElementById("uploadPreview").src = oFREvent.target.result;
    };
  </script>

  <style>
    img {
      max-width: 240px;
    }
  </style>
</head>

<body>
  <!--Navbar -->
  <nav class="mb-1 navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="index2.php">SI - DO'I</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-333" aria-controls="navbarSupportedContent-333" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent-333">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a class="nav-link" href="index.php">Tour Builder</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="paket_ziarah.php">Paket Ziarah</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="panduan_doa.php">Panduan Doa</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="history_pesanan.php">History Pesanan</a>
        </li>
      </ul>
      <form action="pencarian.php" method="get" class="form-inline my-2 my-lg-0 mr-5">
        <input class="form-control mr-sm-2" type="search" name="keyword" placeholder="Pencarian" aria-label="Search">
        <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Cari</button>
      </form>
      <ul class="navbar-nav mr-2">
        <a class="nav-link" href="wishlist.php">
          <i class="fas fa-bookmark"></i>
        </a>
      </ul>
      <ul class="navbar-nav mr-2">
        <a class="nav-link" href="keranjang.php">
          <i class="fas fa-shopping-cart"></i>
        </a>
      </ul>
      <ul class="navbar-nav">
        <li class="nav-item dropdown">
          <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <?php echo $_SESSION["pelanggan"]["nama_pelanggan"] ?></a>
          <div class="dropdown-menu dropdown-menu-right dropdown-info" aria-labelledby="navbarDropdownMenuLink-4">
            <a class="dropdown-item" href="profil.php?email=<?php echo $_SESSION["pelanggan"]["email_pelanggan"]; ?>">Profil</a>
            <a class="dropdown-item" href="logout.php">Logout</a>
          </div>
        </li>
      </ul>
    </div>
  </nav>
  <!--/.Navbar -->

  <!-- jQuery CDN - Slim version (=without AJAX) -->
  <script src="assets/js/jquery-3.3.1.slim.min.js"></script>
  <!-- Popper.JS -->
  <script src="assets/js//popper.min.js"></script>
  <!-- Bootstrap JS -->
  <script src="assets/js/bootstrap.min.js"></script>

  <script type="text/javascript">
    $(document).ready(function() {
      $('#sidebarCollapse').on('click', function() {
        $('#sidebar').toggleClass('active');
      });
    });
  </script>
  <!-- /javascript-->

  <!-- Konten -->
  <div class="container" style="margin-bottom: 50px;">
    <h2 style="margin-top: 35px;">Konfirmasi Pembayaran</h2>

    <hr color="black">

    <h5>Kirim bukti pembayaran anda disini!</h5>
    <div class="alert alert-info">
      Total tagihan anda sebesar <strong>Rp. <?php echo number_format($detpem["total_pembelian"]) ?></strong>
    </div>

    <form method="post" enctype="multipart/form-data">
      <div class="form-group">
        <label>Nama Yang Membayar</label>
        <input type="text" readonly value="<?php echo $_SESSION["pelanggan"]["nama_pelanggan"] ?>" name="nama" class="form-control" style="background-color: white;">
      </div>
      <div class="form-group">
        <label>Jumlah</label>
        <input type="text" readonly value="Rp. <?php echo number_format($detpem["total_pembelian"]) ?>" name="jumlah" class="form-control" style="background-color: white;">
      </div>
      <div class="form-group">
        <label>Bank</label>
        <select class="form-control" name="bank">
          <option value="">Pilih Bank</option>
          <option value="mandiri">Mandiri</option>
          <option value="bri">BRI</option>
          <option value="bca">BCA</option>
        </select>
      </div>
      <div class="form-group">
        <label>Foto Bukti</label>
        <div style="margin-bottom: 10px;">
          <img class="img" id="uploadPreview" />
        </div>
        <div>
          <input id="uploadImage" type="file" name="bukti" onchange="PreviewImage();" />
          <script type="text/javascript">
            function PreviewImage() {
              var oFReader = new FileReader();
              oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

              oFReader.onload = function(oFREvent) {
                document.getElementById("uploadPreview").src = oFREvent.target.result;
              };
            };
          </script>
        </div>
      </div>
      <button class="btn btn-primary" name="kirim">Kirim</button>
    </form>
  </div>

  <?php
  //jika tombol kirim ditekan
  if (isset($_POST["kirim"])) {
    //upload foto bukti
    $namabukti = $_FILES["bukti"]["name"];
    $lokasibukti = $_FILES["bukti"]["tmp_name"];
    $namafiks = date("YmdHis") . $namabukti;
    move_uploaded_file($lokasibukti, "bukti_pembayaran/$namafiks");

    $bank = $_POST["bank"];
    $tanggal = date("Y-m-d");

    //simpan pembayaran
    $koneksi->query("INSERT INTO pembayaran(id_pembelian,bank,tanggal,bukti) VALUES ('$idpem','$bank','$tanggal','$namafiks')");

    //update data pembelian dari pending menjadi sudah kirim pembayaran
    $koneksi->query("UPDATE pembelian SET status_pembelian='sudah kirim pembayaran' WHERE id_pembelian='$idpem'");

    echo "<script>location='history_pesanan.php';</script>";
  }
  ?>

  <!-- Footer -->
  <footer class="page-footer bg-dark font-small stylish-color-dark pt-4" style="color: white">

    <!-- Footer Links -->
    <div class="container text-center text-md-left">

      <!-- Grid row -->
      <div class="row">

        <!-- Grid column -->
        <div class="col-md-3">
          <!-- Content -->
          <img class="img-fluid img-thumbnail" src="images/sidoi.jpeg">
        </div>

        <!-- Grid column -->
        <div class="col-md-3 mx-auto">

          <!-- Content -->
          <h5 class="font-weight-bold mt-3 mb-4">Tentang Kami</h5>

          <hr color="white">

          <p>
            Aplikasi “Si-Do'i” (Solusi Dolan Islami) merupakan sebuah aplikasi yang berguna untuk memudahkan
            peziarah dalam melakukan ziarah wali songo.
          </p>

        </div>
        <!-- Grid column -->

        <hr class="clearfix w-100 d-md-none">

        <!-- Grid column -->
        <div class="col-md-3 mx-auto">

          <!-- Links -->
          <h5 class="font-weight-bold mt-3 mb-4">Kontak Kami</h5>

          <hr color="white">

          <ul class="list-unstyled">
            <p>
              <i class="fas fa-home mr-3"></i> Malang, Indonesia
            </p>
            <p>
              <i class="fas fa-envelope mr-3"></i> sido'i@gmail.com
            </p>
            <p>
              <i class="fas fa-phone mr-3"></i> +6282-301-329-134
            </p>
          </ul>
          <!-- Links -->

        </div>
        <!-- Grid column -->

        <hr class="clearfix w-100 d-md-none">

        <!-- Grid column -->
        <div class="col-md-2 mx-auto">

          <!-- Links -->
          <h5 class="font-weight-bold mt-3 mb-4">Sosial Media</h5>

          <hr color="white">

          <ul class="list-unstyled">
            <li class="list-inline-item">
              <a class="mx-1" href="#">
                <i class="fab fa-facebook-f text-light waves-dark"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a class="mx-1" href="#">
                <i class="fab fa-twitter text-light"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a class="mx-1" href="#">
                <i class="fab fa-instagram text-light"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a class="mx-1" href="#">
                <i class="fab fa-youtube text-light"></i>
              </a>
            </li>
          </ul>

        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-3">

          <!-- Content -->
          <h5 class="font-weight-bold mt-3 mb-4">Partner Pembayaran</h5>
          <hr color="white">

          <img class="img-fluid img-thumbnail" width="60" height="60" src="images/bri.png">
          <img class="img-fluid img-thumbnail" width="70" height="70" src="images/bca.png">
          <img class="img-fluid img-thumbnail" width="90" height="90" src="images/mandiri.png">

        </div>

      </div>
      <!-- Grid row -->

    </div>
    <!-- Footer Links -->

    <hr>

    <!-- Copyright -->
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="text-center mb-3">
            &copy; Copyright 2022 Si-Do'i. All rights reserved.
          </div>
        </div>
      </div>
    </div>
    <!-- Copyright -->

  </footer>
  <!-- Footer -->
</body>

</html>