<template>
    <div>
        <v-form>
            <v-container>
                <v-row>
                    <v-col
                        cols="4"
                        md="1"
                    >
                        <v-text-field
                            v-model="priceFrom"
                            label="Цена от"
                        ></v-text-field>
                    </v-col>

                    <v-col
                        cols="4"
                        md="1"
                    >
                        <v-text-field
                            v-model="priceTo"
                            label="Цена до"
                        ></v-text-field>
                    </v-col>
                    <v-col
                        cols="4"
                        md="1"
                    >
                        <v-checkbox
                            v-model="hit"
                            label="Хит"
                        ></v-checkbox>
                    </v-col>
                    <v-col
                        cols="4"
                        md="1"
                    >
                        <v-checkbox
                            v-model="new1"
                            label="Новинка"
                        ></v-checkbox>
                    </v-col>
                    <v-col
                        cols="4"
                        md="1"
                    >
                        <v-checkbox
                            v-model="stock"
                            label="Акция"
                        ></v-checkbox>
                    </v-col>
                    <v-col
                        cols="4"
                        md="1"
                    >
                        <v-select
                            v-model="cat"
                            :items="categories"
                            label="Категория"
                            required
                        ></v-select>
                    </v-col>
                </v-row>
            </v-container>
        </v-form>
        <v-btn small @click="sort()" color="success">Сортировать</v-btn>
        <v-btn small @click="show()" color="success">Сбросить фильтер</v-btn>
        <v-container fluid v-if=this.urldata[0]>
            <v-row>
                <v-col cols="6" sm="4" v-for="item in this.urldata">
                    <v-card
                        class="mx-auto"
                        max-width="400"
                    >
                        <v-img
                            class="white--text align-end"
                            height="200px"
                            :src="item.image"

                        >
                            <v-card-title>{{ item.name }}</v-card-title>
                        </v-img>

                        <v-card-subtitle class="pb-0">{{ item.price }}$</v-card-subtitle>

                        <v-card-text class="text--primary">
                            <div>{{ item.category_name}}</div>

                            <div>{{ item.name }}</div>
                            <span v-if="item.hit === 1"> Хит</span><span v-if="item.new === 1"> Новинка</span><span
                            v-if="item.stock === 1"> Акция</span>

                        </v-card-text>


                    </v-card>
                </v-col>

            </v-row>
        </v-container>

    </div>
</template>

<script>
    export default {
        mounted() {
            console.log('загружено')
            axios.post('/api/get-cars').then((response) => {
                this.urldata = response.data

            })
        },
        data() {
            return {
                cat: '',
                priceFrom: '',
                priceTo: '',
                hit: '',
                new1: '',
                stock: '',
                urldata: [],
                sortedData: [],
                categories: [
                    'Mercedes',
                    'BMW',
                    'Nissan',
                    'Audi',
                    'Ford'
                ]
            }
        },
        methods: {
            show() {
                this.priceFrom = '';
                this.priceTo = '';
                this.cat = '';
                this.hit = '';
                this.new1 = '';
                this.stock = '';
                axios.post('/api/get-cars').then((response) => {
                    this.urldata = response.data
                })
            },

            sort() {
                let sortedValues = [
                    {
                        priceFrom: this.priceFrom,
                        priceTo: this.priceTo,
                        hit: this.hit,
                        new: this.new1,
                        stock: this.stock,
                        cat: this.cat
                    }
                ]
                axios.post('/api/sort-cars', sortedValues).then((response) => {
                    this.urldata = response.data
                })
            }
        },
        name: "CarComponent"
    }
</script>

<style scoped>

</style>
