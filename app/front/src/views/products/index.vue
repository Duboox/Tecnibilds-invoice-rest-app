<style lang="scss" scoped>
    .products-card {
        max-width: 200px;
    }

    .products-card-media {
        max-width: 200px;
        max-height: 200px;
    }
</style>

<template>
    <v-layout column wrap>
        <v-toolbar color="blue" dark>
            <v-toolbar-title>{{ pageTitle }}</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-btn icon>
                <v-icon>more_vert</v-icon>
            </v-btn>
        </v-toolbar>
        <!-- Personal Cards -->
        <v-container>
            <v-card class="elevation-4">
                <v-card-title>
                    <v-flex xs5>
                        <v-text-field
                                append-icon="search"
                                v-model="search"
                                label="Buscar Producto"
                                single-line
                                hide-details
                        ></v-text-field>
                    </v-flex>
                    <v-spacer></v-spacer>
                    <v-btn icon to="/product/create">
                        <v-icon>add</v-icon>
                    </v-btn>
                </v-card-title>
                <v-container fluid grid-list-xl>
                    <v-layout align-center wrap>
                        <v-flex v-for="(product,i) in filteredProducts" :key="i">
                            <v-card class="ma-3 products-card">
                                <v-card-media class="products-card-media">
                                    <img :src="ApiProductsPics + product.picture" :alt="product.name"/>
                                </v-card-media>
                                <v-card-title primary-title>
                                    <v-layout column align-content-center justify-center align-center>
                                        <h3 class="subheading mb-0">{{ product.name }}</h3>
                                        <div class="caption grey--text">{{ product.brand }}</div>
                                        <div class="caption grey--text">COD REF: {{ product.cod }}</div>
                                    </v-layout>
                                </v-card-title>
                                <v-card-text>
                                    <v-layout align-content-center justify-center align-center>
                                        <v-flex xs11>
                                            <div class="caption">{{product.description}}</div>
                                        </v-flex>
                                    </v-layout>
                                    <v-layout align-content-center justify-center align-center>
                                        <span class="group">
                                            <span v-for="n in maxStars" :key="n">
                                                <v-icon v-if="n <= product.rating" color="primary">star</v-icon>
                                                <v-icon v-if="n > product.rating">star</v-icon>
                                            </span>
                                        </span>
                                    </v-layout>
                                </v-card-text>
                                <v-card-actions class="white">
                                    <div class="subheading">{{ product.unit_price }}$</div>
                                    <v-spacer></v-spacer>
                                    <v-btn icon flat color="primary" :to="'/product/edit/' + product.id">
                                        <v-icon>edit</v-icon>
                                    </v-btn>
                                    <v-btn icon flat color="red"
                                           @click.stop="productDialogDelete = true, selectedProduct=(product)">
                                        <v-icon>delete</v-icon>
                                    </v-btn>
                                </v-card-actions>
                            </v-card>
                        </v-flex>
                    </v-layout>
                </v-container>
            </v-card>
        </v-container>
        <v-dialog v-if="selectedProduct" v-model="productDialogDelete" max-width="500px">
            <v-card>
                <v-card-title>
                    <span class="headline">Borrar Producto</span>
                    <v-spacer></v-spacer>
                    <v-btn icon @click.stop="productDialogDelete = !productDialogDelete">
                        <v-icon>close</v-icon>
                    </v-btn>
                </v-card-title>
                <v-card-text>
                    <span>¿Estas seguro que deseas borrar el producto <span class="body-2">{{ selectedProduct.name }}</span>?</span>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="primary"
                           flat
                           v-on:click="removeProduct(selectedProduct), productDialogDelete = false">
                        Borrar
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
        <v-snackbar
                :timeout="3000"
                bottom
                v-model="snackBar"
        >
            {{ successMessage }}
            <v-btn flat color="pink" @click.native="snackBar = false">Close</v-btn>
        </v-snackbar>
    </v-layout>
</template>

<script>
  import {mapGetters, mapActions} from 'vuex';

  export default {
    data () {
      return {
        pageTitle: 'Products',
        ratingClass: null,
        ApiProductsPics: this.$configs.ApiUrl + 'images/products/',
        search: '',
        maxStars:5,
        snackBar: false,
        selectedProduct: null,
        productDialogDelete: false,
        successMessage: '',
      }
    },
    mounted () {
    },
    computed: {
      ...mapGetters({
        products: 'getProducts',
      }),
      filteredProducts: function () {
        return this.products.model.filter((product) => {
          return product.name.toLowerCase().match(this.search);
        }).reverse();
      }
    },
    created() {
      let vm = this;
      vm.setProducts();
    },
    methods: {
      setProducts() {
        let vm = this;
        vm.$Progress.start();
        vm.$store.dispatch('setProducts')
            .then(response => {
              vm.$Progress.finish();
            })
            .catch(error => {
              vm.$Progress.fail();
            })
      },
      removeProduct(product) {
        let vm = this;
        vm.$Progress.start();
        vm.$store.dispatch('removeProduct', product)
            .then(response => {
              vm.successMessage = '¡Producto Borrado Exitosamente!';
              vm.snackBar = true;
              vm.$Progress.finish();
            })
            .catch(error => {
              vm.$Progress.fail();
            })
      },
      showRating(rating){ // 1-5
        let vm = this;
        if (rating >= 1) {
          vm.ratingClass = "primary"
        }
      }
    }
  }
</script>


