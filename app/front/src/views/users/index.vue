<style lang="scss" scoped>
    .user-card {
        max-width: 200px;
    }

    .user-card-media {
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
        <!-- Providers Cards -->
        <v-container>
           <v-card class="elevation-4">
               <v-card-title>
                   <v-flex xs5>
                       <v-text-field
                               append-icon="search"
                               v-model="search"
                               label="Buscar Usuario"
                               single-line
                               hide-details
                       ></v-text-field>
                   </v-flex>
                   <v-spacer></v-spacer>
                   <v-btn icon to="/user/create">
                       <v-icon>add</v-icon>
                   </v-btn>
               </v-card-title>
               <v-container fluid grid-list-xl>
                   <v-layout align-center wrap>
                       <v-flex v-for="(user,i) in filteredUsers" :key="i">
                           <v-card class="ma-3 user-card">
                               <v-card-media class="user-card-media">
                                   <img :src="ApiUsersPics + user.picture" :alt="user.name"/>
                               </v-card-media>
                               <v-card-title primary-title>
                                   <v-layout column align-content-center justify-center align-center>
                                       <h3 class="subheading mb-0">{{ user.name }}</h3>
                                       <div class="caption grey--text">{{ user.email }}</div>
                                   </v-layout>
                               </v-card-title>
                               <v-card-actions class="white">
                                   <v-spacer></v-spacer>
                                   <v-btn icon flat color="primary" :to="'/user/edit/' + user.id">
                                       <v-icon>edit</v-icon>
                                   </v-btn>
                                   <v-btn icon flat color="red"
                                          @click.stop="userDialogDelete = true, selectedUser=(user)">
                                       <v-icon>delete</v-icon>
                                   </v-btn>
                               </v-card-actions>
                           </v-card>
                       </v-flex>
                       <v-layout v-show="users.model.length === 0" row align-center align-content-center justify-center>
                           <span class="headline">No hay nada aquí Todavía</span>
                       </v-layout>
                   </v-layout>
               </v-container>
           </v-card>
        </v-container>
        <v-dialog v-if="selectedUser" v-model="userDialogDelete" max-width="500px">
            <v-card>
                <v-card-title>
                    <span class="headline">Borrar Proveedor</span>
                    <v-spacer></v-spacer>
                    <v-btn icon @click.stop="userDialogDelete = !userDialogDelete">
                        <v-icon>close</v-icon>
                    </v-btn>
                </v-card-title>
                <v-card-text>
                    <span>¿Estas seguro que deseas borrar el Usuario <span class="body-2">{{ selectedUser.name }}</span>?</span>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="primary"
                           flat
                           v-on:click="removeUser(selectedUser), userDialogDelete = false">
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
        pageTitle: 'Usuarios',
        search: '',
        ApiUsersPics: this.$configs.ApiUrl + 'images/users/',
        snackBar: false,
        selectedUser: null,
        userDialogDelete: false,
        successMessage: '',
      }
    },
    computed: {
      ...mapGetters({
        users: 'getAllUsers',
      }),
      filteredUsers: function(){
        return this.users.model.filter((user) => {
          return user.name.toLowerCase().match(this.search);
        }).reverse();
      }
    },
    created() {
      let vm = this;
      vm.setAllUsers();
    },
    methods: {
      setAllUsers() {
        let vm = this;
        vm.$Progress.start();
        vm.$store.dispatch('setAllUsers')
            .then(response => {
              vm.$Progress.finish();
            })
            .catch(error => {
              vm.$Progress.fail();
            })
      },
      removeUser(user) {
        let vm = this;
        vm.$Progress.start();
        vm.$store.dispatch('removeUser', user)
            .then(response => {
              vm.successMessage = '¡Usuario Borrado Exitosamente!';
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


