<style lang="scss">
    .percent {

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
        <v-card flat class="ma-2">
            <v-card>
                <v-card-title>
                    <v-flex xs6>
                        <v-btn icon to="/invoices">
                            <v-icon>arrow_back</v-icon>
                        </v-btn>
                    </v-flex>
                    <v-spacer></v-spacer>
                    <v-btn icon @click="generatePDF()">
                        <v-icon>print</v-icon>
                    </v-btn>
                    <v-btn icon flat color="primary" :to="'/invoice/edit/' + invoice.model.id">
                        <v-icon>edit</v-icon>
                    </v-btn>
                    <v-btn icon flat color="red" @click="invoiceDialogDelete = true">
                        <v-icon>delete</v-icon>
                    </v-btn>
                </v-card-title>
                <v-container grid-list-md fluid>
                    <v-layout align-content-center justify-center align-center wrap>
                        <v-flex xs10 md10 lg10>
                            <v-layout row justify-space-around wrap class="pb-2">
                                <v-flex xs6 md3 lg3>
                                    <v-layout column>
                                        <v-layout row>
                                            <v-flex>
                                                <span class="title">Factura No.</span>
                                            </v-flex>
                                        </v-layout>
                                        <v-layout row>
                                            <v-flex>
                                                <span class="body-1">{{invoice.model.number}}</span>
                                            </v-flex>
                                        </v-layout>
                                    </v-layout>
                                </v-flex>
                                <v-flex xs6 md3 lg3>
                                    <v-layout column>
                                        <span class="title">Titulo</span>
                                        <span class="body-1">{{invoice.model.title}}</span>
                                    </v-layout>
                                </v-flex>
                                <v-flex xs6 md3 lg3>
                                    <v-layout column>
                                        <span class="title">Empresa</span>
                                        <span class="body-1">{{invoice.model.customer.company}}</span>
                                    </v-layout>
                                </v-flex>
                                <v-flex xs6 md3 lg3>
                                    <v-layout column>
                                        <span class="title">Nombre Cliente</span>
                                        <span class="body-1">{{invoice.model.customer.name}}</span>
                                    </v-layout>
                                </v-flex>
                            </v-layout>
                            <v-layout row justify-space-around wrap class="pb-2">
                                <v-flex xs6 md3 lg3>
                                    <v-layout column>
                                        <span class="title">Dirección Cliente</span>
                                        <span class="body-1">{{invoice.model.customer.address}}</span>
                                    </v-layout>
                                </v-flex>
                                <v-flex xs6 md3 lg3>
                                    <v-layout column>
                                        <span class="title">Fecha factura</span>
                                        <span class="body-1">{{invoice.model.date}}</span>
                                    </v-layout>
                                </v-flex>
                                <v-flex xs6 md3 lg3>
                                    <v-layout column>
                                        <span class="title">Fecha Limite</span>
                                        <span class="body-1">{{invoice.model.due_date}}</span>
                                    </v-layout>
                                </v-flex>
                                <v-flex xs6 md3 lg3>
                                    <v-layout column>
                                        <span class="title">Gran Total</span>
                                        <span class="body-1">{{invoice.model.total}}</span>
                                    </v-layout>
                                </v-flex>
                                <v-flex xs6 md3 lg3>
                                    <v-chip v-if="invoice.model.status == 0" class="ml-3" disabled small
                                            color="light-blue">PENDIENTE
                                    </v-chip>
                                    <v-chip v-else-if="invoice.model.status == 1" disabled small
                                            color="light-green">
                                        PAGADA
                                    </v-chip>
                                    <v-chip v-else disabled small color="red">EXPIRADA</v-chip>
                                </v-flex>
                            </v-layout>
                            <v-divider></v-divider>
                            <v-layout row justify-space-around wrap class="pt-3">
                                <v-flex xs12 md12 lg12>
                                    <v-data-table
                                            :headers="headers"
                                            :items="invoice.model.items"
                                            hide-actions
                                            class="elevation-1"
                                    >
                                        <template slot="items" slot-scope="props">
                                            <td>{{ invoice.products[props.item.product_id - 1].cod }}</td>
                                            <td>{{ invoice.products[props.item.product_id - 1].name }}</td>
                                            <td>{{ invoice.products[props.item.product_id - 1].description }}</td>
                                            <td class="text-xs-right">{{ invoice.products[props.item.product_id -
                                                1].unit_price }}
                                            </td>
                                            <td class="text-xs-right">{{ props.item.qty }}</td>
                                            <td class="text-xs-right">{{ props.item.qty *
                                                invoice.products[props.item.product_id - 1].unit_price }}
                                            </td>
                                        </template>
                                        <template slot="footer">
                                            <tr>
                                                <td colspan="4"></td>
                                                <td colspan="1">
                                                    <span class="caption">Sub Total</span>
                                                </td>
                                                <td colspan="1">
                                                    <strong>{{invoice.model.sub_total}}</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"></td>
                                                <td colspan="1">
                                                    <span class="caption">IVA</span>
                                                    <strong>{{invoice.model.iva_percent}}</strong>
                                                    <span class="percent">&#37;</span>
                                                </td>
                                                <td colspan="1">
                                                    <strong>{{invoice.model.iva}}</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"></td>
                                                <td colspan="1">
                                                    <span class="caption">Descuento</span>
                                                </td>
                                                <td colspan="1">
                                                    <strong>{{invoice.model.discount}}</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"></td>
                                                <td colspan="1">
                                                    <span class="caption">Total</span>
                                                </td>
                                                <td colspan="1">
                                                    <strong>{{invoice.model.total}}</strong>
                                                </td>
                                            </tr>
                                        </template>
                                    </v-data-table>
                                </v-flex>
                            </v-layout>
                        </v-flex>
                    </v-layout>
                </v-container>
            </v-card>
        </v-card>
        <v-dialog v-if="invoice" v-model="invoiceDialogDelete" max-width="500px">
            <v-card>
                <v-card-title>
                    <span class="headline">Borrar Factura</span>
                    <v-spacer></v-spacer>
                    <v-btn icon @click.stop="invoiceDialogDelete = !invoiceDialogDelete">
                        <v-icon>close</v-icon>
                    </v-btn>
                </v-card-title>
                <v-card-text>
                    <span>¿Estas seguro que deseas borrar la factura <span
                            class="body-2">{{ invoice.model.title }}</span>?</span>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="primary"
                           flat
                           v-on:click="removeInvoice(invoice.model), invoiceDialogDelete = false">
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
  import JSPDF from 'jspdf';

  export default {
    data() {
      return {
        pageTitle: 'Ver Factura',
        successMessage: '',
        snackBar: false,
        invoiceDialogDelete: false,
        headers: [
          {text: 'COD', value: 'cod', sortable: false},
          {text: 'Nombre de producto', value: 'name', sortable: false},
          {text: 'Descripción', value: 'description', sortable: false},
          {text: 'Precio Unitario', value: 'unit_price', sortable: false},
          {text: 'Cantidad', value: 'qty', sortable: false},
          {text: 'Total', value: 'total', sortable: false},
        ],
      }
    },
    computed: {
      ...mapGetters({
        invoice: 'getInvoice',
      }),
    },
    created() {
      let vm = this;
      vm.setInvoice(vm.$route.params.id);
    },
    methods: {
      ...mapActions({
        setInvoice: 'setInvoice',
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
      removeInvoice(invoice) {
        let vm = this;
        let redirect = '/invoices';
        vm.$Progress.start();
        vm.$store.dispatch('removeInvoice', invoice)
            .then(response => {
              vm.successMessage = '¡Factura Borrada Exitosamente!';
              vm.snackBar = true;
              vm.$Progress.finish();
              vm.$router.push(redirect);
            })
            .catch(error => {
              vm.$Progress.fail();
            })
      },
      generatePDF() {
        let vm = this;
        let pdfName = vm.invoice.model.title + '__' + vm.invoice.model.created_at;
        let doc = new JSPDF();
        let invoiceItemsLength = vm.invoice.model.items.length;

        doc.text(vm.invoice.model.title, 10, 10);
        doc.text(vm.invoice.model.created_at, 10, 15);
        for (let i = 0; i < invoiceItemsLength; i++) {
          doc.text(vm.invoice.products[vm.invoice.model.items[i].product_id - 1].name, 15, 30 + (i * 10));
        }
        for (let i = 0; i < invoiceItemsLength; i++) {
          doc.text(vm.invoice.products[vm.invoice.model.items[i].product_id - 1].unit_price + " $", 150, 30 + (i * 10));
        }
        doc.text("Sub total: " + vm.invoice.model.sub_total, 120, 100);
        doc.text("Descuento: " + vm.invoice.model.discount, 120, 110);
        doc.text("Total: " + vm.invoice.model.total, 120, 120);
        doc.save(pdfName + '.pdf');
      }
    }
  }
</script>


