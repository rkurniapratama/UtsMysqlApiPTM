<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Hobi extends Model
{
    protected $table = 'hobi';

    protected $primaryKey = null;

    public $incrementing = false;
    
    public $timestamps = false;
    
    protected $fillable = [
        'nbi', 'nama_hobi'
    ];

    public function mahasiswa()
    {
        return $this->belongsTo('App\Mahasiswa', 'nbi', 'nbi');
    }
}
