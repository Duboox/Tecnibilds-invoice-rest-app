<style lang="scss">
</style>

<template>
    <v-layout column wrap>
        <v-tabs dark grow scrollable>
            <v-toolbar color="blue" dark>
                <v-toolbar-title>{{ pageTitle }}</v-toolbar-title>
                <v-spacer></v-spacer>
                <v-btn icon>
                    <v-icon>more_vert</v-icon>
                </v-btn>
                <v-tabs-bar class="blue" slot="extension">
                    <v-tabs-slider color="yellow"></v-tabs-slider>
                    <v-tabs-item
                            v-for="(item, i) in tabItems"
                            :key="i"
                            :href="'#tab-' + (i + 1)"
                    >
                        {{ item }}
                    </v-tabs-item>
                </v-tabs-bar>
            </v-toolbar>
            <v-tabs-items>
                <v-tabs-content
                        v-for="i in 5"
                        :key="i"
                        :id="'tab-' + i"
                >
                    <v-card flat class="ma-2">
                        <v-card>
                            <v-card-title>
                                <v-flex xs3>
                                    <v-text-field
                                            append-icon="search"
                                            label="Search"
                                            single-line
                                            hide-details
                                            v-model="search"
                                    ></v-text-field>
                                </v-flex>
                                <v-spacer></v-spacer>
                                <v-btn color="primary" @click.stop="productDialogAdd = true">Añadir</v-btn>
                                <v-btn icon>
                                    <v-icon>refresh</v-icon>
                                </v-btn>
                                <v-menu bottom left>
                                    <v-btn icon slot="activator">
                                        <v-icon>more_vert</v-icon>
                                    </v-btn>
                                    <v-list>
                                        <v-list-tile>
                                            <v-list-tile-title>asd</v-list-tile-title>
                                        </v-list-tile>
                                    </v-list>
                                </v-menu>
                            </v-card-title>
                            <v-data-table
                                    :headers="headers"
                                    :search="search"
                                    :items="products.model"
                                    :pagination.sync="pagination"
                                    item-key="name"
                                    class="elevation-1"
                            >
                                <template slot="headers" slot-scope="props">
                                    <tr>
                                        <th v-for="header in props.headers" :key="header.text"
                                            :class="['column sortable', pagination.descending ? 'desc' : 'asc', header.value === pagination.sortBy ? 'active' : '']"
                                            @click="changeSort(header.value)"
                                        >
                                            <v-icon>arrow_upward</v-icon>
                                            {{ header.text }}
                                        </th>
                                    </tr>
                                </template>
                                <template slot="items" slot-scope="props">
                                    <tr>
                                        <td>{{ props.item.name }}</td>
                                        <td class="text-xs-right">{{ props.item.user.name }}</td>
                                        <td class="text-xs-right">{{ props.item.cod }}</td>
                                        <td class="text-xs-right">{{ props.item.description }}</td>
                                        <td class="text-xs-right">{{ props.item.unit_price }}</td>
                                        <td class="text-xs-right">{{ props.item.created_at }}</td>
                                        <td class="text-xs-right">{{ props.item.updated_at }}</td>
                                        <td class="text-xs-right">
                                            <v-btn icon flat color="primary" @click.stop="editProduct(props.item.id)">
                                                <v-icon>edit</v-icon>
                                            </v-btn>
                                            <v-btn icon flat color="primary"
                                                   @click.stop="productDialogDelete = true, selectedProduct=(props.item)">
                                                <v-icon>delete</v-icon>
                                            </v-btn>
                                        </td>
                                    </tr>
                                </template>
                            </v-data-table>
                        </v-card>
                    </v-card>
                </v-tabs-content>
            </v-tabs-items>
        </v-tabs>
        <!-- AÑADIR PRODUCTO DIALOG -->
        <v-dialog v-model="productDialogAdd" max-width="600px">
            <v-card>
                <v-card-title>
                    <span class="headline">Añadir Producto</span>
                    <v-spacer></v-spacer>
                    <v-btn icon @click.stop="productDialogAdd = !productDialogAdd">
                        <v-icon>close</v-icon>
                    </v-btn>
                </v-card-title>
                <v-card-text>
                    <v-container fluid align-content-center justify-center align-center>
                        <v-form>
                            <v-layout row align-content-center justify-center align-center wrap>
                                <v-flex xs5>
                                    <v-text-field
                                            label="Nombre"
                                            v-model="name"
                                            :counter="15"
                                            required
                                    ></v-text-field>
                                </v-flex>
                                <v-spacer></v-spacer>
                                <v-flex xs5>
                                    <v-text-field
                                            label="Codigo REF"
                                            v-model="cod"
                                            :counter="10"
                                            required
                                    ></v-text-field>
                                </v-flex>
                            </v-layout>
                            <v-layout row align-content-center justify-center align-center wrap>
                                <v-flex xs5>
                                    <v-text-field
                                            label="Precio unitario"
                                            v-model="unit_price"
                                            :counter="5"
                                            required
                                    ></v-text-field>
                                </v-flex>
                            </v-layout>
                            <v-layout align-content-center justify-center align-center>
                                <v-flex xs12>
                                    <v-text-field
                                            label="Descripción"
                                            name="description"
                                            multi-line
                                            required
                                    ></v-text-field>
                                </v-flex>
                            </v-layout>
                        </v-form>
                    </v-container>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="primary" flat>Guardar</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
        <v-dialog v-model="productDialogEdit" max-width="500px">
            <v-card>
                <v-card-title>
                    <span class="headline">Editar Producto</span>
                    <v-spacer></v-spacer>
                    <v-btn icon @click.stop="productDialogEdit = !productDialogEdit">
                        <v-icon>close</v-icon>
                    </v-btn>
                </v-card-title>
                <v-card-text>
                    <span>Estas seguro que deseas Editar el producto?</span>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="primary" flat>Guardar</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
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
                    <span>¿Estas seguro que deseas borrar el producto {{ selectedProduct.name }}?</span>
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
                v-model="snackbar"
        >
            {{ successMessage }}
            <v-btn flat color="pink" @click.native="snackbar = false">Close</v-btn>
        </v-snackbar>
    </v-layout>
