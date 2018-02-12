<style lang="scss" scoped>
    .provider-card {
        max-width: 200px;
    }

    .provider-card-media {
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
                               label="Buscar Proveedor"
                               single-line
                               hide-details
                       ></v-text-field>
                   </v-flex>
                   <v-spacer></v-spacer>
                   <v-btn icon to="/provider/create">
                       <v-icon>add</v-icon>
                   </v-btn>
               </v-card-title>
               <v-container fluid grid-list-xl>
                   <v-layout align-center wrap>
                       <v-flex v-for="(provider,i) in filteredProviders" :key="i">
                           <v-card class="ma-3 provider-card">
                               <v-card-media class="provider-card-media">
                                   <img :src="ApiProvidersPics + provider.picture" :alt="provider.name"/>
                               </v-card-media>
                               <v-card-title primary-title>
                                   <v-layout column align-content-center justify-center align-center>
                                       <h3 class="subheading mb-0">{{ provider.name + ' ' + provider.last_name}}</h3>
                                       <div class="caption grey--text">{{ provider.email }}</div>
                                   </v-layout>
                               </v-card-title>
                               <v-card-actions class="white">
                                   <div class="caption grey--text">{{ provider.company }}</div>
                                   <v-spacer></v-spacer>
                                   <v-btn icon flat color="primary" :to="'/provider/edit/' + provider.id">
                                       <v-icon>edit</v-icon>
                                   </v-btn>
                                   <v-btn icon flat color="red"
                                          @click.stop="providerDialogDelete = true, selectedProvider=(provider)">
                                       <v-icon>delete</v-icon>
                                   </v-btn>
                               </v-card-actions>
                           </v-card>
                       </v-flex>
                       <v-layout v-show="providers.model.length === 0" row align-center align-content-center justify-center>
                           <span class="headline">No hay nada aquí Todavía</span>
                       </v-layout>
                   </v-layout>
               </v-container>
           </v-card>
        </v-container>
        <v-dialog v-if="selectedProvider" v-model="providerDialogDelete" max-width="500px">
            <v-card>
                <v-card-title>
                    <span class="headline">Borrar Proveedor</span>
                    <v-spacer></v-spacer>
                    <v-btn icon @click.stop="providerDialogDelete = !providerDialogDelete">
                        <v-icon>close</v-icon>
                    </v-btn>
                </v-card-title>
                <v-card-text>
                    <span>¿Estas seguro que deseas borrar el Proveedor <span class="body-2">{{ selectedProvider.name + ' ' +  selectedProvider.last_name}}</span>?</span>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="primary"
                           flat
                           v-on:click="removeProvider(selectedProvider), providerDialogDelete = false">
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
        pageTitle: 'Proveedores',
        search: '',
        ApiProvidersPics: this.$configs.ApiUrl + 'images/providers/',
        snackBar: false,
        selectedProvider: null,
        providerDialogDelete: false,
        successMessage: '',
      }
    },
    computed: {
      ...mapGetters({
        providers: 'getProviders',
      }),
      filteredProviders: function(){
        return this.providers.model.filter((provider) => {
          return provider.name.toLowerCase().match(this.search);
        }).reverse();
      }
    },
    created() {
      let vm = this;
      vm.setProviders();
    },
    methods: {
      setProviders() {
        let vm = this;
        vm.$Progress.start();
        vm.$store.dispatch('setProviders')
            .then(response => {
              vm.$Progress.finish();
            })
            .catch(error => {
              vm.$Progress.fail();
            })
      },
      removeProvider(provider) {
        let vm = this;
        vm.$Progress.start();
        vm.$store.dispatch('removeProvider', provider)
            .then(response => {
              vm.successMessage = '¡Proveedor Borrado Exitosamente!';
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


