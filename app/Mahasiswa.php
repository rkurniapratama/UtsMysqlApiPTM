<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Mahasiswa extends Model
{
    protected $table = 'mahasiswa';

    protected $primaryKey = 'nbi';

    public $incrementing = false;
    
    protected $fillable = [
        'nama', 'alamat', 'tgl_lahir', 'prodi', 'jns_kelamin', 'agama'
    ];

    public function hobi()
    {
        return $this->hasMany('App\Hobi', 'nbi', 'nbi');
    }
}
