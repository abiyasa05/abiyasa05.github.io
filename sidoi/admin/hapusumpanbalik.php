<?php
	$ambil = $koneksi->query("SELECT * FROM umpanbalik WHERE id_umpanbalik='$_GET[id]'");

	$koneksi->query("DELETE FROM umpanbalik WHERE id_umpanbalik='$_GET[id]'");

	echo "<script>location='index.php?halaman=umpanbalik';</script>"
?>