</template>

<script>
  import {mapGetters, mapActions} from 'vuex';

  export default {
    data () {
      return {
        pageTitle: 'Productos',
        tabItems: [
          'Nuevos', 'Usados', 'Agotados', 'Todos'
        ],
          /* PRODUCTS ACTIONS */
        snackbar: false,
        selectedProduct: null,
        productDialogAdd: false,
        productDialogEdit: false,
        productDialogDelete: false,
        successMessage: '',
          /* PRODUCTS DATA-TABLE */
        pagination: {
          sortBy: 'name',
        },
        search: '',
        headers: [
          {text: 'Nombre del producto', value: 'name'},
          {text: 'Creado por', value: 'user_id'},
          {text: 'Codigo de REF', value: 'cod'},
          {text: 'Descripción', value: 'description'},
          {text: 'Precio unitario', value: 'unit_price'},
          {text: 'Creado en', value: 'created_at'},
          {text: 'Actualizado en', value: 'updated_at'},
          {text: 'Acciones', value: 'actions'}
        ],
      }
    },
    mounted () {
    },
    computed: {
      ...mapGetters({
        products: 'getProducts',
      }),
    },
    created() {
      let vm = this;
      vm.setProducts();
    },
    methods: {
      ...mapActions({
        setProducts: 'setProducts',
      }),
      changeSort (column) {
        if (this.pagination.sortBy === column) {
          this.pagination.descending = !this.pagination.descending
        } else {
          this.pagination.sortBy = column;
          this.pagination.descending = false
        }
      },
      removeProduct(product) {
        let vm = this;
        vm.$Progress.start();
        vm.$store.dispatch('removeProduct', product)
            .then(response => {
              vm.successMessage = '¡Producto Borrado Exitosamente!';
              vm.$Progress.finish();
              vm.removeSuccess();
            })
            .catch(error => {
              vm.$Progress.fail();
            })
      },
      removeSuccess() {
        let vm = this;
        vm.snackbar = true;
      },
    }
  }
</script>


