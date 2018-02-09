<style lang="scss">
</style>

<template>
    <v-layout column wrap>
        <section>
            <v-parallax src="static/backs/back1.png" height="600">
                <v-layout column align-center justify-center class="white--text">
                    <img src="../assets/logo.png" alt="Tecnibilds" height="200">
                    <h1 class="white--text mb-2 display-1">Web development</h1>
                    <div class="subheading mb-3 text-xs-center">Powered by Joshua Martinez.</div>
                    <v-btn class="blue lighten-2 mt-5" dark large href="/portfolio">Conoce mas</v-btn>
                </v-layout>
            </v-parallax>
        </section>

        <section>
            <v-layout column wrap class="my-5" align-center>
                <v-flex xs12 sm4 class="my-3">
                    <div class="text-xs-center">
                        <h2 class="headline">La mejor manera de iniciar en tu negocio</h2>
                        <span class="subheading">Web applications</span>
                    </div>
                </v-flex>
                <v-flex xs12>
                    <v-container grid-list-xl>
                        <v-layout row wrap align-center>
                                <v-flex xs12 md4>
                                    <v-card class="elevation-0 transparent">
                                        <v-card-text class="text-xs-center">
                                            <v-icon x-large class="blue--text text--lighten-2">color_lens</v-icon>
                                        </v-card-text>
                                        <v-card-title primary-title class="layout justify-center">
                                            <div class="headline text-xs-center">Material Design</div>
                                        </v-card-title>
                                        <v-card-text>
                                            Nos enfocamos en el desarrollo web con los lineamientos de Material Design
                                            proveidos por google,
                                            Para que de esta manera le demos una grata experiencia al usuario final del
                                            proyecto y a los
                                            administradores de la misma.
                                        </v-card-text>
                                    </v-card>
                                </v-flex>
                            <v-flex xs12 md4>
                                <v-card class="elevation-0 transparent">
                                    <v-card-text class="text-xs-center">
                                        <v-icon x-large class="blue--text text--lighten-2">flash_on</v-icon>
                                    </v-card-text>
                                    <v-card-title primary-title class="layout justify-center">
                                        <div class="headline text-xs-center">Desarrollo rápido</div>
                                    </v-card-title>
                                    <v-card-text>
                                        Nuestro equipo de desarrollo implementa novedosos métodos y lineamientos para
                                        hacer el desarrollo mucho
                                        mas ameno y que nuestros clientes inicien en su negocio con una web app
                                        desarrollada realmente rápido.
                                    </v-card-text>
                                </v-card>
                            </v-flex>
                            <v-flex xs12 md4>
                                <v-card class="elevation-0 transparent">
                                    <v-card-text class="text-xs-center">
                                        <v-icon x-large class="blue--text text--lighten-2">build</v-icon>
                                    </v-card-text>
                                    <v-card-title primary-title class="layout justify-center">
                                        <div class="headline text-xs-center">Diseño responsive</div>
                                    </v-card-title>
                                    <v-card-text>
                                        Nuestros diseños estan enfocados en un ambiente multi-plataforma para que
                                        nuestros clientes más exigentes
                                        y usuarios finales puedan acceder a su sitio web o aplicacion desde cualquier
                                        dispositivo con diseño adaptado al dispositivo.
                                    </v-card-text>
                                </v-card>
                            </v-flex>
                        </v-layout>
                        <v-layout row wrap align-center>
                            <v-flex xs12 md4>
                                <v-card class="elevation-0 transparent">
                                    <v-card-text class="text-xs-center">
                                        <img src="../assets/framework-icons/laravel-1.png" alt="Laravel" height="42">
                                    </v-card-text>
                                    <v-card-title primary-title class="layout justify-center">
                                        <div class="headline text-xs-center">Laravel API</div>
                                    </v-card-title>
                                    <v-card-text>
                                        Creamos RESTful API's con laravel, para el manejo y control de todo la data que
                                        se envia y recibe en el servidor.
                                    </v-card-text>
                                </v-card>
                            </v-flex>
                            <v-flex xs12 md4>
                                <v-card class="elevation-0 transparent">
                                    <v-card-text class="text-xs-center">
                                        <img src="../assets/framework-icons/logo_vuejs.png" alt="Vue.js" height="42">
                                    </v-card-text>
                                    <v-card-title primary-title class="layout justify-center">
                                        <div class="headline text-xs-center">Vue.js</div>
                                    </v-card-title>
                                    <v-card-text>
                                        Usamos Vue.js Como unos de nuestros frameworks preferidos para el desarrollo
                                        Front-End en Javascript, Html y Css.
                                    </v-card-text>
                                </v-card>
                            </v-flex>
                            <v-flex xs12 md4>
                                <v-card class="elevation-0 transparent">
                                    <v-card-text class="text-xs-center">
                                        <img src="../assets/framework-icons/angular-icon-1.svg" alt="Angular 4"
                                             height="42">
                                    </v-card-text>
                                    <v-card-title primary-title class="layout justify-center">
                                        <div class="headline text-xs-center">Angular 4</div>
                                    </v-card-title>
                                    <v-card-text>
                                        Experiencia con frameworks de alto desempeño como Angular para atender a las
                                        necesidades de nuestros clientes.
                                    </v-card-text>
                                </v-card>
                            </v-flex>
                        </v-layout>
                    </v-container>
                </v-flex>
            </v-layout>
        </section>

        <section>
            <v-parallax src="static/backs/back2.jpg" height="380">
                <v-layout column align-center justify-center>
                    <div class="headline white--text mb-3">¡El desarrollo web nunca ha sido tan sencillo!</div>
                    <em>Inicia con tu aplicacion web hoy</em>
                    <v-btn
                            class="blue lighten-2 mt-5"
                            dark
                            large
                            href="/Contacto"
                    >
                        Contactar
                    </v-btn>
                </v-layout>
            </v-parallax>
        </section>

        <section>
            <v-container grid-list-xl>
                <v-layout row wrap justify-center class="my-5">
                    <v-flex xs12 sm4>
                        <v-card class="elevation-0 transparent">
                            <v-card-title primary-title class="layout justify-center">
                                <div class="headline">Nuestra empresa</div>
                            </v-card-title>
                            <v-card-text>
                                Somos una empresa dedicada al desarrollo web, con soluciones efectivas incluso para
                                desktop y movil
                                Para así lograr la más grata experiencia a los usuarios finales que consumen la
                                aplicacion.
                                CEO: Joshua Martinez.
                            </v-card-text>
                        </v-card>
                    </v-flex>
                    <v-flex xs12 sm4 offset-sm1>
                        <v-card class="elevation-0 transparent">
                            <v-card-title primary-title class="layout justify-center">
                                <div class="headline">Contactanos</div>
                            </v-card-title>
                            <v-card-text>
                                Empieza tu aplicacion hoy contactandonos
                            </v-card-text>
                            <v-list class="transparent">
                                <v-list-tile>
                                    <v-list-tile-action>
                                        <v-icon class="blue--text text--lighten-2">phone</v-icon>
                                    </v-list-tile-action>
                                    <v-list-tile-content>
                                        <v-list-tile-title>+58 424 233 6927</v-list-tile-title>
                                    </v-list-tile-content>
                                </v-list-tile>
                                <v-list-tile>
                                    <v-list-tile-action>
                                        <v-icon class="blue--text text--lighten-2">place</v-icon>
                                    </v-list-tile-action>
                                    <v-list-tile-content>
                                        <v-list-tile-title>Miranda, Vnzla.</v-list-tile-title>
                                    </v-list-tile-content>
                                </v-list-tile>
                                <v-list-tile>
                                    <v-list-tile-action>
                                        <v-icon class="blue--text text--lighten-2">email</v-icon>
                                    </v-list-tile-action>
                                    <v-list-tile-content>
                                        <v-list-tile-title>joshua@tecnibilds.com.ve</v-list-tile-title>
                                    </v-list-tile-content>
                                </v-list-tile>
                                <v-list-tile>
                                    <v-list-tile-action>
                                        <v-icon class="blue--text text--lighten-2">email</v-icon>
                                    </v-list-tile-action>
                                    <v-list-tile-content>
                                        <v-list-tile-title>skynessj@gmail.com</v-list-tile-title>
                                    </v-list-tile-content>
                                </v-list-tile>
                            </v-list>
                        </v-card>
                    </v-flex>
                </v-layout>
            </v-container>
        </section>
    </v-layout>
</template>

<script>
  export default {
    data () {
      return {}
    }
  }
</script>


