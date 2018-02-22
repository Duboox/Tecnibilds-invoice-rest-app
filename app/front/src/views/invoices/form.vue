<style lang="scss">
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
        <v-card flat class="ma-2">
            <v-card>
                <v-card-title>
                    <v-flex xs6>
                        <v-btn icon to="/invoices">
                            <v-icon>arrow_back</v-icon>
                        </v-btn>
                    </v-flex>
                </v-card-title>
                <v-container grid-list-md fluid>
                    <v-layout align-content-center justify-center align-center wrap>
                        <v-flex xs10 md10 lg10>
                            <v-layout row justify-space-around wrap class="pb-2">
                                <v-flex xs6 md3 lg3>
                                    <v-layout column>
                                        <span class="title">Factura No.</span>
                                        <v-flex xs10>
                                            <v-text-field
                                                    :counter="10"
                                                    required
                                            ></v-text-field>
                                        </v-flex>
                                    </v-layout>
                                </v-flex>
                                <v-flex xs6 md3 lg3>
                                    <v-layout column>
                                        <span class="title">Titulo</span>
                                        <v-flex xs10>
                                            <v-text-field
                                                    v-model="invoice.model.title"
                                                    :counter="20"
                                                    required
                                            ></v-text-field>
                                        </v-flex>
                                    </v-layout>
                                </v-flex>
                                <v-flex xs6 md3 lg3>
                                    <v-layout column>
                                        <span class="title">Empresa</span>
                                        <v-flex xs10>
                                            <v-select
                                                    :items="customers.model"
                                                    v-model="invoice.model.customer"
                                                    item-text="company"
                                                    item-value="id"
                                                    label="Selecciona"
                                                    return-object
                                                    single-line
                                                    bottom
                                            ></v-select>
                                        </v-flex>
                                    </v-layout>
                                </v-flex>
                                <v-flex xs6 md3 lg3>
                                    <v-layout column>
                                        <span class="title">Nombre Cliente</span>
                                        <v-flex xs10>
                                            <v-text-field
                                                    v-model="invoice.model.customer.name"
                                                    disabled
                                            ></v-text-field>
                                        </v-flex>
                                    </v-layout>
                                </v-flex>
                            </v-layout>
                            <v-layout row justify-space-around wrap class="pb-2">
                                <v-flex xs6 md3 lg3>
                                    <v-layout column>
                                        <span class="title">Dirección Cliente</span>
                                        <v-flex xs10>
                                            <v-text-field
                                                    v-model="invoice.model.customer.address"
                                                    disabled
                                            ></v-text-field>
                                        </v-flex>
                                    </v-layout>
                                </v-flex>
                                <v-flex xs6 md3 lg3>
                                    <v-layout column>
                                        <span class="title">Fecha factura</span>
                                        <v-flex xs10>
                                            <v-menu
                                                    ref="menuDate"
                                                    lazy
                                                    :close-on-content-click="false"
                                                    v-model="menuDate"
                                                    transition="scale-transition"
                                                    offset-y
                                                    full-width
                                                    :nudge-right="40"
                                                    min-width="290px"
                                                    :return-value.sync="date"
                                            >
                                                <v-text-field
                                                        slot="activator"
                                                        label="Selecciona Fecha"
                                                        v-model="invoice.model.date"
                                                        prepend-icon="event"
                                                        readonly
                                                ></v-text-field>
                                                <v-date-picker v-model="invoice.model.date" no-title scrollable>
                                                    <v-spacer></v-spacer>
                                                    <v-btn flat color="primary" @click="menu = false">Cancel</v-btn>
                                                    <v-btn flat color="primary" @click="$refs.menuDate.save(date)">OK
                                                    </v-btn>
                                                </v-date-picker>
                                            </v-menu>
                                        </v-flex>
                                    </v-layout>
                                </v-flex>
                                <v-flex xs6 md3 lg3>
                                    <v-layout column>
                                        <span class="title">Fecha Limite</span>
                                        <v-flex xs10>
                                            <v-menu
                                                    ref="menuDue_date"
                                                    lazy
                                                    :close-on-content-click="false"
                                                    v-model="menuDue_date"
                                                    transition="scale-transition"
                                                    offset-y
                                                    full-width
                                                    :nudge-right="40"
                                                    min-width="290px"
                                                    :return-value.sync="date"
                                            >
                                                <v-text-field
                                                        slot="activator"
                                                        label="Selecciona Fecha"
                                                        v-model="invoice.model.due_date"
                                                        prepend-icon="event"
                                                        readonly
                                                ></v-text-field>
                                                <v-date-picker v-model="invoice.model.due_date" no-title scrollable>
                                                    <v-spacer></v-spacer>
                                                    <v-btn flat color="primary" @click="menu = false">Cancel</v-btn>
                                                    <v-btn flat color="primary" @click="$refs.menuDue_date.save(date)">
                                                        OK
                                                    </v-btn>
                                                </v-date-picker>
                                            </v-menu>
                                        </v-flex>
                                    </v-layout>
                                </v-flex>
                                <v-flex xs6 md3 lg3>
                                    <v-layout column>
                                        <span class="title">Gran Total</span>
                                        <v-flex xs10>
                                            <v-text-field
                                                    v-model="total"
                                                    disabled
                                            ></v-text-field>
                                        </v-flex>
                                    </v-layout>
                                </v-flex>
                            </v-layout>
                            <v-divider></v-divider>
                            <v-layout row justify-space-around wrap class="pt-3" v-if="products.model.length > 0">
                                <v-flex xs12 md12 lg12>
                                    <v-data-table
                                            :headers="headers"
                                            :items="invoice.model.items"
                                            hide-actions
                                            class="elevation-1"
                                    >
                                        <template slot="items" slot-scope="props">
                                            <td>{{ products.model[props.item.product_id -1].cod }}</td>
                                            <v-select
                                                    :items="products.model"
                                                    v-model="props.item.product_id"
                                                    item-text="name"
                                                    item-value="id"
                                                    label="Selecciona"
                                                    return-masked-value
                                                    single-line
                                                    bottom
                                            ></v-select>
                                            <td>{{ products.model[props.item.product_id - 1].description }}</td>
                                            <td class="text-xs-right">{{ products.model[props.item.product_id -
                                                1].unit_price }}
                                            </td>
                                            <td class="text-xs-right">
                                                <v-text-field
                                                        v-model="props.item.qty"
                                                ></v-text-field>
                                            </td>
                                            <td class="text-xs-right">{{ props.item.qty *
                                                products.model[props.item.product_id - 1].unit_price }}
                                            </td>
                                            <td class="text-xs-right">
                                                <v-btn icon @click="removeItem(props.item)">
                                                    <v-icon>close</v-icon>
                                                </v-btn>
                                            </td>
                                        </template>
                                        <template slot="footer">
                                            <tr>
                                                <td colspan="6"></td>
                                                <td colspan="1">
                                                    <v-btn icon @click="addItem()">
                                                        <v-icon>add</v-icon>
                                                    </v-btn>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5"></td>
                                                <td colspan="1">
                                                    <span class="caption">Sub Total</span>
                                                </td>
                                                <td colspan="1">
                                                    <strong>{{subTotal}}</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5"></td>
                                                <td colspan="1">
                                                    <span class="caption">Descuento</span>
                                                </td>
                                                <td colspan="1">
                                                    <v-text-field
                                                            v-model="invoice.model.discount"
                                                    ></v-text-field>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5"></td>
                                                <td colspan="1">
                                                    <span class="caption">Total</span>
                                                </td>
                                                <td colspan="1">
                                                    <strong>{{total}}</strong>
                                                </td>
                                            </tr>
                                        </template>
                                    </v-data-table>
                                </v-flex>
                            </v-layout>
                        </v-flex>
                    </v-layout>
                </v-container>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn v-if="mode === 'edit'" color="primary" v-on:click="saveEditedInvoice()" flat>Guardar</v-btn>
                    <v-btn v-else color="primary" v-on:click="saveCreatedInvoice()" flat>Crear</v-btn>
                </v-card-actions>
            </v-card>
        </v-card>
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
        pageTitle: 'Crear Factura',
        successMessage: '',
        mode: this.$route.meta.mode,
        date: null,
        menuDate: false,
        menuDue_date: false,
        newInvoiceItem: {},
        mode: this.$route.meta.mode,
        snackBar: false,
        headers: [
          {text: 'COD', value: 'cod', sortable: false},
          {text: 'Nombre de producto', value: 'name', sortable: false},
          {text: 'Descripción', value: 'description', sortable: false},
          {text: 'Precio Unitario', value: 'unit_price', sortable: false},
          {text: 'Cantidad', value: 'qty', sortable: false},
          {text: 'Total', value: 'total', sortable: false},
          {text: 'Acciones', value: 'actions', sortable: false},
        ],
      }
    },
    computed: {
      ...mapGetters({
        products: 'getProducts',
        invoice: 'getInvoice',
        customers: 'getCustomers',
      }),
      subTotal() {
        let vm = this;
        if(vm.invoice.model.items.length > 0 && vm.products.model.length > 0) {
          return vm.invoice.model.items.reduce(function (carry, item) {
            if (item.product_id) {
              return carry + parseFloat(item.qty) * parseFloat(vm.products.model[item.product_id - 1].unit_price)
            }
          }, 0)
        }

      },
      total() {
        let vm = this;
        return vm.subTotal - parseFloat(vm.invoice.model.discount)
      }
    },
    created() {
      let vm = this;
      if (vm.mode === 'edit') {
        vm.pageTitle = 'Editar Factura';
        vm.setInvoice(vm.$route.params.id);
        vm.setProducts();
      } else {
        vm.setProducts();
      }
    },
    beforeDestroy() {
      this.removeSelectedInvoice();
    },
    methods: {
      ...mapActions({
        setInvoice: 'setInvoice',
        removeSelectedInvoice: 'removeSelectedInvoice',
      }),
      setInvoice(ID) {
        let vm = this;
        vm.$Progress.start();
        vm.$store.dispatch('setInvoice', ID)
            .then(response => {
              vm.$Progress.finish();
            })
            .catch(error => {
              vm.$Progress.fail();
            })
      },
      addItem(){
        let vm = this;
          let item = {
            invoice_id: 0,
            product_id: 1,
            qty: 1,
          }
        vm.invoice.model.items.push(item);
      },
      /* PRODUCTS FOR INVOICE */
      setProducts() {
        let vm = this;
        vm.$Progress.start();
        vm.$store.dispatch('setCustomers')
            .then(response => {
              vm.$store.dispatch('setProducts')
                  .then(response => {
                    vm.$Progress.finish();
                  })
                  .catch(error => {
                    vm.$Progress.fail();
                  })
            })
            .catch(error => {
              vm.$Progress.fail();
            })
      },
      removeItem(item) {
        let invoiceItems = this.invoice.model.items;
        invoiceItems.splice(invoiceItems.indexOf(item), 1)
      },
      saveEditedInvoice() {
        let vm = this;
        vm.$Progress.start();
        let invoice = vm.invoice.model;
        console.log("invoice", invoice);
        vm.$store.dispatch('saveEditInvoice', invoice)
            .then(response => {
              vm.$Progress.finish();
              vm.successMessage = '¡Factura editada exitosamente!'
              vm.snackBar = true;
            })
            .catch(error => {
              console.log(error);
              vm.$Progress.fail();
            })
      },
      saveCreatedInvoice() {
        let vm = this;
        vm.$Progress.start();
        let invoice = vm.invoice.model;
        invoice.customer_id = invoice.customer.id;
        console.log("invoice", invoice);
        vm.$store.dispatch('saveInvoice', invoice)
            .then(response => {
              vm.$Progress.finish();
              vm.successMessage = '¡Factura creada exitosamente!'
              vm.snackBar = true;
            })
            .catch(error => {
              vm.$Progress.fail();
            })
      },
    }
  }
</script>


