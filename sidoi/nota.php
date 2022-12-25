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

	<title>Sidoi - Nota</title>
	
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

    <style>
	.vl {
	  border-left: 3px solid black;
	  height: 115px;
	  margin-left: 75px;
	}
	</style>
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
	        <a class="nav-link" href="checkout.php">Checkout
	        </a>
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
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
    </script>

    <!-- Konten -->
    <section class="konten">
    	<div class="container" style="margin-bottom: 50px;">
    		<h3 style="margin-top: 35px;">Detail Transaksi</h3>
			<hr color="black">

			<?php
				$ambil = $koneksi->query("SELECT * FROM pembelian JOIN pelanggan
					ON pembelian.email_pelanggan=pelanggan.email_pelanggan
					WHERE pembelian.id_pembelian='$_GET[id]'");
				$detail = $ambil->fetch_assoc();
			?>

			<!-- Jika pelanggan yang beli tidak sama dengan pelanggan yang login akan dilarikan ke nota karena dia tidak berhak melihat nota orang lain -->
			<?php
			//mendapatkan email pelanggan yang beli
			$emailpelangganyangbeli = $detail["email_pelanggan"];

			//mendapatkan email pelanggan yang login
			$emailpelangganyanglogin = $_SESSION["pelanggan"]["email_pelanggan"];

			if ($emailpelangganyangbeli!==$emailpelangganyanglogin) {
				echo "<script>alert('Jangan curang bro!');</script>";
				echo "<script>location='riwayat.php';</script>";
				exit();
			}
			?>

			<div class="row">
				<div class="col-md-3 vl">
					<h4>Pembelian</h4>
					<strong>No. Pembelian: <?php echo $detail['id_pembelian']; ?></strong> <br>
					Tanggal: <?php echo $detail['tanggal_pembelian']; ?> <br>
					Total: Rp. <?php echo number_format($detail['total_pembelian']); ?>
				</div>
				<div class="col-md-3 vl">
					<h4>Pelanggan</h4>
					<strong><?php echo $detail['nama_pelanggan']; ?></strong> <br>
					<p>
						<?php echo $detail['telepon_pelanggan']; ?> <br>
						<?php echo $detail['email_pelanggan']; ?>
					</p>
				</div>
				<div class="col-md-3 vl">
					<h4>Penjemputan</h4>
					<strong><?php echo $detail['tgl_penyusulan']; ?></strong> <br>
					Jam Penjemputan: <?php echo $detail['jam_penyusulan']; ?> <br>
					Alamat: <?php echo $detail['alamat_penyusulan']; ?>
				</div>
			</div>

			<table class="table table-bordered table-responsive-md" style="margin-top: 50px;">
				<thead>
					<tr>
						<th>No</th>
						<th>Nama Paket</th>
						<th>Harga</th>
						<th>Jumlah</th>
						<th>Subtotal</th>
					</tr>
				</thead>
				<tbody>
					<?php $nomor=1; ?>
					<?php $ambil=$koneksi->query("SELECT * FROM pembelian_produk WHERE id_pembelian='$_GET[id]'"); ?>
					<?php while($pecah=$ambil->fetch_assoc()) { ?>
					<tr>
						<td><?php echo $nomor; ?></td>
						<td><?php echo $pecah['nama']; ?></td>
						<td>Rp. <?php echo number_format($pecah['harga']); ?></td>
						<td><?php echo $pecah['jumlah']; ?></td>
						<td>Rp. <?php echo number_format($pecah['subharga']); ?></td>
					</tr>
					<?php $nomor++; ?>
					<?php } ?>
				</tbody>
			</table>
			<div class="row" style="margin-top: 20px;">
				<div class="col-md">
					<div class="alert alert-info">
						<p>
							Silahkan melakukan pembayaran Rp. <?php echo number_format($detail['total_pembelian']); ?> ke 
							<strong>Bank Mandiri 137-001010-1324</strong> 
							atau <strong>Bank BCA 241-002424-4231</strong> 
							atau <strong>Bank BRI 810-001313-1010</strong>
							Atas Nama <strong>Lenka</strong>
						</p>
					</div>
				</div>
			</div>
			<a href="riwayat.php" class="btn btn-primary">Riwayat Belanja</a>
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