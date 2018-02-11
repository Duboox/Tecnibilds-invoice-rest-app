<style lang="scss" scoped>
    .employees-image-card {
        max-width: 250px;
        max-height: 250px;
    }

    .employee-image {
        width: 200px;
        height: 200px;
    }

    .employee-image-name {
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
        <!-- Employee Cards -->
        <v-container>
            <v-card class="elevation-4">
                <v-card-title>
                    <v-btn icon to="/employees">
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
                                            <v-card class="employees-image-card elevation-5">
                                                <v-card-media class="mt-2">
                                                    <v-layout align-content-center justify-center align-center>
                                                        <img v-if="!image" class="employee-image"
                                                             :src="ApiEmployeesPics + employee.model.picture"
                                                             :alt="employee.model.name">
                                                        <img v-if="image" class="employee-image"
                                                             :src="image"
                                                             :alt="employee.model.name">
                                                    </v-layout>
                                                </v-card-media>
                                                <v-card-actions color="primary">
                                                    <span class="caption grey--text employee-image-name"></span>
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
                                        <v-layout row justify-space-around>
                                            <v-flex>
                                                <v-text-field
                                                        label="Nombre"
                                                        v-model="employee.model.name"
                                                        :counter="25"
                                                        required
                                                ></v-text-field>
                                            </v-flex>
                                            <v-flex>
                                                <v-text-field
                                                        label="Apellido"
                                                        v-model="employee.model.last_name"
                                                        :counter="25"
                                                        required
                                                ></v-text-field>
                                            </v-flex>
                                        </v-layout>
                                        <v-flex>
                                            <v-text-field
                                                    label="Dirección"
                                                    v-model="employee.model.address"
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
                                                label="Nº Telefonico"
                                                v-model="employee.model.phone"
                                                :counter="15"
                                                required
                                        ></v-text-field>
                                    </v-flex>
                                    <v-flex xs10 md6 lg3>
                                        <v-select
                                                :items="selectGender"
                                                v-model="employee.model.gender"
                                                label="Genero"
                                                single-line
                                                bottom
                                        ></v-select>
                                    </v-flex>
                                </v-layout>
                                <v-layout row justify-space-around wrap>
                                    <v-flex xs10 md6 lg3>
                                        <v-text-field
                                                label="E-mail"
                                                v-model="employee.model.email"
                                                :counter="15"
                                                required
                                        ></v-text-field>
                                    </v-flex>
                                    <v-flex xs10 md6 lg3>
                                        <v-text-field
                                                label="Cargo"
                                                v-model="employee.model.position"
                                                :counter="8"
                                                required
                                        ></v-text-field>
                                    </v-flex>
                                    <v-flex xs10 md6 lg3>
                                        <v-text-field
                                                label="Salario"
                                                v-model="employee.model.salary"
                                                :counter="6"
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
                    <v-btn v-if="mode === 'edit'" color="primary" v-on:click="saveEditedEmployee()" flat>Guardar</v-btn>
                    <v-btn v-else color="primary" v-on:click="saveCreatedEmployee()" flat>Crear</v-btn>
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
        pageTitle: 'Añadir Empleado',
        ApiEmployeesPics: this.$configs.ApiUrl + 'images/employees/',
        snackBar: false,
        successMessage: '',
        dbImageTmp: '',
        image: '',
        mode: this.$route.meta.mode,
        selectGender: [
          {
            text: 'Femenino',
            value: 'female'
          },
          {
            text: 'Masculino',
            value: 'male'
          }
        ],
      }
    },
    created() {
      if (this.mode === 'edit') {
        this.pageTitle = 'Editar Empleado';
        this.setEmployee(this.$route.params.id);
      }
      this.employee.model.picture = 'default.jpg';
    },
    beforeDestroy() {
      this.removeSelectedEmployee();
    },
    computed: {
      ...mapGetters({
        employee: 'getEmployee',
      }),
    },
    methods: {
      ...mapActions({
        removeSelectedEmployee: 'removeSelectedEmployee'
      }),
      setEmployee(employee) {
        let vm = this;
        vm.$Progress.start();
        vm.$store.dispatch('setEmployee', employee)
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
          vm.dbImageTmp = vm.employee.model.picture;
          vm.employee.model.picture = file.name;
        };
        reader.readAsDataURL(file);
      },
      removeImage: function (e) {
        if (this.$route.meta.mode === 'edit') {
          this.employee.model.picture = this.dbImageTmp;
        }
        this.employee.model.picture = 'default.jpg';
        this.image = '';
      },
      saveEditedEmployee() {
        let vm = this;
        vm.$Progress.start();
        let employee = vm.employee;
        if (vm.image) {
          employee.model.picture = vm.image;
        }
        vm.$store.dispatch('saveEditEmployee', employee)
            .then(response => {
              vm.$Progress.finish();
              vm.successMessage = '¡Empleado editado exitosamente!'
              vm.snackBar = true;
            })
            .catch(error => {
              vm.$Progress.fail();
            })
      },
      saveCreatedEmployee() {
        let vm = this;
        vm.$Progress.start();
        let employee = vm.employee;
        employee.model.picture = vm.image;
        console.log(employee);
        vm.$store.dispatch('saveEmployee', employee)
            .then(response => {
              vm.$Progress.finish();
              vm.successMessage = '¡Empleado creado exitosamente!'
              vm.snackBar = true;
            })
            .catch(error => {
              vm.$Progress.fail();
            })
      },
    },
  }
</script>


