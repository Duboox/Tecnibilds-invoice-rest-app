<style lang="scss">
    .display-2 {
        font-weight: 100;
    }
</style>

<template>
    <v-container>
        <v-layout column align-center justify-center>
            <v-flex xs10 text-xs-center class="mb-5 mt-5">
                <div class="display-2">CONTACTANOS</div>
            </v-flex>
            <v-flex xs10>
                <v-card class="elevation-2 ">
                    <v-container grid-list-md fluid>
                        <v-layout align-content-center justify-center align-center wrap>
                            <v-flex xs10 md10 lg10>
                                <v-form>
                                    <v-layout row wrap>
                                        <v-layout row wrap justify-space-around>
                                            <v-flex xs10 md3 lg3>
                                                <v-text-field
                                                        label="Nombre"
                                                        :counter="25"
                                                        v-model="name"
                                                        required
                                                ></v-text-field>
                                            </v-flex>
                                            <v-flex xs10 md3 lg3>
                                                <v-text-field
                                                        label="Apellido"
                                                        v-model="last_name"
                                                        :counter="25"
                                                        required
                                                ></v-text-field>
                                            </v-flex>
                                            <v-flex xs10 md3 lg3>
                                                <v-text-field
                                                        label="Empresa"
                                                        v-model="company"
                                                        :counter="15"
                                                        required
                                                ></v-text-field>
                                            </v-flex>
                                        </v-layout>
                                    </v-layout>
                                    <v-layout row justify-space-around wrap>
                                        <v-flex xs10 md10 lg10>
                                            <v-text-field
                                                    label="Mensaje"
                                                    v-model="message"
                                                    :counter="1"
                                                    required
                                                    multi-line
                                            ></v-text-field>
                                        </v-flex>
                                    </v-layout>
                                </v-form>
                            </v-flex>
                        </v-layout>
                    </v-container>
                    <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn color="primary" v-on:click="sendContactForm()" flat>Enviar</v-btn>
                    </v-card-actions>
                </v-card>
            </v-flex>
        </v-layout>
    </v-container>
</template>

<script>
  export default {
    data () {
      return {
        name: '',
        last_name: '',
        company: '',
        message: ''
      }
    },
    methods: {
      sendContactForm() {
        let vm = this;

        let form = {
          name: vm.name,
          last_name: vm.last_name,
          company: vm.company,
          message: vm.message
        };
        alert("sent.", form);
      }
    }
  }
</script>


