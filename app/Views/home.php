<?= $this->extend('master') ?>

<?= $this->section('content') ?>
<div class="row">
    <div class="col-md-12">
        <div class="bg-light p-5 rounded shadow">
            <h1 class="display-4">Bank Indonesia</h1>
            <hr>
            <p>Kami siap melayani anda dengan sepenuh hati, namun tentu saja, agar kondusif harap mengambil nomor antrian sesuai apa yang anda butuhkan. Lalu kami akan segera memanggil anda apabila sudah giliran anda. Terima Kasih</p>
            <a href="<?= base_url() ?>/pelayanan" class="btn btn-warning mt-3">Ambil Antrian</a>
        </div>
    </div>
</div>

<div class="row mt-3 text-center d-flex justify-content-center">
    <h3 class="mb-3">Sedang Proses</h3>
    <?php

    use Config\Database;

    $no = 1;

    foreach ($loket as $key => $value) :
        $bg = "warning";
        
        if ($no % 5 == 0) {
            $bg = "dark";
        } else if ($no % 4 == 0) {
            $bg = "primary";
        } else if ($no % 3 == 0) {
            $bg = "secondary";
        } else if ($no % 2 == 0) {
            $bg = "danger";
        }

        $no++;

        $antrian = Database::connect()->table('antrian')
            ->where('created_at', date('Y-m-d'))
            ->where('loket_id', $value['id_loket'])
            ->where('status', 1)
            ->get()->getRowArray();

        // dd($loket);
    ?>
        <div class="col-md-3 mb-3">
            <div class="card border-<?= $bg ?> bg-transparent">
                <a href="<?= base_url() ?>/loket/detail/<?= $value['id_loket'] ?>/<?= $value['id_pelayanan'] ?>" class="card-header text-light text-decoration-none bg-<?= $bg ?>">
                    <h4 class="m-auto"><?= $value['nama_loket'] ?></h4>
                    <h5 class="m-auto"><?= $value['nama_pelayanan'] ?></h5>
                </a>
                <div class="card-body">
                    <h2 class="my-2"><?= $antrian != NULL ? $antrian['kode_antrian'] : '-' ?></h2>
                </div>
            </div>
        </div>

    <?php endforeach ?>
</div>

<?= $this->endSection(); ?>