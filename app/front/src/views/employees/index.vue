<style lang="scss">
    .employee-card {
        max-width: 200px;
    }

    .employee-card-media {
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
                               label="Buscar Empleado"
                               single-line
                               hide-details
                       ></v-text-field>
                   </v-flex>
                   <v-spacer></v-spacer>
                   <v-btn icon to="/employee/create">
                       <v-icon>add</v-icon>
                   </v-btn>
               </v-card-title>
               <v-container fluid grid-list-xl>
                   <v-layout align-center wrap>
                       <v-flex v-for="(employee,i) in filteredEmployees" :key="i">
                           <v-card class="ma-3 employee-card">
                               <v-card-media class="employee-card-media">
                                   <img :src="ApiEmployeesPics + employee.picture" :alt="employee.name"/>
                               </v-card-media>
                               <v-card-title primary-title>
                                   <v-layout column align-content-center justify-center align-center>
                                       <h3 class="subheading mb-0">{{ employee.name + ' ' + employee.last_name}}</h3>
                                       <div class="caption grey--text">{{ employee.email }}</div>
                                   </v-layout>
                               </v-card-title>
                               <v-card-actions class="white">
                                   <div class="caption grey--text">{{ employee.position }}</div>
                                   <v-spacer></v-spacer>
                                   <v-btn icon flat color="primary" :to="'/employee/edit/' + employee.id">
                                       <v-icon>edit</v-icon>
                                   </v-btn>
                                   <v-btn icon flat color="red"
                                          @click.stop="employeeDialogDelete = true, selectedEmployee=(employee)">
                                       <v-icon>delete</v-icon>
                                   </v-btn>
                               </v-card-actions>
                           </v-card>
                       </v-flex>
                   </v-layout>
               </v-container>
           </v-card>
        </v-container>
        <v-dialog v-if="selectedEmployee" v-model="employeeDialogDelete" max-width="500px">
            <v-card>
                <v-card-title>
                    <span class="headline">Borrar Empleado</span>
                    <v-spacer></v-spacer>
                    <v-btn icon @click.stop="employeeDialogDelete = !employeeDialogDelete">
                        <v-icon>close</v-icon>
                    </v-btn>
                </v-card-title>
                <v-card-text>
                    <span>¿Estas seguro que deseas borrar el empleado <span class="body-2">{{ selectedEmployee.name + ' ' +  selectedEmployee.last_name}}</span>?</span>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="primary"
                           flat
                           v-on:click="removeEmployee(selectedEmployee), employeeDialogDelete = false">
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
        pageTitle: 'Empleados',
        search: '',
        ApiEmployeesPics: this.$configs.ApiUrl + 'images/employees/',
        snackBar: false,
        selectedEmployee: null,
        employeeDialogDelete: false,
        successMessage: '',
      }
    },
    computed: {
      ...mapGetters({
        employees: 'getEmployees',
      }),
      filteredEmployees: function(){
        return this.employees.model.filter((employee) => {
          return employee.name.toLowerCase().match(this.search);
        }).reverse();
      }
    },
    created() {
      let vm = this;
      vm.setEmployees();
    },
    methods: {
      setEmployees() {
        let vm = this;
        vm.$Progress.start();
        vm.$store.dispatch('setEmployees')
            .then(response => {
              vm.$Progress.finish();
            })
            .catch(error => {
              vm.$Progress.fail();
            })
      },
      removeEmployee(employee) {
        let vm = this;
        vm.$Progress.start();
        vm.$store.dispatch('removeEmployee', employee)
            .then(response => {
              vm.successMessage = '¡Empleado Borrado Exitosamente!';
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


