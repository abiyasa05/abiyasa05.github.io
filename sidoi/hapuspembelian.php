<?php
    session_start();
    //koneksi ke database
    include 'koneksi.php';

	$ambil = $koneksi->query("SELECT * FROM pembelian WHERE id_pembelian='$_GET[id]'");

    $koneksi->query("DELETE FROM pembelian WHERE id_pembelian='$_GET[id]'");
    $koneksi->query("DELETE FROM pembelian_produk WHERE id_pembelian='$_GET[id]'");

	echo "<script>location='riwayat_pesanan.php';</script>"
?>