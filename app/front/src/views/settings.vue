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
        <!-- Simple Cards -->
        <v-container fluid grid-list-xl align-content-center justify-center align-center>
            <v-layout class="mt-3" align-content-center justify-center align-center>
                <v-flex xs10>
                    <v-card>
                        <v-card-title primary-title>
                            <div class="headline">Información Personal</div>
                        </v-card-title>
                        <v-card-text>
                            <v-container fluid>
                                <v-layout row justify-space-around wrap>
                                    <v-flex xs11 md4 lg4>
                                        <v-subheader>Nombre</v-subheader>
                                    </v-flex>
                                    <v-flex xs11 md4 lg4>
                                        <v-text-field
                                                name="name"
                                                :value="user.name"
                                                single-line
                                        ></v-text-field>
                                    </v-flex>
                                </v-layout>
                                <v-divider></v-divider>
                                <v-layout row justify-space-around wrap>
                                    <v-flex xs11 md4 lg4>
                                        <v-subheader>Correo electrónico</v-subheader>
                                    </v-flex>
                                    <v-flex xs11 md4 lg4>
                                        <v-text-field
                                                name="name"
                                                :value="user.email"
                                                single-line
                                        ></v-text-field>
                                    </v-flex>
                                </v-layout>
                            </v-container>
                        </v-card-text>
                        <v-card-actions>
                            <v-spacer></v-spacer>
                            <v-btn flat dark color="primary">Guardar</v-btn>
                        </v-card-actions>
                    </v-card>
                </v-flex>
            </v-layout>
            <v-layout class="mt-3" align-content-center justify-center align-center>
                <v-flex xs10>
                    <v-card>
                        <v-card-title primary-title>
                            <div class="headline">Seguridad</div>
                        </v-card-title>
                        <v-card-actions>
                            <v-spacer></v-spacer>
                            <v-btn flat dark color="primary">Guardar</v-btn>
                        </v-card-actions>
                    </v-card>
                </v-flex>
            </v-layout>
        </v-container>
    </v-layout>
</template>

<script>
  import {mapGetters} from 'vuex';
  export default {
    data () {
      return {
        pageTitle: 'Ajustes',
      }
    },
    computed: {
      ...mapGetters({
        user: 'getAuthenticatedUser',
      }),
    },
  }
</script>


