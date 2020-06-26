<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CarRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required|min:2|max:30',
            'price' => 'required',
            'category_id' => 'required',
            'image' => 'required'
        ];
    }
    public function messages()
    {
        return [
            'required' => 'Поле :attribute обязательно для ввода',
            'min' => 'Поле :attribute должно иметь минимум :min символов',
            'max' => 'Поле :attribute должно иметь максимум :max символов',
            'name.min' => 'Поле имя должно содержать минимум 2 символа ',
            'image.required' => 'Без загруженной картинки сохранять нелья'
        ];
    }
}
