<h2>Ongkos Kirim</h2>
<hr color="black">

<table class="table table-bordered table-responsive-md">
	<thead>
		<tr>
			<th>No</th>
			<th>Nama Pulau</th>
			<th>Tarif</th>
			<th>Aksi</th>
		</tr>
	</thead>
	<tbody>
		<?php $nomor=1; ?>
		<?php $ambil=$koneksi->query("SELECT * FROM ongkir"); ?>
		<?php while ($pecah=$ambil->fetch_assoc()) { ?>
		<tr>
			<td><?php echo $nomor; ?></td>
			<td><?php echo $pecah['nama_pulau']; ?></td>
			<td><?php echo $pecah['tarif']; ?></td>
			<td>
                <a href="index.php?halaman=hapusongkir&id=<?php echo $pecah['id_ongkir']; ?>" class="btn btn-danger" onclick="return confirm('Apakah anda yakin ingin menghapus ini?')">Hapus</a>
			</td>
		</tr>
		<?php $nomor++; ?>
		<?php } ?>
	</tbody>
</table>
<a href="index.php?halaman=tambahongkir" class="btn btn-primary">Tambah Ongkos Kirim</a>