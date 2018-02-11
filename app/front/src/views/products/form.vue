<style lang="scss" scoped>
    .products-image-card {
        max-width: 250px;
        max-height: 250px;
    }

    .product-image {
        width: 200px;
        height: 200px;
    }

    .product-image-name {
        display: block;
        width: 150px;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
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
                    <v-btn icon to="/products">
                        <v-icon>arrow_back</v-icon>
                    </v-btn>
                </v-card-title>
                <v-container grid-list-md fluid>
                    <v-layout align-content-center justify-center align-center wrap>
                        <v-flex xs10 md10 lg10>
                            <v-form>
                                <!-- File Input here -->
                                <input v-show="false" ref="fileInput" id="file" type="file" accept=".png, .jpg, .jpeg"
                                       @change="previewFiles">
                                <v-layout row wrap>
                                    <v-layout align-content-center justify-center align-center>
                                        <v-flex>
                                            <v-card class="products-image-card elevation-5">
                                                <v-card-media class="mt-2">
                                                    <v-layout align-content-center justify-center align-center>
                                                        <img v-if="!image" class="product-image"
                                                             :src="ApiProductsPics + product.model.picture"
                                                             :alt="product.model.name">
                                                        <img v-if="image" class="product-image"
                                                             :src="image"
                                                             :alt="product.model.name">
                                                    </v-layout>
                                                </v-card-media>
                                                <v-card-actions color="primary">
                                                    <span class="caption grey--text product-image-name"></span>
                                                    <v-spacer></v-spacer>
                                                    <v-btn icon flat v-if="image" v-on:click="removeImage()">
                                                        <v-icon>close</v-icon>
                                                    </v-btn>
                                                    <v-btn icon flat v-if="!image" v-on:click="openFileInput()">
                                                        <v-icon>add</v-icon>
                                                    </v-btn>
                                                </v-card-actions>
                                            </v-card>
                                        </v-flex>
                                    </v-layout>
                                    <v-spacer></v-spacer>
                                    <v-layout column>
                                                    <v-text-field
                                                            label="Nombre"
                                                            v-model="product.model.name"
                                                            :counter="25"
                                                            required
                                                    ></v-text-field>
                                        <v-flex>
                                            <v-text-field
                                                    label="Descripción"
                                                    v-model="product.model.description"
                                                    :counter="200"
                                                    required
                                                    multi-line
                                            ></v-text-field>
                                        </v-flex>
                                    </v-layout>
                                </v-layout>
                                <v-layout row justify-space-around wrap>
                                    <v-flex xs10 md6 lg3>
                                        <v-text-field
                                                label="Marca"
                                                v-model="product.model.brand"
                                                :counter="15"
                                                required
                                        ></v-text-field>
                                    </v-flex>
                                    <v-flex xs10 md6 lg3>
                                        <v-text-field
                                                label="Calificación"
                                                v-model="product.model.rating"
                                                :counter="1"
                                                required
                                        ></v-text-field>
                                    </v-flex>
                                    <v-flex xs10 md6 lg3>
                                        <v-text-field
                                                label="Nº en stock"
                                                v-model="product.model.stock"
                                                :counter="4"
                                                required
                                        ></v-text-field>
                                    </v-flex>
                                </v-layout>
                                <v-layout row justify-space-around wrap>
                                    <v-flex xs10 md6 lg3>
                                        <v-text-field
                                                label="COD REF"
                                                v-model="product.model.cod"
                                                :counter="8"
                                                required
                                        ></v-text-field>
                                    </v-flex>
                                    <v-flex xs10 md6 lg3>
                                        <v-text-field
                                                label="Precio"
                                                v-model="product.model.unit_price"
                                                :counter="5"
                                                required
                                        ></v-text-field>
                                    </v-flex>
                                </v-layout>
                            </v-form>
                        </v-flex>
                    </v-layout>
                </v-container>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn v-if="mode === 'edit'" color="primary" v-on:click="saveEditedProduct()" flat>Guardar</v-btn>
                    <v-btn v-else color="primary" v-on:click="saveCreatedProduct()" flat>Crear</v-btn>
                </v-card-actions>
            </v-card>
        </v-container>
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
        pageTitle: 'Añadir Producto',
        ApiProductsPics: this.$configs.ApiUrl + 'images/products/',
        snackBar: false,
        successMessage: '',
        dbImageTmp: '',
        image: '',
        mode: this.$route.meta.mode,
      }
    },
    created() {
      if (this.mode === 'edit') {
        this.pageTitle = 'Editar Producto';
        this.setProduct(this.$route.params.id);
      }
      this.product.model.picture = 'default.png';
    },
    beforeDestroy() {
        this.removeSelectedProduct();
    },
    computed: {
      ...mapGetters({
        product: 'getProduct',
      }),
    },
    methods: {
      ...mapActions({
        removeSelectedProduct: 'removeSelectedProduct'
      }),
      setProduct(product) {
        let vm = this;
        vm.$Progress.start();
        vm.$store.dispatch('setProduct', product)
            .then(response => {
              vm.$Progress.finish();
            })
            .catch(error => {
              vm.$Progress.fail();
            })
      },
      openFileInput() {
        this.$refs.fileInput.click()
      },
      previewFiles(e) {
        var files = e.target.files || e.dataTransfer.files;
        if (!files.length)
          return;
        this.createImage(files[0]);
      },
      createImage(file) {
        var image = new Image();
        var reader = new FileReader();
        var vm = this;

        reader.onload = (e) => {
          vm.image = e.target.result;
          vm.dbImageTmp = vm.product.model.picture;
          vm.product.model.picture = file.name;
        };
        reader.readAsDataURL(file);
      },
      removeImage: function (e) {
        if (this.$route.meta.mode === 'edit') {
          this.product.model.picture = this.dbImageTmp;
        }
        this.product.model.picture = 'default.png';
        this.image = '';
      },
      saveEditedProduct() {
        let vm = this;
        vm.$Progress.start();
        let product = vm.product;
        if(vm.image){
          product.model.picture = vm.image;
        }
        vm.$store.dispatch('saveEditProduct', product)
            .then(response => {
              vm.$Progress.finish();
              vm.successMessage = '¡Producto editado exitosamente!'
              vm.snackBar = true;
            })
            .catch(error => {
              vm.$Progress.fail();
            })
      },
      saveCreatedProduct() {
        let vm = this;
        vm.$Progress.start();
        let product = vm.product;
        product.model.picture = vm.image;
        product.model.user_id = vm.$store.state.users.authenticatedUser.id;
        console.log(product);
        vm.$store.dispatch('saveProduct', product)
            .then(response => {
              vm.$Progress.finish();
              vm.successMessage = '¡Producto creado exitosamente!'
              vm.snackBar = true;
            })
            .catch(error => {
              vm.$Progress.fail();
            })
      },
    },
  }
</script>


