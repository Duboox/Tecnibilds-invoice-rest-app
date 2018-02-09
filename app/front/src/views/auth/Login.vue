<style lang="scss">
    @-moz-keyframes loader {
        from {
            transform: rotate(0);
        }
        to {
            transform: rotate(360deg);
        }
    }

    @-webkit-keyframes loader {
        from {
            transform: rotate(0);
        }
        to {
            transform: rotate(360deg);
        }
    }

    @-o-keyframes loader {
        from {
            transform: rotate(0);
        }
        to {
            transform: rotate(360deg);
        }
    }

    @keyframes loader {
        from {
            transform: rotate(0);
        }
        to {
            transform: rotate(360deg);
        }
    }
</style>

<template>
    <v-container fluid grid-list-xl align-content-center justify-center align-center>
        <v-layout row align-content-center justify-center align-center>
            <v-flex xs12 class="text-xs-center">
                <img src="../../assets/logo.png" alt="Tecnibilds" class="hidden-xs-only" height="200"/>
            </v-flex>
        </v-layout>
        <v-layout row justify-center wrap>
            <v-flex xs12 sm8 md6 lg6>
                <v-card class="elevation-12" style="min-width: 300px">
                    <v-toolbar dark color="primary">
                        <v-toolbar-title>Accede a tu cuenta</v-toolbar-title>
                        <v-spacer></v-spacer>
                        <v-tooltip bottom>
                            <v-btn
                                    icon
                                    large
                                    href=""
                                    target="_blank"
                                    slot="activator"
                            >
                                <v-icon large>help</v-icon>
                            </v-btn>
                            <span>Ayuda</span>
                        </v-tooltip>
                    </v-toolbar>
                    <v-container>
                        <v-form ref="form" lazy-validation>
                            <v-text-field
                                    prepend-icon="person"
                                    label="E-mail"
                                    v-model="loginDetails.email"
                                    id="email"
                                    name="email"
                                    type="email"
                                    value=""
                                    :error-messages="errors.email"
                                    required
                            ></v-text-field>
                            <v-text-field
                                    prepend-icon="lock"
                                    label="Introduce tu contraseña"
                                    v-model="loginDetails.password"
                                    id="password"
                                    name="password"
                                    type="password"
                                    hint="Minimo 8 caracteres"
                                    min="8"
                                    :append-icon="passE1Show ? 'visibility' : 'visibility_off'"
                                    :append-icon-cb="() => (passE1Show = !passE1Show)"
                                    :type="passE1Show ? 'password' : 'text'"
                                    counter
                            ></v-text-field>
                            <v-layout row justify-space-between>
                                <v-checkbox
                                        label="Recordarme"
                                        v-model="loginDetails.remember"
                                        name="remember"
                                        type="checkbox"
                                ></v-checkbox>
                                <router-link to="/Forgot">
                                    Olvidaste la contraseña?
                                </router-link>
                            </v-layout>
                            <v-layout justify-center align-center>
                                <v-btn @click="login(loginDetails)"
                                       block
                                       color="info"
                                       :loading="loading"
                                       @click.native="loader = 'loading'"
                                       :disabled="loading"
                                >
                                    Entrar
                                </v-btn>
                            </v-layout>
                            <!-- For Debuggin -->
                            <!-- OR use Vue Tools -->
                            <!-- <pre>{{ $data }}</pre> -->
                        </v-form>
                    </v-container>
                </v-card>
            </v-flex>
        </v-layout>
    </v-container>
</template>

<script>
  import {mapGetters, mapActions} from 'vuex';
  export default {
    data () {
      return {
        title: 'INGRESAR',
        back: '',
        successMessage: '',
        redirect: '/dashboard',
        loginDetails: {
          email: null,
          password: null,
          remember: true,
        },
        errors: {
          email: [],
        },
        passE1Show: true,
        loader: null,
        loading: false,
      }
    },
  methods: {
    login(loginDetails) {
      const vm = this;
      vm.$Progress.start();
      vm.$store.dispatch('login', loginDetails)
          .then(response => {
            vm.$store.dispatch('setAuthenticatedUser');
            vm.successMessage = 'Login Success.';
            vm.loginSuccess();
          })
          .catch(response => {
            vm.loading = false;
            vm.loader = null;
            vm.$Progress.fail();
            vm.errors.email = response.response.data.message;
          })
    },
    loginSuccess() {
      const vm = this;
      vm.loader = null;
      vm.$Progress.finish();
      vm.$router.push(vm.redirect);
    }
  },
  watch: {
    loader()
    {
      const l = this.loader
      this[l] = !this[l]
    }
  }
  }
</script>


