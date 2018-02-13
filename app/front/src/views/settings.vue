<style lang="scss">
    .profile-image-card {
        max-width: 250px;
        max-height: 250px;
    }

    .profile-image {
        width: 200px;
        height: 200px;
    }

    .profile-image-name {
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
                                                v-model="userData.name"
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
                                                v-model="userData.email"
                                                single-line
                                        ></v-text-field>
                                    </v-flex>
                                </v-layout>
                                <v-layout row justify-space-around wrap>
                                    <v-flex xs11 md4 lg4>
                                        <v-subheader>Imagen de perfil</v-subheader>
                                    </v-flex>
                                    <v-flex xs11 md4 lg4>
                                        <input v-show="false" ref="fileInput" id="file" type="file" accept=".png, .jpg, .jpeg"
                                               @change="previewFiles">
                                        <v-card class="profile-image-card elevation-5">
                                            <v-card-media class="mt-2">
                                                <v-layout align-content-center justify-center align-center>
                                                    <img v-if="!image" class="profile-image"
                                                         :src="ApiUsersPics + userData.picture"
                                                         :alt="userData.name">
                                                    <img v-if="image" class="profile-image"
                                                         :src="image"
                                                         :alt="userData.name">
                                                </v-layout>
                                            </v-card-media>
                                            <v-card-actions color="primary">
                                                <span class="caption grey--text profile-image-name"></span>
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
                            </v-container>
                        </v-card-text>
                        <v-card-actions>
                            <v-spacer></v-spacer>
                            <v-btn flat dark color="primary" v-on:click="saveUserData()">Guardar</v-btn>
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
  import {mapGetters} from 'vuex';
  export default {
    data () {
      return {
        pageTitle: 'Ajustes',
        ApiUsersPics: this.$configs.ApiUrl + 'images/users/',
        snackBar: false,
        successMessage: '',
        dbImageTmp: '',
        image: '',
        userData: '',
      }
    },
    computed: {
      ...mapGetters({
        authUser: 'getAuthenticatedUser',
      }),
    },
    created() {
      let vm = this;
      if (vm.authUser) {
        vm.userData = vm.authUser
      }
    },
    methods: {
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
        };
        reader.readAsDataURL(file);
      },
      removeImage: function (e) {
        this.userData.picture = this.authUser.picture;
        this.image = '';
      },
      saveUserData() {
        let vm = this;
        vm.$Progress.start();
        let userUpdated = vm.userData;
        userUpdated.picture = vm.image;
        console.log(userUpdated);
        vm.$store.dispatch('saveUpdatedUserData', userUpdated)
            .then(response => {
              vm.$Progress.finish();
              vm.successMessage = '¡Usuario actualizado Exitosamente!';
              vm.snackBar = true;
            })
            .catch(error => {
              vm.$Progress.fail();
            })
      }
    }
  }
</script>


