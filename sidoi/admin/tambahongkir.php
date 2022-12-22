<h2>Tambah Ongkos Kirim</h2>
<hr color="black">

<form method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label>Nama Pulau</label>
		<input type="text" class="form-control" name="nama">
	</div>
	<div class="form-group">
		<label>Tarif (Rp)</label>
		<input type="number" class="form-control" name="tarif">
	</div>
	<button class="btn btn-primary" name="save">Simpan</button>
</form>
<?php
	if (isset($_POST['save'])) {
		$koneksi->query("INSERT INTO ongkir
			(nama_pulau,tarif)
			VALUES ('$_POST[nama]','$_POST[tarif]')");

		echo "<br><div class='alert alert-info'>Data tersimpan</div>";
		echo "<meta http-equiv='refresh' content='l;url=index.php?halaman=ongkir'>";
	}
?>