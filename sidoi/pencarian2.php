<?php
    //koneksi ke database
	include 'koneksi.php';
?>
<?php
	$keyword = $_GET["keyword"];

	$semuadata=array();
	$ambil = $koneksi->query("SELECT * FROM produk WHERE nama_produk LIKE '%$keyword%' OR deskripsi_produk LIKE '%$keyword%'");
	while($pecah = $ambil->fetch_assoc()) {
		$semuadata[]=$pecah;
	}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>Pencarian</title>

	<!-- CSS -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/brands.min.css">
    <link rel="stylesheet" href="assets/css/solid.min.css">

    <!-- JS -->
    <script src = "/scripts/jquery.min.js"></script>
    <script src="assets/js/solid.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/fontawesome.min.js"></script>
    <script src="assets/js/brands.min.js"></script>
</head>
<body>
	<!--Navbar -->
	<nav class="mb-1 navbar navbar-expand-lg navbar-dark bg-dark">
	  <a class="navbar-brand" href="index2.php">Ez Game</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-333"
	    aria-controls="navbarSupportedContent-333" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarSupportedContent-333">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item">
	        <a class="nav-link" href="index2.php">Home</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="login.php">Checkout
	        </a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="login.php">Feedback</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="login.php">Riwayat Belanja</a>
	      </li>
	    </ul>
	    <form action="pencarian2.php" method="get" class="form-inline my-2 my-lg-0">
	      <input class="form-control mr-sm-2" type="search" name="keyword" placeholder="Pencarian" aria-label="Search">
	      <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Cari</button>
	    </form>
	    <ul class="navbar-nav ml-5">
	        <a href="login.php" class="btn btn-outline-light waves-effect btn-md">
	        	<i class="fas fa-sign-in-alt mr-2" aria-hidden="true"></i>Login
	        </a>
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
    <!-- javascript -->

    <!-- konten -->
	<div class="container" style="margin-bottom: 50px;">
		<h2 style="margin-top: 35px;">Hasil Pencarian : <?php echo $keyword ?></h2>

		<hr color="black">

		<?php if (empty($semuadata)) : ?>
			<div class="alert alert-danger">Produk <strong><?php echo $keyword ?></strong> tidak ditemukan</div>
		<?php endif ?>

		<div class="row">

			<?php foreach ($semuadata as $key => $value) : ?>
				
			<div class="col-md-3 mb-5">
				<img class="img-fluid img-thumbnail" src="foto_produk/<?php echo $value['foto_produk'] ?>">
				<div class="caption">
					<h5><?php echo $value['nama_produk'] ?></h5>
					<h6>Rp. <?php echo number_format($value['harga_produk']) ?></h6>
					<a href="detail2.php?id=<?php echo $value['id_produk']; ?>"class="btn btn-primary">Detail</a>
				</div>
			</div>
			
			<?php endforeach ?>

		</div>
	</div>
    <!-- /konten -->

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