<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Car extends Model
{
    protected $fillable = ['name', 'category_id', 'price', 'image', 'new', 'hit', 'stock'];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }
//    public function setNewAttribute($value)
//    {
//        dd($value);
//    }

    public function isNew()
    {
        return $this->new === 1;
    }
    public function isHit()
    {
        return $this->hit === 1;
    }
    public function isStock()
    {
        return $this->stock === 1;
    }
}
