<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Carbon\Carbon;
use App\Mahasiswa;
use App\Hobi;

class MahasiswaController extends Controller
{
    public function __construct()
    {
    }

    public function show(Request $request) {
        try {
            $mahasiswa = [];

            if($request->search == '') {
                $mahasiswa = Mahasiswa::select('nbi', 'nama')->get();
            }
            else {
                $mahasiswa = Mahasiswa::where('nbi','LIKE',"%{$request->search}%")
                    ->orWhere('nama','LIKE',"%{$request->search}%")->select('nbi', 'nama')->get();
            }
            
            return response()->json(['status' => 'S', 'message' => 'Berhasil Menampilkan Data Pencarian', 'data_list' => $mahasiswa]);
        }
        catch (\Exception $ex) {
            return response()->json(['status' => 'E', 'message' => $ex->getMessage(), 'data_list' => []]);
        }
    }

    public function detail(Request $request) {
        try {
            $mahasiswa = Mahasiswa::find($request->nbi);
            $mahasiswa->hobi = $mahasiswa->hobi()->pluck('nama_hobi');

            return response()->json(['status' => 'S', 'message' => 'Berhasil Menampilkan Data Detail', 'data' => $mahasiswa]);
        }
        catch (\Exception $ex) {
            return response()->json(['status' => 'E', 'message' => $ex->getMessage(), 'data' => []]);
        }
    } 

    public function insert(Request $request) {
        try {
            DB::beginTransaction();

            $mahasiswa = new Mahasiswa();
            $mahasiswa->nbi = $request->nbi;
            $mahasiswa->nama = $request->nama;
            $mahasiswa->alamat = $request->alamat;
            $mahasiswa->tgl_lahir = $request->tgl_lahir;
            $mahasiswa->prodi = $request->prodi;
            $mahasiswa->jns_kelamin = $request->jns_kelamin;
            $mahasiswa->agama = $request->agama;
            $mahasiswa->save();

            for($i = 0; $i < count($request->hobi); $i++) {
                $hobi = new Hobi();
                $hobi->nama_hobi = $request->hobi[$i];
                $mahasiswa->hobi()->save($hobi);
            }

            DB::commit();
            return response()->json(['status' => 'S', 'message' => 'Data Berhasil Dimasukan']);
        }
        catch (\Exception $ex) {
            DB::rollback();
            return response()->json(['status' => 'E', 'message' => $ex->getMessage()]);
        }
    }

    public function update(Request $request) {
        try {
            DB::beginTransaction();

            $mahasiswa = Mahasiswa::find($request->nbi);
            $mahasiswa->nama = $request->nama;
            $mahasiswa->alamat = $request->alamat;
            $mahasiswa->tgl_lahir = $request->tgl_lahir;
            $mahasiswa->prodi = $request->prodi;
            $mahasiswa->jns_kelamin = $request->jns_kelamin;
            $mahasiswa->agama = $request->agama;
            $mahasiswa->save();

            $mahasiswa->hobi()->delete();

            for($i = 0; $i < count($request->hobi); $i++) {
                $hobi = new Hobi();
                $hobi->nama_hobi = $request->hobi[$i];
                $mahasiswa->hobi()->save($hobi);
            }

            DB::commit();
            return response()->json(['status' => 'S', 'message' => 'Data Berhasil Diedit']);
        }
        catch (\Exception $ex) {
            DB::rollback();
            return response()->json(['status' => 'E', 'message' => $ex->getMessage()]);
        }
    }

    public function delete(Request $request) {
        try {
            DB::beginTransaction();

            Mahasiswa::destroy($request->nbi);

            DB::commit();
            return response()->json(['status' => 'S', 'message' => 'Data Berhasil Dihapus']);
        }
        catch (\Exception $ex) {
            DB::rollback();
            return response()->json(['status' => 'E', 'message' => $ex->getMessage()]);
        }
    }
}
