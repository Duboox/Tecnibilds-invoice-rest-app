<style lang="scss" scoped>
    .display-1 {
        font-weight: 100;
    }

    .display-2 {
        font-weight: 100;
    }

    .page-info {
        padding: 0px 20% 0px;
    }

    .text-frames {
        text-align: center;
    }
</style>

<template>
    <v-layout column wrap>
        <v-flex text-xs-center class="mt-5">
            <img src="../assets/web-development.png" alt="Vuetify.js" class="mb-5" width="60%"/>
            <div class="display-2">DESARROLLO WEB</div>
            <div class="subheading grey--text text--darken-1">¡Globalización para tu empresa!</div>
            <v-divider class="mt-4 mb-4"></v-divider>
            <div class="subheading grey--text text--darken-1 page-info mb-5">Tecnibilds ofrece desarrollo web profesional
                y escalable. Desarrollamos sistemas de manejo de contenido(CMS) para integrar wordpress y otros CMS
                para así obtener la mejor experiencía de contenido editable, Diseñamos soluciones para marcas y compañias
                con una poderosa base de datos y comercio electronico para impulsar tu negocio.
            </div>
            <div class="display-2">FRAMEWORKS Y PLATAFORMAS</div>
        </v-flex>
        <v-flex xs12 class="mt-5">
            <v-container grid-list-xl>
                <v-layout row wrap align-center>
                    <v-flex xs12 sm6 md4 lg3>
                        <v-card class="elevation-0 transparent">
                            <v-card-text class="text-xs-center">
                                <img src="../assets/framework-icons/asp_icon.png" alt="ASP.net"
                                     height="">
                            </v-card-text>
                            <v-card-title primary-title class="layout justify-center">
                                <div class="headline text-xs-center">ASP.NET</div>
                            </v-card-title>
                            <v-card-text class="text-frames">
                                Construimos aplicaciones robustas, seguras y escalables usando la caja de herramientas
                                en Visual Studio.
                            </v-card-text>
                        </v-card>
                    </v-flex>
                    <v-flex xs12 sm6 md4 lg3>
                        <v-card class="elevation-0 transparent">
                            <v-card-text class="text-xs-center">
                                <img src="../assets/framework-icons/php_icon.png" alt="PHP"
                                     height="70">
                            </v-card-text>
                            <v-card-title primary-title class="layout justify-center">
                                <div class="headline text-xs-center">PHP</div>
                            </v-card-title>
                            <v-card-text class="text-frames">
                               Creamos soluciones web adaptadas a las necesidades, usando php, soporte estandard y CMS
                                Customizables.
                            </v-card-text>
                        </v-card>
                    </v-flex>
                    <v-flex xs12 sm6 md4 lg3>
                        <v-card class="elevation-0 transparent">
                            <v-card-text class="text-xs-center">
                                <img src="../assets/framework-icons/rails_icon.png" alt="Rails"
                                     height="70">
                            </v-card-text>
                            <v-card-title primary-title class="layout justify-center">
                                <div class="headline text-xs-center">Ruby on Rails</div>
                            </v-card-title>
                            <v-card-text class="text-frames">
                                Velocidad y agilidad construyendo aplicaciones en Rails obteniendo resultados de mercadeo
                                en muy poco tiempo.
                            </v-card-text>
                        </v-card>
                    </v-flex>
                    <v-flex xs12 sm6 md4 lg3>
                        <v-card class="elevation-0 transparent">
                            <v-card-text class="text-xs-center">
                                <img src="../assets/framework-icons/html_icon.png" alt="HTML 5"
                                     height="70">
                            </v-card-text>
                            <v-card-title primary-title class="layout justify-center">
                                <div class="headline text-xs-center">HTML 5</div>
                            </v-card-title>
                            <v-card-text class="text-frames">
                               Has tu Website completamente compatible con la nueva generación de standars web.
                            </v-card-text>
                        </v-card>
                    </v-flex>
                    <v-flex xs12 sm6 md4 lg3>
                        <v-card class="elevation-0 transparent">
                            <v-card-text class="text-xs-center">
                                <img src="../assets/framework-icons/shopify_icon.png" alt="Shopify" height="70">
                            </v-card-text>
                            <v-card-title primary-title class="layout justify-center">
                                <div class="headline text-xs-center">Shopify</div>
                            </v-card-title>
                            <v-card-text class="text-frames">
                                Facil y rápido para iniciar, crea una tienda online o añade E-Commerce a un sitio existente.
                            </v-card-text>
                        </v-card>
                    </v-flex>
                    <v-flex xs12 sm6 md4 lg3>
                        <v-card class="elevation-0 transparent">
                            <v-card-text class="text-xs-center">
                                <img src="../assets/framework-icons/magento_icon.png" alt="Magento" height="70">
                            </v-card-text>
                            <v-card-title primary-title class="layout justify-center">
                                <div class="headline text-xs-center">Magento</div>
                            </v-card-title>
                            <v-card-text class="text-frames">
                                Ofrece soluciones flexibles que convergen en un gran rango de necesidades de negocios.
                            </v-card-text>
                        </v-card>
                    </v-flex>
                    <v-flex xs12 sm6 md4 lg3>
                        <v-card class="elevation-0 transparent">
                            <v-card-text class="text-xs-center">
                                <img src="../assets/framework-icons/wordpress_icon.png" alt="Wordpress"
                                     height="70">
                            </v-card-text>
                            <v-card-title primary-title class="layout justify-center">
                                <div class="headline text-xs-center">Wordpress</div>
                            </v-card-title>
                            <v-card-text class="text-frames">
                                Puedes manejar blogs y productos. una de las mejoras opciones de CMS en php en software libre.
                            </v-card-text>
                        </v-card>
                    </v-flex>
                    <v-flex xs12 sm6 md4 lg3>
                        <v-card class="elevation-0 transparent">
                            <v-card-text class="text-xs-center">
                                <img src="../assets/framework-icons/joomla_icon.png" alt="Joomla"
                                     height="70">
                            </v-card-text>
                            <v-card-title primary-title class="layout justify-center">
                                <div class="headline text-xs-center">Joomla</div>
                            </v-card-title>
                            <v-card-text class="text-frames">
                                Integra motores de pago efectivamente.
                            </v-card-text>
                        </v-card>
                    </v-flex>
                    <v-flex xs12 sm6 md4 lg3>
                        <v-card class="elevation-0 transparent">
                            <v-card-text class="text-xs-center">
                                <img src="../assets/framework-icons/laravel-1_black.png" alt="Laravel" height="70">
                            </v-card-text>
                            <v-card-title primary-title class="layout justify-center">
                                <div class="headline text-xs-center">Laravel API</div>
                            </v-card-title>
                            <v-card-text class="text-frames">
                                Creamos RESTful API's con laravel, para el manejo y control de todo la data que
                                se envia y recibe en el servidor.
                            </v-card-text>
                        </v-card>
                    </v-flex>
                    <v-flex xs12 sm6 md4 lg3>
                        <v-card class="elevation-0 transparent">
                            <v-card-text class="text-xs-center">
                                <img src="../assets/framework-icons/logo_vuejs_black.png" alt="Vue.js" height="70">
                            </v-card-text>
                            <v-card-title primary-title class="layout justify-center">
                                <div class="headline text-xs-center">Vue.js</div>
                            </v-card-title>
                            <v-card-text class="text-frames">
                                Usamos Vue.js Como unos de nuestros frameworks preferidos para el desarrollo
                                Front-End en Javascript, Html y Css.
                            </v-card-text>
                        </v-card>
                    </v-flex>
                    <v-flex xs12 sm6 md4 lg3>
                        <v-card class="elevation-0 transparent">
                            <v-card-text class="text-xs-center">
                                <img src="../assets/framework-icons/yii_black.png" alt="yii2"
                                     height="70">
                            </v-card-text>
                            <v-card-title primary-title class="layout justify-center">
                                <div class="headline text-xs-center">Yii 2</div>
                            </v-card-title>
                            <v-card-text class="text-frames">
                                Yii 2 es un framework de alto rendimiento para poder satisfacer los requerimientos
                                para el back-end de tu app
                            </v-card-text>
                        </v-card>
                    </v-flex>
                    <v-flex xs12 sm6 md4 lg3>
                        <v-card class="elevation-0 transparent">
                            <v-card-text class="text-xs-center">
                                <img src="../assets/framework-icons/ionic_black.png" alt="Ionic"
                                     height="70">
                            </v-card-text>
                            <v-card-title primary-title class="layout justify-center">
                                <div class="headline text-xs-center">Ionic</div>
                            </v-card-title>
                            <v-card-text class="text-frames">
                                Experiencia con frameworks de alto desempeño para la creación de apps mobiles responsive,
                                realizando apps efectivamente.
                            </v-card-text>
                        </v-card>
                    </v-flex>
                </v-layout>
            </v-container>
        </v-flex>
        <v-flex text-xs-center class="mt-5">
            <div class="display-2">EXPLORA NUESTRO TRABAJO</div>
        </v-flex>
        <v-layout align-center align-content-center  justify-center class="mt-5" wrap>
            <v-flex class="xs12 sm3 md3 lg3">
                <v-btn outline color="indigo" large to="/work">RAILS WORK</v-btn>
            </v-flex>
            <v-flex class="xs12 sm3 md3 lg3">
                <v-btn outline color="indigo" large to="/work">PHP WORK</v-btn>
            </v-flex>
            <v-flex class="xs12 sm3 md3 lg3">
                <v-btn outline color="indigo" large to="/work">WORDPRESS WORK</v-btn>
            </v-flex>
        </v-layout>
        <v-flex text-xs-center xs12 class="mt-5 mb-5">
            <v-card color="light-blue darken-2" class="white--text" flat>
                <v-card-title primary-title>
                    <div class="display-1 ml-5">Cuentanos tu visión</div>
                    <v-layout column>
                        <span class="subheading">Caracas +58 424 233 6927</span>
                        <span class="subheading">Los Teques +58 424 233 6927</span>
                    </v-layout>
                </v-card-title>
            </v-card>
        </v-flex>
    </v-layout>
</template>

<script>
  export default {}
</script>


