<style lang="scss" scoped>
    .customer-card {
        max-width: 200px;
    }

    .customer-card-media {
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
        <!-- Customers Cards -->
        <v-container>
           <v-card class="elevation-4">
               <v-card-title>
                   <v-flex xs5>
                       <v-text-field
                               append-icon="search"
                               v-model="search"
                               label="Buscar Cliente"
                               single-line
                               hide-details
                       ></v-text-field>
                   </v-flex>
                   <v-spacer></v-spacer>
                   <v-btn icon to="/customer/create">
                       <v-icon>add</v-icon>
                   </v-btn>
               </v-card-title>
               <v-container fluid grid-list-xl>
                   <v-layout align-center wrap>
                       <v-flex v-for="(customer,i) in filteredCustomers" :key="i">
                           <v-card class="ma-3 customer-card">
                               <v-card-media class="customer-card-media">
                                   <img :src="ApiCustomersPics + customer.picture" :alt="customer.name"/>
                               </v-card-media>
                               <v-card-title primary-title>
                                   <v-layout column align-content-center justify-center align-center>
                                       <h3 class="subheading mb-0">{{ customer.name + ' ' + customer.last_name}}</h3>
                                       <div class="caption grey--text">{{ customer.rif }}</div>
                                       <div class="caption grey--text">{{ customer.email }}</div>
                                   </v-layout>
                               </v-card-title>
                               <v-card-actions class="white">
                                   <div class="caption grey--text">{{ customer.company }}</div>
                                   <v-spacer></v-spacer>
                                   <v-btn icon flat color="primary" :to="'/customer/edit/' + customer.id">
                                       <v-icon>edit</v-icon>
                                   </v-btn>
                                   <v-btn icon flat color="red"
                                          @click.stop="customerDialogDelete = true, selectedCustomer=(customer)">
                                       <v-icon>delete</v-icon>
                                   </v-btn>
                               </v-card-actions>
                           </v-card>
                       </v-flex>
                       <v-layout v-show="customers.model.length === 0" row align-center align-content-center justify-center>
                           <span class="headline">No hay nada aquí Todavía</span>
                       </v-layout>
                   </v-layout>
               </v-container>
           </v-card>
        </v-container>
        <v-dialog v-if="selectedCustomer" v-model="customerDialogDelete" max-width="500px">
            <v-card>
                <v-card-title>
                    <span class="headline">Borrar Cliente</span>
                    <v-spacer></v-spacer>
                    <v-btn icon @click.stop="customerDialogDelete = !customerDialogDelete">
                        <v-icon>close</v-icon>
                    </v-btn>
                </v-card-title>
                <v-card-text>
                    <span>¿Estas seguro que deseas borrar el cliente <span class="body-2">{{ selectedCustomer.name + ' ' +  selectedCustomer.last_name}}</span>?</span>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="primary"
                           flat
                           v-on:click="removeCustomer(selectedCustomer), customerDialogDelete = false">
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
        pageTitle: 'Clientes',
        search: '',
        ApiCustomersPics: this.$configs.ApiUrl + 'images/customers/',
        snackBar: false,
        selectedCustomer: null,
        customerDialogDelete: false,
        successMessage: '',
      }
    },
    computed: {
      ...mapGetters({
        customers: 'getCustomers',
      }),
      filteredCustomers: function(){
        return this.customers.model.filter((customer) => {
          return customer.name.toLowerCase().match(this.search);
        }).reverse();
      }
    },
    created() {
      let vm = this;
      vm.setCustomers();
    },
    methods: {
      setCustomers() {
        let vm = this;
        vm.$Progress.start();
        vm.$store.dispatch('setCustomers')
            .then(response => {
              vm.$Progress.finish();
            })
            .catch(error => {
              vm.$Progress.fail();
            })
      },
      removeCustomer(customer) {
        let vm = this;
        vm.$Progress.start();
        vm.$store.dispatch('removeCustomer', customer)
            .then(response => {
              vm.successMessage = '¡Cliente Borrado Exitosamente!';
              vm.snackBar = true;
              vm.$Progress.finish();
            })
            .catch(error => {
              vm.$Progress.fail();
            })
      },
    }
  }
</script>


