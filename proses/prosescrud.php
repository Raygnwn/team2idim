<?php 
class prosesCrud {

    protected $db;
    function __construct($db){
        $this->db = $db;
    }

    function proses_login($user,$pass)
    {
        // untuk password kita enkrip dengan md5
        $row = $this->db->prepare('SELECT * FROM pengguna WHERE NamaPengguna=? AND password=?');
        $row->execute(array($user,$pass));
        $count = $row->rowCount();
        var_dump($row);
        if($count > 0)
        {
            return $hasil = $row->fetch();
        }else{
            return 'gagal';
        }
    }

    // variable $tabel adalah isi dari nama table database yang ingin ditampilkan
    // menampilkan tabel barang berdasarkan user_id
    function tampil_data_barang($tabel,$user_id)
    {
        $row = $this->db->prepare("SELECT * FROM $tabel where IdPengguna = ?");
        $row->execute(array($user_id));
        return $hasil = $row->fetchAll();
    }    
    
    // variable $tabel adalah isi dari nama table database yang ingin ditampilkan
    function tampil_data($tabel)
    {
        $row = $this->db->prepare("SELECT * FROM $tabel");
        $row->execute();
        return $hasil = $row->fetchAll();
    }

    // variable $tabel adalah isi dari nama table database yang ingin ditampilkan
    // variable where adalah isi kolom tabel yang mau diambil
    // variable id adalah id yang mau di ambil
    
    function tampil_data_id($tabel,$where,$id)
    {
        $row = $this->db->prepare("SELECT * FROM $tabel WHERE $where = ?");
        $row->execute(array($id));
        $hasil = $row->fetch();
        return $hasil;
    }
    function tambah_data_barang($tabel,$data)
    {
        // buat array untuk isi values insert sumber kode 
        // http://thisinterestsme.com/pdo-prepared-multi-inserts/
        $rowsSQL = array();
        // buat bind param Prepared Statement
        $toBind = array();
        // list nama kolom
        $columnNames = array_keys($data[0]);
        // looping untuk mengambil isi dari kolom / values
        // print_r($data);
        foreach($data as $arrayIndex => $row){
            $params = array();
            foreach($row as $columnName => $columnValue){
                $param = ":" . $columnName . $arrayIndex;
                $params[] = $param;
                $toBind[$param] = $columnValue;
            }
            $rowsSQL[] = "(" . implode(", ", $params) . ")";
        }
        $sql = "INSERT INTO $tabel (" . implode(", ", $columnNames) . ") VALUES " . implode(", ", $rowsSQL);
        // print_r($sql);
        // $row = $this->db->prepare($sq); // ini buat tracing
        $row = $this->db->prepare($sql); 
        //Bind our values.
        foreach($toBind as $param => $val){
            $row ->bindValue($param, $val);
        }
        //Execute our statement (i.e. insert the data).
        return $row ->execute();
    }

    function edit_data_barang($tabel,$data,$where,$id)
    {

        $setPart = array();
        foreach ($data as $key => $value)
        {
            $setPart[] = $key."=:".$key;
        }
        $sql = "UPDATE $tabel SET ".implode(', ', $setPart)." WHERE $where = :id";
        $row = $this->db->prepare($sql);
        //Bind our values.
        $row ->bindValue(':id',$id); // where
        foreach($data as $param => $val)
        {
            $row ->bindValue($param, $val);
        }
        return $row ->execute();
    }

    function hapus_data_barang($tabel,$where,$id)
    {
        $sql = "DELETE FROM $tabel WHERE $where = ?";
        $row = $this->db->prepare($sql);
        return $row ->execute(array($id));
    }

    /*
    function tambah_data($tabel,$data)
    {
        // buat array untuk isi values insert sumber kode 
        // http://thisinterestsme.com/pdo-prepared-multi-inserts/
        $rowsSQL = array();
        // buat bind param Prepared Statement
        $toBind = array();
        // list nama kolom
        $columnNames = array_keys($data[0]);
        // looping untuk mengambil isi dari kolom / values
        foreach($data as $arrayIndex => $row){
            $params = array();
            foreach($row as $columnName => $columnValue){
                $param = ":" . $columnName . $arrayIndex;
                $params[] = $param;
                $toBind[$param] = $columnValue;
            }
            $rowsSQL[] = "(" . implode(", ", $params) . ")";
        }
        $sql = "INSERT INTO $tabel (" . implode(", ", $columnNames) . ") VALUES " . implode(", ", $rowsSQL);
        $row = $this->db->prepare($sql);
        //Bind our values.
        foreach($toBind as $param => $val){
            $row ->bindValue($param, $val);
        }
        //Execute our statement (i.e. insert the data).
        return $row ->execute();
    }

    function edit_data($tabel,$data,$where,$id)
    {
        // sumber kode 
        // https://stackoverflow.com/questions/23019219/creating-generic-update-function-using-php-mysql
        $setPart = array();
        foreach ($data as $key => $value)
        {
            $setPart[] = $key."=:".$key;
        }
        $sql = "UPDATE $tabel SET ".implode(', ', $setPart)." WHERE $where = :id";
        $row = $this->db->prepare($sql);
        //Bind our values.
        $row ->bindValue(':id',$id); // where
        foreach($data as $param => $val)
        {
            $row ->bindValue($param, $val);
        }
        return $row ->execute();
    }

    function hapus_data($tabel,$where,$id)
    {
        $sql = "DELETE FROM $tabel WHERE $where = ?";
        $row = $this->db->prepare($sql);
        return $row ->execute(array($id));
    }
    */
        // mencari kalkulasi keuntungan per barang
        function kalkulasi_keuntungan()
        {
            $row = $this->db->prepare("SELECT 
                                        b.NamaBarang,
                                        tbeli.jmlbarangbeli,
                                        tjual.jmlbarangjual,
                                        tbeli.jmlbarangbeli - tjual.jmlbarangjual stok,
                                        b.satuan,
                                        tjual.hargatotperitem - tbeli.hargatotperitem keuntungan
                                      FROM 
                                        (select totbeli.idbarang,
                                            sum(totbeli.jumlahpembelian) jmlbarangbeli,
                                            sum(totbeli.hargatotbeli) hargatotperitem
                                         from (select b.IdBarang,
                                                pem.jumlahpembelian,
                                                pem.hargabeli,
                                                pem.jumlahpembelian*pem.hargabeli as hargatotbeli 
                                               from barang b,
                                                    pembelian pem
                                               where b.IdBarang = pem.idbarang) totbeli
                                               GROUP by totbeli.idbarang) tbeli,
                                              (select totjual.idbarang,
                                                      sum(totjual.jumlahpenjualan) jmlbarangjual,
                                                      sum(totjual.hargatotjual) hargatotperitem
                                               from (select b.IdBarang,
                                                      pen.jumlahpenjualan,
                                                      pen.hargajual,
                                                      pen.jumlahpenjualan*pen.hargajual as 
                                                      hargatotjual 
                                                    from barang b,
                                                        penjualan pen
                                                    where b.IdBarang = pen.idbarang) totjual
                                                    GROUP by totjual.idbarang) tjual,
                                         barang b
                                        where b.IdBarang = tbeli.idbarang 
                                        and b.IdBarang = tjual.idbarang");
            $row->execute();
            $hasil = $row->fetchall();
            return $hasil;
        }

}
        