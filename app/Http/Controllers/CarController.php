<?php

namespace App\Http\Controllers;

use App\Http\Requests\CarRequest;
use App\Models\Car;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CarController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::get();
        $cars = Car::paginate(6);
        return view('car.car', compact('cars', 'categories'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::get();
        return view('car.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(CarRequest $request)
    {
        $params = $request->all();
//dd($params);
        unset($params['image']);
        if ($request->has('image')) {
            $params['image'] = $request->file('image')->store('cars');
        }
        foreach (['new', 'hit', 'stock'] as $fieldName) {
            if (isset($params[$fieldName])) {
                $params[$fieldName] = 1;
            }
        }
        //dd($params['image']);
        $car = Car::create($params);
        return redirect()->route('car.index');
        //dd($params);
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(CarRequest $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Car $car)
    {
        $car->delete();
        return redirect()->route('car.index');
    }

    public function getCars()
    {
        $cars = DB::table('cars')->join('categories', 'categories.id', '=', 'cars.category_id')->select('cars.name', 'cars.price', 'cars.image', 'cars.hit', 'cars.new', 'cars.stock', 'categories.name as category_name')->get();
        return $cars;
    }

    public function sortCars(Request $request)
    {
        $carsQuery = DB::table('cars');
        $carsQuery->join('categories', 'categories.id', '=', 'cars.category_id')->select('cars.name', 'cars.price', 'cars.image', 'cars.hit', 'cars.new', 'cars.stock', 'categories.name as category_name');
        if (!empty($request[0]['priceFrom'])) {
            $carsQuery->where('price', '>=', $request[0]['priceFrom']);
        }
        if (!empty($request[0]['priceTo'])) {
            $carsQuery->where('price', '<=', $request[0]['priceTo']);
        }
        if (!empty($request[0]['cat'])) {
            $cat = DB::table('categories')->where('name', $request[0]['cat'])->first();
            $cat_id = $cat->id;
            $carsQuery->where('category_id', '=', $cat_id);
        }
        foreach (['hit', 'new', 'stock'] as $value) {
            if ($request[0][$value] != 0) {
                $carsQuery->where($value, 1);
            }
        }

        $cars = $carsQuery->get();

        return $cars;
        // return $request[0]['cat'];

    }
}
