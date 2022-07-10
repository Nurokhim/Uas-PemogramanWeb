<?= $this->extend('master') ?>

<?= $this->section('content') ?>

<div class="row mt-5">
    <div class="col-xl-4 col-md-6 col-sm-8 col-10 mx-auto">
        <div class="card">
            <form action="<?= base_url() ?>/tambah-loket" method="post">
                <div class="card-header">
                    <h2 class="my-3 text-center">Tambah Loket</h2>
                </div>

                <div class="card-body py-4">
                    <div class="mb-3">
                        <label for="" class="form-label">Nama Loket</label>
                        <input type="text" class="form-control" name="nama_loket" placeholder="Contoh: Loket 1" value="<?= old('nama_loket') ?>">
                    </div>

                    <div class="mb-3">
                        <label for="" class="form-label">Melayani</label>
                        <select name="pelayanan_id" id="" class="form-select">
                            <option value="">- Pilih Pelayanan -</option>
                            <?php foreach ($pelayanan as $row) : ?>
                                <option value="<?= $row['id_pelayanan'] ?>"><?= $row['nama_pelayanan'] ?></option>
                            <?php endforeach ?>
                        </select>
                    </div>
                </div>

                <div class="card-footer p-3">
                    <button type="submit" class="btn btn-warning">Tambah Loket</button>
                </div>
            </form>
        </div>

    </div>
</div>
<?= $this->endSection() ?>