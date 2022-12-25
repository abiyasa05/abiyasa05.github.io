<?php
session_start();
//script koneksi
include "koneksi.php";
// 
//jika belum login akan dilarikan ke halaman login
if (!isset($_SESSION["pelanggan"])) {
    echo "<script>alert('Silahkan login dulu!');</script>";
	echo "<script>location='login.php';</script>";
}

//mendapatkan id produk dari url
$id_produk = $_GET["id"];

//query ambil data
$ambil = $koneksi->query("SELECT * FROM produk WHERE id_produk='$id_produk'");
$detail = $ambil->fetch_assoc();
?>
<?php
	$ambil=$koneksi->query("SELECT * FROM profil");
	$em=$ambil->fetch_assoc();
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>Detail Produk</title>
	
	<!-- CSS -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/brands.min.css">
    <link rel="stylesheet" href="assets/css/solid.min.css">

    <!-- JS -->
    <script src="assets/js/solid.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/fontawesome.min.js"></script>
    <script src="assets/js/brands.min.js"></script>
</head>
<body>
	<!--Navbar -->
	<nav class="mb-1 navbar navbar-expand-lg navbar-dark bg-dark">
	  <a class="navbar-brand" href="index.php">Ez Game</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-333"
	    aria-controls="navbarSupportedContent-333" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarSupportedContent-333">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item">
	        <a class="nav-link" href="index.php">Home</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="checkout.php">Checkout</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="feedback.php">Feedback</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="riwayat.php">Riwayat Belanja</a>
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
	        <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown"
	          aria-haspopup="true" aria-expanded="false">
	          <?php echo $_SESSION["pelanggan"]["nama_pelanggan"] ?></a>
	        <div class="dropdown-menu dropdown-menu-right dropdown-info" aria-labelledby="navbarDropdownMenuLink-4">
	          <a class="dropdown-item" href="profil.php?email=<?php echo $_SESSION["pelanggan"]["email_pelanggan"]; ?>">Profile</a>
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
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
    </script>

    <!-- Konten -->
    <section class="konten">
		<div class="container" style="margin-bottom: 50px;">
			<h2 style="margin-top: 35px;">Detail Produk</h2>

			<hr color="black">

			<div class="row">
				<div class="col-md-6">
					<img class="img-fluid" src="foto_produk/<?php echo $detail["foto_produk"]; ?>" style="margin-top: 40px;">
				</div>
				<div class="col-md-6">
					<h3 style="margin-top: 40px;"><?php echo $detail["nama_produk"]; ?></h3>
					<p style="margin-top: 30px;"><?php echo $detail["deskripsi_produk"]; ?></p>
					<h6 style="margin-top: 10px;">Stok: <?php echo $detail["stok_produk"]; ?></h6>
					<h5 style="margin-top: 10px;">Rp. <?php echo number_format($detail["harga_produk"]); ?></h5>
					<h6><label style="margin-top: 25px;">Jumlah orang</label></h6>
					<form method="post" class="form-inline">
						<div class="form-group">
					    	<input type="number" value="0" min="1" max="<?php echo $detail["stok_produk"]; ?>" class="form-control mb-2" name="jumlah">
					    	<div class="input-group-btn mb-2">
					    		<button class="btn btn-primary" name="beli">Beli</button>
								<a href="tambahwishlist.php?id=<?php echo $detail["id_produk"]; ?>" class="btn btn-primary"><i class="fas fa-bookmark"></i></a>
							</div>
				  		</div>
					</form>

					<?php 
					//jika tombol beli ditekan
					if (isset($_POST["beli"])) {
						//mendapatkan jumlah yang diinputkan
						$id_produk = $_GET["id"];
						$jumlah = $_POST["jumlah"];
						//masukkan di keranjang belanja
						$emailpelanggan = $_SESSION["pelanggan"]["email_pelanggan"];
						$nama=$detail['nama_produk'];
						$harga=$detail['harga_produk'];
						
						$data = $koneksi->query("SELECT * FROM keranjang WHERE email_pelanggan='$emailpelanggan' 
							AND id_produk='$id_produk'");
    
						$jum = mysqli_num_rows($data);

							if ($jum==1) {
								//mengubah data ke dalam tabel umpanbalik
								$koneksi->query("UPDATE keranjang SET jumlah='$jumlah' 
									WHERE email_pelanggan='$emailpelanggan' AND id_produk='$id_produk'");

								echo "<script>location='keranjang.php';</script>";
							}
							else {
								//menyimpan data ke dalam tabel umpanbalik
								$koneksi->query("INSERT INTO keranjang (email_pelanggan,id_produk,jumlah) 
									VALUES ('$emailpelanggan','$id_produk','$jumlah')");

								echo "<script>location='keranjang.php';</script>";
							}
					}
					?>

				</div>
			</div>
			<h5>Komentar</h5>
			<hr color="black">
				<div class="row">
					<div class="col-md-12">
						<form method="post" action="proses_komentar.php?id=<?= $id_produk?>">
							<div class="form-group">
								<textarea name="komentar" class="form-control" rows="3" placeholder="Masukkan komentar disini..."></textarea>
								<button class="btn btn-primary mt-3" name="kirim">Kirim</button>	
							</div>
						</form>
					</div>
				</div>
			<h5 class="mt-4">Hasil Komentar</h5>
			<hr color="black">

				<div class="row">
					<div class="col-md-12">
						<?php $row = $koneksi->query("SELECT * FROM komentar WHERE id_produk='$id_produk'"); ?>
						<?php while($komen = $row->fetch_assoc()) { ?>
						<h5><?php echo $komen['email_pelanggan'] ?></h5>
						<p><?php echo $komen['komentar'] ?></p>
						<hr color="black">
						<?php } ?>
					</div>
				</div>
		</div>
		
	</section>
	<!-- Konten -->

	<!-- Footer -->
	<footer class="page-footer bg-dark font-small stylish-color-dark pt-4" style="color: white">

	  <!-- Footer Links -->
	  <div class="container text-center text-md-left">

	    <!-- Grid row -->
	    <div class="row">

	      <!-- Grid column -->
	      <div class="col-md-4 mx-auto">

	        <!-- Content -->
	        <h5 class="font-weight-bold mt-3 mb-4">Tentang Kami</h5>

	        <hr color="white">

	        <p>
	        	Ez Game merupakan web toko online yang menjual dvd game play station 4. Kami membuat web ini
	        	agar orang - orang tidak kesulitan untuk membeli dvd game.
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
          		<i class="fas fa-envelope mr-3"></i> ezgame@gmail.com
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
	  					&copy; 2019 Ez Game. All Rights Reserved.
	  				</div>
	  			</div>
	  		</div>
	  </div>
	  <!-- Copyright -->

	</footer>
	<!-- Footer -->
</body>
</html>