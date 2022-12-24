<h2>Tambah Panduan Doa Ziarah Wali</h2>
<hr color="black">

<form action="ScriptFileUpload.php" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label>Kode Buku</label>
        <input type="text" class="form-control" name="kode">
    </div>
    <div class="form-group">
        <label>Nama Buku</label>
        <input class="form-control" name="nama"></input>
    </div>
    <div class="form-group">
        <label>File</label>
        <input type="file" class="form-control" Accept="Application/Pdf" name="berkas">
    </div>
    <button type="submit" class="btn btn-primary">Simpan</button>
</form>