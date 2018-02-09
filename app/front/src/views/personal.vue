<style lang="scss">
    .personal-card {
        max-width: 200px;
    }

    .personal-card-media {
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
                               label="Buscar"
                               single-line
                               hide-details
                       ></v-text-field>
                   </v-flex>
                   <v-spacer></v-spacer>
                   <v-btn icon>
                       <v-icon>add</v-icon>
                   </v-btn>
               </v-card-title>
               <v-container fluid grid-list-xl>
                   <v-layout align-center wrap>
                       <v-flex v-for="(person,i) in filteredPersonal" :key="i">
                           <v-card class="ma-3 personal-card">
                               <v-card-media class="personal-card-media">
                                   <img src="http://lorempixel.com/512/512/people" alt="Tecnibilds"/>
                               </v-card-media>
                               <v-card-title primary-title>
                                   <v-layout column align-content-center justify-center align-center>
                                       <h3 class="subheading mb-0">{{ person.name }}</h3>
                                       <div class="caption grey--text">{{ person.email }}</div>
                                   </v-layout>
                               </v-card-title>
                               <v-card-actions class="white">
                                   <div class="caption grey--text">{{ person.cargo }}</div>
                                   <v-spacer></v-spacer>
                                   <v-btn icon>
                                       <v-icon>edit</v-icon>
                                   </v-btn>
                                   <v-btn icon>
                                       <v-icon>delete</v-icon>
                                   </v-btn>
                               </v-card-actions>
                           </v-card>
                       </v-flex>
                   </v-layout>
               </v-container>
           </v-card>
        </v-container>
    </v-layout>
</template>

<script>
  import {mapGetters, mapActions} from 'vuex';

  export default {
    data () {
      return {
        pageTitle: 'Personal',
        search: '',
        personal: [
          {
            picture: '',
            name: 'Joshua Martinez',
            email: 'skynessj@gmail.com',
            cargo: 'Web Developer',
          },
          {
            picture: '',
            name: 'Daniel Rodriguez',
            email: 'asd@example.com',
            cargo: 'CEO',
          },
          {
            picture: '',
            name: 'Pablo Sanchez',
            email: 'asd@example.com',
            cargo: 'Web Designer',
          },
          {
            picture: '',
            name: 'Maria Rodriguez',
            email: 'asd@example.com',
            cargo: 'Obrero',
          },
          {
            picture: '',
            name: 'Karin Kibilds',
            email: 'asd@example.com',
            cargo: 'Project Manager',
          },
          {
            picture: '',
            name: 'Joshua Martinez',
            email: 'skynessj@gmail.com',
            cargo: 'Web Developer',
          },
          {
            picture: '',
            name: 'Daniel Rodriguez',
            email: 'asd@example.com',
            cargo: 'CEO',
          },
          {
            picture: '',
            name: 'Pablo Sanchez',
            email: 'asd@example.com',
            cargo: 'Web Designer',
          },
          {
            picture: '',
            name: 'Maria Rodriguez',
            email: 'asd@example.com',
            cargo: 'Obrero',
          },
          {
            picture: '',
            name: 'Karin Kibilds',
            email: 'asd@example.com',
            cargo: 'Project Manager',
          },
          {
            picture: '',
            name: 'Joshua Martinez',
            email: 'skynessj@gmail.com',
            cargo: 'Web Developer',
          },
          {
            picture: '',
            name: 'Daniel Rodriguez',
            email: 'asd@example.com',
            cargo: 'CEO',
          },
          {
            picture: '',
            name: 'Pablo Sanchez',
            email: 'asd@example.com',
            cargo: 'Web Designer',
          },
          {
            picture: '',
            name: 'Maria Rodriguez',
            email: 'asd@example.com',
            cargo: 'Obrero',
          },
          {
            picture: '',
            name: 'Karin Kibilds',
            email: 'asd@example.com',
            cargo: 'Project Manager',
          },
        ],
      }
    },
    computed: {
      filteredPersonal: function(){
        return this.personal.filter((person) => {
          return person.name.toLowerCase().match(this.search);
        });
      }
    },
  }
</script>


